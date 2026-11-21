local _, R = ...
if not R.chapters then return end

local mainId = "hyjal-direct/main"
local order = {"timbermaw", "winter", "mail", "burrow", "foothills", "wilds", "summit", "den", "satchel"}
local steps, legacy, retired, titles = {}, {}, {}, {}
-- These are the native saved shapes of the public 1.0.0 chapters.
local oldShapes = {
    timbermaw="8-1864774246", winter="13-367938871", mail="5-2007350920",
    burrow="6-3789317242", foothills="19-1056805816", wilds="15-3664734596",
    summit="18-722434449", den="6-3155002072", satchel="10-3605081481",
}
for _, key in ipairs(order) do
    local chapter = R.chapters[key]
    local oldId = "hyjal-direct/" .. key
    legacy[oldId] = {offset = #steps, rows = chapter.steps, shape = oldShapes[key]}
    retired[#retired + 1] = oldId
    local needsHeading = true
    for _, row in ipairs(chapter.steps) do
        for _, goal in ipairs(row.goals) do
            if goal.t == "accept" then titles[goal.quest] = goal.title end
            if needsHeading and not goal.optional then
                row.title = chapter.title .. "｜" .. row.title
                needsHeading = false
            end
        end
        if key == "den" then row.along = "bag-vendor" end
        table.insert(steps, row)
    end
end
steps[#steps].label = "bag-vendor"
for _, row in ipairs(steps) do
    for _, goal in ipairs(row.goals) do
        if goal.quest and not goal.title then goal.title = titles[goal.quest] end
    end
end
table.insert(steps, {
    title = "邮政收尾 · 补到56级",
    note = "如果还差经验，在海加尔西南打死木熊怪、留部族珠。升到56级后，路线会回到永恒峰送信。",
    goals = {R.goal("level", 2482, 23, 69.5, {level=56, grind=252063, npcName="Deadwood Den Guardian"})},
})
assert(Polestar.RegisterGuide({
    id=mainId, pack="hyjal-direct", title="猎萨 · 木喉到海加尔", category="Leveling",
    faction="Horde", classes={"HUNTER","SHAMAN"}, zone=1448, minLevel=50, maxLevel=60,
    version=1, steps=steps, keywords={"海加尔山","木喉","猎萨","背包","Hyjal"},
    why="从费伍德木喉中立到海加尔邮政背包、山上任务和树皮背包，一条路线连续指引。",
}))
Polestar.RetireGuides("hyjal-direct", retired)

-- The engine restores retired open tabs by pack, but their checkmarks and pins
-- use chapter-local indices. Only migrate states from the verified 1.0.0 shape.
Polestar.OnInit(function()
    local state = Polestar.CharState()
    if state.hyjalDirectMerged110 then return end
    local function matching(id)
        local part = legacy[id]
        if part and type(state.shapes) == "table" and state.shapes[id] == part.shape then return part end
    end
    local function keep(store, key, value)
        local target = store[mainId]
        if target == nil then target = {}; store[mainId] = target end
        if type(target) == "table" and target[key] == nil then target[key] = value end
    end
    for _, id in ipairs(retired) do
        local part = matching(id)
        if part then
            local ticks = state.manual[id]
            local skips = state.skipped[id]
            for i, row in ipairs(part.rows) do
                local dest = part.offset + i
                -- The core also records failed conditions as whole-step skips.
                if type(skips) == "table" and skips[i] == true and not row.when then
                    keep(state.skipped, dest, true)
                end
                for j, goal in ipairs(row.goals) do
                    local oldKey, newKey = i .. ":" .. j, dest .. ":" .. j
                    if type(ticks) == "table" and ticks[oldKey] == "tick" then
                        keep(state.manual, newKey, "tick")
                    end
                    if type(skips) == "table" and goal.optional and skips[oldKey] == true then
                        keep(state.skipped, newKey, true)
                    end
                end
            end
        end
    end
    local function mappedPin(id)
        local part = matching(id)
        local pin = part and state.pins[id]
        local s = type(pin) == "table" and pin.step
        if type(s) == "number" and part.rows[s] then return {step = part.offset + s} end
    end
    if type(state.pins) == "table" and not state.pins[mainId] then
        local tabs = type(state.tabs) == "table" and state.tabs or {}
        local pin = mappedPin(tabs[state.activeTab] or state.guide)
        for _, id in ipairs(tabs) do
            if pin then break end
            pin = mappedPin(id)
        end
        state.pins[mainId] = pin
    end
    state.hyjalDirectMerged110 = true
end)


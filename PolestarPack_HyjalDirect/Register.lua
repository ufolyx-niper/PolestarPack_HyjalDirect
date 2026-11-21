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
-- Keep both the elite encounters and the rewards that depend on them off the bag path.
local sideQuest = {
    [91794]=true, [91923]=true, [92169]=true, [92329]=true, [92446]=true,
    [92833]=true, [92959]=true, [93422]=true, [93444]=true, [95273]=true,
    [96255]=true, [96558]=true, [96983]=true,
    -- Group targets and associated drops: the two demons, the cult camp, their follow-ups.
    [96003]=true, [96025]=true, [93584]=true, [92533]=true, [96303]=true,
    [96301]=true, [96322]=true, [93848]=true, [93521]=true,
}
local areaEnd = {foothills="west-arrival", wilds="north-start", summit="bag-vendor"}
local function emit(row, key)
    local side, required = false, false
    for _, goal in ipairs(row.goals) do
        if goal.t == "accept" then titles[goal.quest]=goal.title end
        if (key ~= "errands" and sideQuest[goal.quest]) or (goal.t=="talk" and goal.npc==263757) then
            goal.optional,side = true,true
        end
        if not goal.optional then required=true end
    end
    if key=="den" then row.along="bag-vendor"
    elseif side and not required and not row.along then row.along=areaEnd[key] end
    table.insert(steps,row)
    return required
end
for _, key in ipairs(order) do
    local chapter = R.chapters[key]
    local oldId = "hyjal-direct/" .. key
    local part = {indices={}, rows=chapter.steps, optional={}, shape=oldShapes[key]}
    legacy[oldId]=part
    retired[#retired+1]=oldId
    local needsHeading=true
    for i=0,#chapter.steps do
        if i>0 then
            local row=chapter.steps[i]
            part.indices[i]=#steps+1
            local oldOptional={}
            for k,goal in ipairs(row.goals) do oldOptional[k]=goal.optional end
            part.optional[i]=oldOptional
            if emit(row,key) and needsHeading then
                row.title=chapter.title.."｜"..row.title
                needsHeading=false
            end
        end
        for _,row in ipairs(chapter.additions[i] or {}) do emit(row,key) end
    end
end
local last=steps[legacy["hyjal-direct/satchel"].indices[#R.chapters.satchel.steps]]
last.label="bag-vendor"
table.insert(steps, {
    title = "邮政收尾 · 补到56级",
    note = "如果还差经验，在海加尔西南打死木熊怪、留部族珠。升到56级后，路线会回到永恒峰送信。",
    goals = {R.goal("level", 2482, 23, 69.5, {level=56, grind=252063, npcName="Deadwood Den Guardian"})},
})
for _,row in ipairs(R.afterBags) do emit(row,"errands") end
for _,row in ipairs(steps) do
    for _,goal in ipairs(row.goals) do
        if goal.quest and not goal.title then goal.title=titles[goal.quest] end
    end
end
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
            local ticks = type(state.manual)=="table" and state.manual[id]
            local skips = type(state.skipped)=="table" and state.skipped[id]
            for i, row in ipairs(part.rows) do
                local dest = part.indices[i]
                -- The core also records failed conditions as whole-step skips.
                if type(skips) == "table" and skips[i] == true and not row.when then
                    keep(state.skipped, dest, true)
                end
                for j, goal in ipairs(row.goals) do
                    local oldKey, newKey = i .. ":" .. j, dest .. ":" .. j
                    if type(ticks) == "table" and ticks[oldKey] == "tick" then
                        keep(state.manual, newKey, "tick")
                    end
                    if type(skips) == "table" and part.optional[i][j] and skips[oldKey] == true then
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
        if type(s) == "number" and part.rows[s] then return {step = part.indices[s]} end
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


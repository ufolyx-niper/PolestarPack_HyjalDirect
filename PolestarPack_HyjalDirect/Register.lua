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
    [99670]=true, [96301]=true, [96322]=true, [93848]=true, [93521]=true,
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
    why="从费伍德木喉冷淡通行到海加尔邮政背包、山上任务和树皮背包，一条路线连续指引。",
}))
Polestar.RetireGuides("hyjal-direct", retired)
R.watchTimbermaw(mainId)

-- The engine restores retired open tabs by pack, but their checkmarks and pins
-- use chapter-local indices. Only migrate states from the verified 1.0.0 shape.
-- Translate goal positions only for the exact step keys shipped before this release.
local versions = {["1.1.0"]=true, ["1.2.0"]=true, ["1.2.1"]=true}
local edits = {
    -- 地穴议事处 · 拜见两位长老
    [4063332504] = {key=1677067501, goals={1, 2, {3,4}, 5, 6, 7, 8}},
    -- 营地外采土、打鹿，沿灌木丛做工坊目标
    [4280317824] = {key=359767606, goals={1, 2, 3, 4, 5, {6,7,8}, 9}},
    -- 骨堆 · 取骨髓后回小鬼
    [2645085889] = {key=678563190, goals={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13}},
    -- 月光林地西南 · 与古树交谈，回永夜港
    [3012785758] = {key=973090451, goals={1, 2, 3, 4, 5}},
    -- 西北营地 · 给伤员备草药
    [3824886700] = {key=2858674626, goals={1, 2, 3, 6, 7}},
    -- 寻找三只幼兽
    [3916912461] = {key=1436463886, goals={1, 2, 3, 4}},
    -- 永恒峰 · 哨兵、信使和引兽任务
    [3955561165] = {key=3330417107, goals={{key=1292506980, goal=2}, 1, {key=1292506980, goal=3}}},
    -- 黑刺信使与山脊 · 完成山顶三项差事
    [2774022120] = {key=841691772, goals={{key=2941304974, goal=1}, 1, {key=2941304974, goal=2}}},
    -- 山顶营地 · 分交战果再接后续
    [1292506980] = {key=2868665803, goals={{key=2454403878, goal=1}, 1, {key=2454403878, goal=2}, 4, 5, 6, 7, {key=2454403878, goal=10}, 8}},
    -- 旅店、诺达希尔与永恒之井
    [2941304974] = {key=2645432312, goals={3, 4, 5, 6, {key=2454403878, goal=11}}},
    -- 永恒峰回程 · 回报杰雷曼
    [1353368819] = {key=3664665934, goals={{key=2454403878, goal=8}, 1}},
    -- 永恒峰交任务 · 回山麓隐士收尾
    [2454403878] = {key=3254352448, goals={3, 4, 5, 6, 12, 7, 9, 13, 14}},
}
local chapterEdits = {
    ["burrow/4"] = 4063332504,
    ["foothills/5"] = 4280317824,
    ["foothills/11"] = 2645085889,
    ["foothills/16"] = 3012785758,
    ["wilds/3"] = 3824886700,
    ["wilds/9"] = 3916912461,
    ["summit/9"] = 3955561165,
    ["summit/13"] = 2774022120,
    ["summit/15"] = 1292506980,
    ["summit/16"] = 2941304974,
    ["summit/18"] = 2454403878,
}
-- v1.0.0 allowed individual skips only on these optional slots of edited rows.
local optionalInV1 = {
    [4280317824]=7, [3955561165]=3, [2774022120]=3, [1292506980]=3,
}
local splitRows = {}
for key, edit in pairs(edits) do
    for _, goal in ipairs(edit.goals) do
        if type(goal) == "table" and goal.key then
            splitRows[key], splitRows[goal.key] = true, true
        end
    end
end

-- A whole skip on a re-grouped row belongs only to the old work. Bring it
-- across as individual, reversible checkmarks so newly arrived tasks remain open.
local function goalDestinations(source, index, editsByKey, visit)
    local dest = editsByKey and editsByKey.goals[index] or nil
    if not editsByKey then visit(source, index)
    elseif type(dest) == "number" then visit(source, dest)
    elseif type(dest) == "table" and dest.key then visit(dest.key, dest.goal)
    elseif type(dest) == "table" then
        for _, j in ipairs(dest) do visit(source, j) end
    end
end

local function migrateObjectives(state, id)
    local version = state.shapeVersions and state.shapeVersions[id]
    local keys = state.stepKeys and state.stepKeys[id]
    if not versions[version] or type(keys) ~= "table" then return end
    local oldRows = {}
    for i, key in ipairs(keys) do oldRows[key] = i end
    local checked = {}
    for _, field in ipairs({"manual", "skipped"}) do
        local data = state[field] and state[field][id]
        if type(data) == "table" then
            local moved = {}
            for key, value in pairs(data) do
                local i, j
                if type(key) == "string" then i, j = key:match("^(%d+):(%d+)$") end
                local oldKey = keys[tonumber(i) or key]
                local edit = edits[oldKey]
                if edit and j then
                    data[key] = nil
                    goalDestinations(oldKey, tonumber(j), edit, function(target, goal)
                        local row = oldRows[target]
                        if row then moved[row..":"..goal] = value end
                    end)
                elseif field == "skipped" and type(key) == "number" and value and splitRows[oldKey] then
                    data[key] = nil
                    for index in ipairs(edit.goals) do
                        goalDestinations(oldKey, index, edit, function(target, goal)
                            local row = oldRows[target]
                            if row then checked[row..":"..goal] = "tick" end
                        end)
                    end
                end
            end
            for key, value in pairs(moved) do data[key] = value end
        end
    end
    if next(checked) then
        state.manual = state.manual or {}
        local marks = state.manual[id] or {}
        state.manual[id] = marks
        for key, value in pairs(checked) do marks[key] = marks[key] or value end
    end
    for i, key in ipairs(keys) do
        if edits[key] then keys[i] = edits[key].key end
    end
end

Polestar.OnInit(function()
    local state = Polestar.CharState()
    migrateObjectives(state, mainId)
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
    local chapterTargets = {}
    for chapterId, part in pairs(legacy) do
        local name = chapterId:sub(#"hyjal-direct/" + 1)
        for i, dest in ipairs(part.indices) do
            local key = chapterEdits[name.."/"..i]
            if key then chapterTargets[key] = dest end
        end
    end
    for _, id in ipairs(retired) do
        local part = matching(id)
        if part then
            local ticks = type(state.manual)=="table" and state.manual[id]
            local skips = type(state.skipped)=="table" and state.skipped[id]
            for i, row in ipairs(part.rows) do
                local dest = part.indices[i]
                local chapter = id:sub(#"hyjal-direct/" + 1)
                local oldKey = chapterEdits[chapter.."/"..i]
                local edit = edits[oldKey]
                -- A failed when can also have written a numeric skip in the old core.
                local whole = type(skips) == "table" and skips[i] == true and not row.when
                if whole and not splitRows[oldKey] then keep(state.skipped, dest, true) end
                local n = edit and #edit.goals or #row.goals
                for j = 1, n do
                    local old = i..":"..j
                    local tick = (whole and splitRows[oldKey]) or (type(ticks) == "table" and ticks[old] == "tick")
                    local optional = (not edit and part.optional[i][j]) or optionalInV1[oldKey] == j
                    local skip = optional and type(skips) == "table" and skips[old] == true
                    if tick or skip then
                        goalDestinations(oldKey, j, edit, function(key, goal)
                            local target = key == oldKey and dest or chapterTargets[key]
                            if target then
                                local targetKey = target..":"..goal
                                if tick then keep(state.manual, targetKey, "tick") end
                                if skip then keep(state.skipped, targetKey, true) end
                            end
                        end)
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


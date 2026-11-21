local addon, R = ...
if not Polestar.RegisterPack({
    addon = addon, id = "hyjal-direct", title = "猎萨 · 木喉到海加尔",
    author = "Codex", version = "1.0.0", format = 11, license = "GPL-3.0-only",
    source = "Polestar, QuestieDB Forever and Ati's community guide. See SOURCES.txt.",
}) then return end

R.chapters = {}
function R.chapter(key, title, why, map, level, nextKey)
    local guide = {
        id = "hyjal-direct/" .. key, pack = "hyjal-direct", title = title,
        category = "Leveling", faction = "Horde", classes = {"HUNTER", "SHAMAN"},
        zone = map, minLevel = level, maxLevel = 60, version = 1, why = why,
        keywords = {"海加尔山", "木喉", "猎萨", "背包", "Hyjal"}, steps = {},
        next = nextKey and ("hyjal-direct/" .. nextKey),
    }
    R.chapters[key] = guide
    return function(titleText, note, goals, conditions)
        guide.steps[#guide.steps + 1] = {title = titleText, note = note, goals = goals, when = conditions}
    end
end

function R.goal(kind, map, x, y, values)
    values.t, values.map, values.x, values.y = kind, map, x, y
    return values
end

function R.contact(kind, quest, title, npc, name, map, x, y, minLevel)
    return R.goal(kind, map, x, y, {quest = quest, title = title, npc = npc, npcName = name, minLevel = minLevel})
end

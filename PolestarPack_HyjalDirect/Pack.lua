local addon, R = ...
if not Polestar.RegisterPack({
    addon = addon, id = "hyjal-direct", title = "猎萨 · 木喉到海加尔",
    author = "Codex", version = "1.1.0", format = 11, license = "GPL-3.0-only",
    source = "Polestar, QuestieDB Forever and Ati's community guide. See SOURCES.txt.",
}) then return end

R.chapters = {}
function R.chapter(key, title)
    local chapter = {title = title, steps = {}}
    R.chapters[key] = chapter
    return function(stepTitle, note, goals, conditions)
        table.insert(chapter.steps, {title = stepTitle, note = note, goals = goals, when = conditions})
    end
end

function R.goal(kind, map, x, y, values)
    values.t, values.map, values.x, values.y = kind, map, x, y
    return values
end

function R.contact(kind, quest, title, npc, name, map, x, y, minLevel)
    return R.goal(kind, map, x, y, {quest = quest, title = title, npc = npc, npcName = name, minLevel = minLevel})
end

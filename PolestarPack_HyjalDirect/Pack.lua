local addon, R = ...
if not Polestar.RegisterPack({
    addon = addon, id = "hyjal-direct", title = "猎萨 · 木喉到海加尔",
    author = "Codex", version = "1.2.2", format = 11, license = "GPL-3.0-only",
    source = "Polestar, QuestieDB Forever and Ati's community guide. See SOURCES.txt.",
}) then return end

R.chapters = {}
function R.chapter(key, title)
    local chapter = {title = title, steps = {}, additions = {}}
    R.chapters[key] = chapter
    -- Original positions are saved by 1.0 clients. Insert new stops between them.
    local function original(stepTitle, note, goals, conditions)
        local row = {title=stepTitle, note=note, goals=goals, when=conditions}
        table.insert(chapter.steps, row)
        return row
    end
    local function extra(stepTitle, note, goals, along)
        local after = #chapter.steps
        local additions = chapter.additions[after] or {}
        chapter.additions[after] = additions
        table.insert(additions, {title=stepTitle, note=note, goals=goals, along=along})
    end
    return original, extra
end

function R.goal(kind, map, x, y, values)
    values.t, values.map, values.x, values.y = kind, map, x, y
    return values
end

function R.contact(kind, quest, title, npc, name, map, x, y, minLevel)
    return R.goal(kind, map, x, y, {quest = quest, title = title, npc = npc, npcName = name, minLevel = minLevel})
end

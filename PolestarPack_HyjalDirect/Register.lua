local _, R = ...
if not R.chapters then return end
local titles = {}
for _, chapter in pairs(R.chapters) do
    for _, step in ipairs(chapter.steps) do
        for _, goal in ipairs(step.goals) do
            if goal.t == "accept" then titles[goal.quest] = goal.title end
        end
    end
end
for _, chapter in pairs(R.chapters) do
    for _, step in ipairs(chapter.steps) do
        for _, goal in ipairs(step.goals) do
            if goal.quest and not goal.title then goal.title = titles[goal.quest] end
        end
    end
end
for _, key in ipairs({"timbermaw", "winter", "mail", "burrow", "foothills", "wilds", "summit", "satchel", "den"}) do
    assert(Polestar.RegisterGuide(R.chapters[key]))
end


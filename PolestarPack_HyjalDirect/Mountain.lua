local _, R = ...
if not R.chapters then return end
local s

s = R.chapter("foothills","腐化山麓")
s("山麓东南 · 路边齿轮与隐士", "从山口沿西南山路找松动的齿轮，交给住在小屋里的隐士。", {
    { t = "accept", quest = 94479, title = "变废为宝", object = 650234, objName = "Loose Cog", map = 2482, x = 75.3, y = 77.34, minLevel = 54 },
    { t = "turnin", quest = 91952, title = "腐化之源", npc = 256222, npcName = "Ketharas", map = 2482, x = 73.27, y = 81.7, optional = true },
    { t = "turnin", quest = 94479, title = "变废为宝", npc = 256222, npcName = "Ketharas", map = 2482, x = 73.27, y = 81.7 },
    { t = "accept", quest = 95568, title = "新一季的种子", npc = 256222, npcName = "Ketharas", map = 2482, x = 73.27, y = 81.7, minLevel = 54 },
    { t = "accept", quest = 95569, title = "雏鸟的希望", npc = 256222, npcName = "Ketharas", map = 2482, x = 73.27, y = 81.7, minLevel = 54 },
    { t = "accept", quest = 96796, title = "林间工坊", npc = 256222, npcName = "Ketharas", map = 2482, x = 73.27, y = 81.7, pre = { 94479 }, minLevel = 54 },
})
s("往东北坡采种子和枭蛋，再回小屋", nil, {
    { t = "collect", quest = 95568, title = "新一季的种子", item = 260176, count = 10, oi = 1, itemName = "未受污染的种子", map = 2482, x = 74, y = 79 },
    { t = "collect", quest = 95569, title = "雏鸟的希望", item = 269920, count = 12, oi = 1, itemName = "海加尔猫头鹰蛋", map = 2482, x = 74, y = 79, fromId = 644820, fromKind = "object", from = "Hyjal Owl Egg" },
    { t = "turnin", quest = 95568, title = "新一季的种子", npc = 256222, npcName = "Ketharas", map = 2482, x = 73.27, y = 81.7 },
    { t = "turnin", quest = 95569, title = "雏鸟的希望", npc = 256222, npcName = "Ketharas", map = 2482, x = 73.27, y = 81.7 },
    { t = "accept", quest = 93747, title = "战火中新生的绿意", npc = 256222, npcName = "Ketharas", map = 2482, x = 73.27, y = 81.7, pre = { 95568 }, minLevel = 54 },
    { t = "accept", quest = 93759, title = "大自然的馈赠", npc = 256222, npcName = "Ketharas", map = 2482, x = 73.27, y = 81.7, preAll = { 94479, 95568, 95569 }, minLevel = 54 },
})
s("西北坡的工坊 · 开材料与零件任务", "保留发往永望镇的零件单，留到月光林地回来时交。", {
    { t = "turnin", quest = 96796, title = "林间工坊", npc = 249235, npcName = "Kaylaena Springwhisper", map = 2482, x = 60.01, y = 61.36 },
    { t = "accept", quest = 92594, title = "姑且算作引火物", npc = 249235, npcName = "Kaylaena Springwhisper", map = 2482, x = 60.01, y = 61.36, minLevel = 54 },
    { t = "accept", quest = 92008, title = "优质零件", npc = 249235, npcName = "Kaylaena Springwhisper", map = 2482, x = 60.01, y = 61.36, minLevel = 54 },
})
s("山麓航点旁 · 古树哨站接伤药和狩猎", "苦涩的塞拉斯特鲁斯是精英，两人按战力决定是否接。", {
    { t = "accept", quest = 91754, title = "敷上一点泥土", npc = 248367, npcName = "Hyacinth", map = 2482, x = 54.01, y = 84.24, minLevel = 54 },
    { t = "accept", quest = 91755, title = "以叶包扎", npc = 248367, npcName = "Hyacinth", map = 2482, x = 54.01, y = 84.24, minLevel = 54 },
    { t = "accept", quest = 91923, title = "苦涩的塞拉斯特鲁斯", npc = 265586, npcName = "Thylaen", map = 2482, x = 54.73, y = 84.6, optional = true, minLevel = 54 },
})
s("营地外采土、打鹿，沿灌木丛做工坊目标", "采野草、杀灌木和雄鹿。带种子的角色按日志对灌木使用任务物品；精英巡逻单拉。", {
    { t = "collect", quest = 91754, title = "敷上一点泥土", item = 247889, count = 6, oi = 1, itemName = "纯净的土壤", map = 2482, x = 56.5, y = 83.5, fromId = 562377, fromKind = "object", from = "Untainted Soil" },
    { t = "collect", quest = 93759, title = "大自然的馈赠", item = 251641, count = 2, oi = 1, itemName = "海加尔鹿肉排", map = 2482, x = 56.5, y = 83.5, fromId = 248041, fromKind = "npc", from = "Hyjal Stag" },
    { t = "kill", quest = 92594, title = "姑且算作引火物", npc = 248395, count = 15, oi = 1, target = "Tainted Shrubbery", map = 2482, x = 65.55, y = 73.85 },
    { t = "collect", quest = 91755, title = "以叶包扎", item = 247892, count = 12, oi = 1, itemName = "翠绿的叶子", map = 2482, x = 65.55, y = 73.85, fromId = 248395, fromKind = "npc", from = "Tainted Shrubbery" },
    { t = "collect", quest = 93759, title = "大自然的馈赠", item = 267289, count = 6, oi = 2, itemName = "血色飞镖块茎", map = 2482, x = 59.5, y = 73.5, fromId = 626685, fromKind = "object", from = "Scarlet Dart Tuber" },
    { t = "complete", quest = 93747, title = "战火中新生的绿意", map = 2482, x = 70.4, y = 70.7 },
    { t = "collect", quest = 91923, title = "苦涩的塞拉斯特鲁斯", item = 282028, oi = 1, itemName = "塞拉斯特鲁斯的断叶", map = 2482, x = 69.66, y = 72.34, fromId = 249051, fromKind = "npc", from = "Celastrus the Bitter", optional = true },
})
s("隐士小屋和石碑 · 安葬遗骸", "石碑在小屋西侧。用完任务物品再回隐士处接信。", {
    { t = "turnin", quest = 93747, title = "战火中新生的绿意", npc = 256222, npcName = "Ketharas", map = 2482, x = 73.27, y = 81.7 },
    { t = "turnin", quest = 93759, title = "大自然的馈赠", npc = 256222, npcName = "Ketharas", map = 2482, x = 73.27, y = 81.7 },
    { t = "accept", quest = 95611, title = "致敬仪式", npc = 256222, npcName = "Ketharas", map = 2482, x = 73.27, y = 81.7, pre = { 93759 }, minLevel = 54 },
    { t = "complete", quest = 95611, title = "致敬仪式", map = 2482, x = 66.7, y = 84.3 },
    { t = "turnin", quest = 95611, title = "致敬仪式", npc = 256222, npcName = "Ketharas", map = 2482, x = 73.27, y = 81.7 },
    { t = "accept", quest = 90487, title = "古老的盟友", npc = 256222, npcName = "Ketharas", map = 2482, x = 73.27, y = 81.7, preAll = { 93747, 95611 }, minLevel = 54 },
})
s("古树哨站 · 给伤员敷药", "对受伤古树使用药膏。愿意打精英时再接腐化古树，双人扛不住可跳过这条。", {
    { t = "turnin", quest = 90487, title = "古老的盟友", npc = 248366, npcName = "Fraxinus", map = 2482, x = 53.59, y = 84.53 },
    { t = "turnin", quest = 91754, title = "敷上一点泥土", npc = 248367, npcName = "Hyacinth", map = 2482, x = 54.01, y = 84.24 },
    { t = "turnin", quest = 91755, title = "以叶包扎", npc = 248367, npcName = "Hyacinth", map = 2482, x = 54.01, y = 84.24 },
    { t = "accept", quest = 91770, title = "树皮试炼", npc = 248367, npcName = "Hyacinth", map = 2482, x = 54.01, y = 84.24, preAll = { 91754, 91755 }, minLevel = 54 },
    { t = "complete", quest = 91770, title = "树皮试炼", map = 2482, x = 53.4, y = 84.3 },
    { t = "turnin", quest = 91770, title = "树皮试炼", npc = 248366, npcName = "Fraxinus", map = 2482, x = 53.59, y = 84.53 },
    { t = "accept", quest = 95766, title = "羽翼伙伴", npc = 248366, npcName = "Fraxinus", map = 2482, x = 53.59, y = 84.53, pre = { 91770 }, minLevel = 54 },
    { t = "turnin", quest = 91923, title = "苦涩的塞拉斯特鲁斯", npc = 265586, npcName = "Thylaen", map = 2482, x = 54.73, y = 84.6, optional = true },
    { t = "accept", quest = 92959, title = "濒死的古树", npc = 248366, npcName = "Fraxinus", map = 2482, x = 53.59, y = 84.53, pre = { 91770 }, optional = true, minLevel = 55 },
    { t = "complete", quest = 92959, title = "濒死的古树", map = 2482, x = 63.1, y = 73.8, optional = true },
    { t = "turnin", quest = 92959, title = "濒死的古树", npc = 248366, npcName = "Fraxinus", map = 2482, x = 53.59, y = 84.53, optional = true },
})
s("灰烬营地南 · 乌鸦和小鬼", nil, {
    { t = "turnin", quest = 95766, title = "羽翼伙伴", npc = 257753, npcName = "Curious Crow", map = 2482, x = 48.16, y = 85.72 },
    { t = "accept", quest = 95317, title = "记录、记录、再记录", npc = 257753, npcName = "Curious Crow", map = 2482, x = 48.16, y = 85.72, minLevel = 54 },
    { t = "accept", quest = 95320, title = "好奇的问题", npc = 257753, npcName = "Curious Crow", map = 2482, x = 48.16, y = 85.72, minLevel = 54 },
    { t = "turnin", quest = 95320, title = "好奇的问题", npc = 263757, npcName = "Felflick", map = 2482, x = 49.3, y = 77.1 },
    { t = "accept", quest = 95318, title = "灰烬的滋味", npc = 263757, npcName = "Felflick", map = 2482, x = 49.3, y = 77.1, pre = { 95320 }, minLevel = 54 },
})
s("灰烬营地 · 实验笔记与水晶", "同时拾取记录、清营地目标。凑齐先回小鬼接后续。", {
    { t = "kill", quest = 95318, title = "灰烬的滋味", npc = 260422, count = 12, oi = 1, target = "Ashen Acolyte", map = 2482, x = 49.08, y = 78.3 },
    { t = "collect", quest = 95317, title = "记录、记录、再记录", item = 274396, count = 12, oi = 1, itemName = "邪能灰烬实验笔记", map = 2482, x = 49.08, y = 78.3, fromId = 260422, fromKind = "npc", from = "Ashen Acolyte" },
    { t = "turnin", quest = 95318, title = "灰烬的滋味", npc = 263757, npcName = "Felflick", map = 2482, x = 49.3, y = 77.1 },
    { t = "accept", quest = 95319, title = "采集结晶", npc = 263757, npcName = "Felflick", map = 2482, x = 49.3, y = 77.1, pre = { 95318 }, minLevel = 54 },
    { t = "collect", quest = 95319, title = "采集结晶", item = 274412, count = 8, oi = 1, itemName = "邪能软泥结晶", map = 2482, x = 46.9, y = 74.4, fromId = 637622, fromKind = "object", from = "Fel-Slime Crystal" },
    { t = "collect", quest = 95319, title = "采集结晶", item = 268990, count = 1, oi = 2, itemName = "无瑕的邪能软泥结晶", map = 2482, x = 48.1, y = 82.7, fromId = 652442, fromKind = "object", from = "Pristine Fel-Slime Crystal" },
})
s("乌鸦与小鬼 · 松果、黏液和术士", "先带着黏液和松果目标继续走，后面交一起。", {
    { t = "turnin", quest = 95317, title = "记录、记录、再记录", npc = 257753, npcName = "Curious Crow", map = 2482, x = 48.16, y = 85.72 },
    { t = "accept", quest = 95380, title = "丰饶之源", npc = 257753, npcName = "Curious Crow", map = 2482, x = 48.16, y = 85.72, pre = { 95317 }, minLevel = 54 },
    { t = "accept", quest = 96262, title = "刺手的松果", npc = 257753, npcName = "Curious Crow", map = 2482, x = 48.16, y = 85.72, pre = { 95317 }, minLevel = 54 },
    { t = "turnin", quest = 95319, title = "采集结晶", npc = 263757, npcName = "Felflick", map = 2482, x = 49.3, y = 77.1 },
    { t = "accept", quest = 95378, title = "多头蛇之首", npc = 263757, npcName = "Felflick", map = 2482, x = 49.3, y = 77.1, pre = { 95319 }, minLevel = 54 },
    { t = "accept", quest = 95379, title = "甜美的复仇", npc = 263757, npcName = "Felflick", map = 2482, x = 49.3, y = 77.1, pre = { 95319 }, minLevel = 54 },
    { t = "collect", quest = 95378, title = "多头蛇之首", item = 273291, oi = 1, itemName = "提娅哈·暗誓的骨头", map = 2482, x = 47.54, y = 70.37, fromId = 260444, fromKind = "npc", from = "Tyaeha Darkoath" },
    { t = "collect", quest = 95378, title = "多头蛇之首", item = 273292, oi = 2, itemName = "达兹卡·影眠的骨头", map = 2482, x = 46.2, y = 70.34, fromId = 260443, fromKind = "npc", from = "Dazka Shadowsleep" },
    { t = "collect", quest = 95378, title = "多头蛇之首", item = 273290, count = 1, oi = 3, itemName = "弗雷兹利·砰哨的骨头", map = 2482, x = 42.47, y = 72.63, fromId = 260818, fromKind = "npc", from = "Frezzlie Popwhiz" },
    { t = "kill", quest = 95379, title = "甜美的复仇", npc = 260440, count = 1, oi = 1, target = "Brashann Grimdark", map = 2482, x = 47.36, y = 68.71 },
    { t = "turnin", quest = 95378, title = "多头蛇之首", npc = 263757, npcName = "Felflick", map = 2482, x = 49.3, y = 77.1 },
    { t = "turnin", quest = 95379, title = "甜美的复仇", npc = 263757, npcName = "Felflick", map = 2482, x = 49.3, y = 77.1 },
    { t = "accept", quest = 96435, title = "应有的结局", npc = 263757, npcName = "Felflick", map = 2482, x = 49.3, y = 77.1, pre = { 95378 }, minLevel = 54 },
})
s("骨堆 · 取骨髓后回小鬼", "处理骨堆再清怪。交骨髓后和小鬼谈妥，带消息给乌鸦。", {
    { t = "complete", quest = 96435, title = "应有的结局", map = 2482, x = 40.8, y = 80.3 },
    { t = "turnin", quest = 96435, title = "应有的结局", object = 652449, objName = "Bone Pile", map = 2482, x = 40.67, y = 80.19 },
    { t = "accept", quest = 96255, title = "聚合骨髓", object = 652449, objName = "Bone Pile", map = 2482, x = 40.67, y = 80.19, pre = { 96435 }, minLevel = 54 },
    { t = "kill", quest = 96255, title = "聚合骨髓", npc = 264306, count = 1, oi = 1, target = "Awakened Fel Ash Slime", map = 2482, x = 40.69, y = 80.27 },
    { t = "collect", quest = 96262, title = "刺手的松果", item = 273304, count = 10, oi = 1, itemName = "刺手的松果", map = 2482, x = 40, y = 83.5, fromId = 651048, fromKind = "object", from = "Prickly Pinecone" },
    { t = "turnin", quest = 96255, title = "聚合骨髓", npc = 263757, npcName = "Felflick", map = 2482, x = 49.3, y = 77.1 },
    { t = "accept", quest = 96322, title = "苦涩的复仇", npc = 263757, npcName = "Felflick", map = 2482, x = 49.3, y = 77.1, pre = { 96255 }, minLevel = 54 },
    { t = "talk", npc = 263757, npcName = "Felflick", map = 2482, x = 49.3, y = 77.1 },
    { t = "collect", quest = 95380, title = "丰饶之源", item = 273008, count = 8, oi = 1, itemName = "邪能软泥", map = 2482, x = 48.01, y = 81.9, fromId = 243509, fromKind = "npc", from = "Noxious Slime" },
    { t = "turnin", quest = 95380, title = "丰饶之源", npc = 257753, npcName = "Curious Crow", map = 2482, x = 48.16, y = 85.72 },
    { t = "turnin", quest = 96262, title = "刺手的松果", npc = 257753, npcName = "Curious Crow", map = 2482, x = 48.16, y = 85.72 },
    { t = "accept", quest = 95316, title = "实验方法", npc = 257753, npcName = "Curious Crow", map = 2482, x = 48.16, y = 85.72, preAll = { 95380, 96262 }, minLevel = 54 },
    { t = "turnin", quest = 96322, title = "苦涩的复仇", npc = 257753, npcName = "Curious Crow", map = 2482, x = 48.16, y = 85.72 },
})
s("灰烬营地四处工作台 · 做实验", "依次到黏液、炼金、疾病和容器台互动，以任务日志计数为准，回乌鸦接部落哨站引导。", {
    { t = "goto", text = "Slime Workstation", map = 2482, x = 43.4, y = 76.2 },
    { t = "goto", text = "Alchemy Workstation", map = 2482, x = 44.3, y = 72.5 },
    { t = "goto", text = "Disease Workstation", map = 2482, x = 46.6, y = 68 },
    { t = "goto", text = "Vessel Workstation", map = 2482, x = 49.6, y = 69.6 },
    { t = "complete", quest = 95316, title = "实验方法" },
}, {{k="turnedin", q=95316, neg=true}, {k="complete", q=95316, neg=true}})
s("回乌鸦 · 接西部哨站口信",nil,{
    { t = "turnin", quest = 95316, title = "实验方法", npc = 257753, npcName = "Curious Crow", map = 2482, x = 48.16, y = 85.72 },
    { t = "accept", quest = 94782, title = "西部哨站", npc = 257753, minLevel = 54, npcName = "Curious Crow", map = 2482, x = 48.16, y = 85.72, pre = { 95316 } },
})
s("垂死的荒野之神 · 返回乌鸦与隐士", nil, {
    { t = "accept", quest = 96321, title = "垂死的神灵", npc = 278305, npcName = "Velician", map = 2482, x = 36.65, y = 78.27, minLevel = 54 },
    { t = "turnin", quest = 96321, title = "垂死的神灵", npc = 257753, npcName = "Curious Crow", map = 2482, x = 48.16, y = 85.72 },
    { t = "accept", quest = 96131, title = "石老情长", npc = 257753, npcName = "Curious Crow", map = 2482, x = 48.16, y = 85.72, pre = { 96321 }, minLevel = 54 },
    { t = "turnin", quest = 96131, title = "石老情长", npc = 256222, npcName = "Ketharas", map = 2482, x = 73.27, y = 81.7 },
    { t = "accept", quest = 92612, title = "来自月光林地的援助", npc = 256222, npcName = "Ketharas", map = 2482, x = 73.27, y = 81.7, pre = { 96131 }, minLevel = 54 },
})
s("月光林地 · 永夜港见德迪利特", "有部落航线就飞月光林地；未学就从永望镇向西穿木喉洞，分叉走月光林地，在永夜港见人。", {
    { t = "turnin", quest = 92612, title = "来自月光林地的援助", npc = 11802, npcName = "德迪利特·星焰", map = 1450, x = 56.11, y = 30.55 },
    { t = "accept", quest = 96209, title = "古树奥罗凯", npc = 11802, npcName = "德迪利特·星焰", map = 1450, x = 56.15, y = 30.71, pre = { 92612 }, minLevel = 54 },
})
s("月光林地西南 · 与古树交谈，回永夜港", "与奥罗凯交谈观看事件，结束后回德迪利特；拿到契约再返海加尔。", {
    { t = "turnin", quest = 96209, title = "古树奥罗凯", npc = 216289, npcName = "奥洛凯", map = 1450, x = 41.45, y = 43.63, f = "e" },
    { t = "accept", quest = 95006, title = "被盗的力量", npc = 216289, npcName = "奥洛凯", map = 1450, x = 41.45, y = 43.63, f = "e", pre = { 96209 }, minLevel = 54 },
    { t = "talk", npc = 216289, npcName = "奥洛凯", map = 1450, x = 41.45, y = 43.63, f = "e" },
    { t = "turnin", quest = 95006, title = "被盗的力量", npc = 11802, npcName = "德迪利特·星焰", map = 1450, x = 56.15, y = 30.71 },
    { t = "accept", quest = 93773, title = "契约", npc = 11802, npcName = "德迪利特·星焰", map = 1450, x = 56.15, y = 30.71, pre = { 95006 }, minLevel = 54 },
})
s("永望镇 · 工坊的定时快递", "先确认已开永望镇和山麓航点。接箱后立即飞山麓，骑往工坊交货。超时放弃快递，回永望镇重新领。", {
    { t = "turnin", quest = 92008, title = "优质零件", npc = 228216, npcName = "Nami", map = 1452, x = 61.33, y = 36.92, f = "e" },
    { t = "accept", quest = 92009, title = "工坊急送箱", npc = 228216, npcName = "Nami", map = 1452, x = 61.33, y = 36.92, f = "e", pre = { 92008 }, minLevel = 54 },
})
s("山麓工坊 · 交箱与引火物", "从山麓航点向东北上坡，到工坊旁放好箱子再交。带上废墟零件任务去北区。", {
    { t = "complete", quest = 92009, title = "工坊急送箱", map=2482, x=60.4, y=62 },
    { t = "turnin", quest = 92009, title = "工坊急送箱", npc = 249235, npcName = "Kaylaena Springwhisper", map = 2482, x = 60.01, y = 61.36 },
    { t = "turnin", quest = 92594, title = "姑且算作引火物", npc = 249235, npcName = "Kaylaena Springwhisper", map = 2482, x = 60.01, y = 61.36 },
    { t = "accept", quest = 92011, title = "翻找废墟", npc = 249235, npcName = "Kaylaena Springwhisper", map = 2482, x = 60.01, y = 61.36, pre = { 92009 }, minLevel = 54 },
})
s("隐士与乌鸦 · 把契约带回山上", nil, {
    { t = "turnin", quest = 93773, title = "契约", npc = 256222, npcName = "Ketharas", map = 2482, x = 73.27, y = 81.7 },
    { t = "accept", quest = 96930, title = "任性的乌鸦", npc = 256222, npcName = "Ketharas", map = 2482, x = 73.27, y = 81.7, pre = { 93773 }, minLevel = 54 },
    { t = "accept", quest = 92171, title = "飞向高处", npc = 256222, npcName = "Ketharas", map = 2482, x = 73.27, y = 81.7, pre = { 93773 }, minLevel = 54 },
    { t = "turnin", quest = 96930, title = "任性的乌鸦", npc = 257753, npcName = "Curious Crow", map = 2482, x = 48.16, y = 85.72 },
    { t = "accept", quest = 96931, title = "向山上进发", npc = 257753, npcName = "Curious Crow", map = 2482, x = 48.16, y = 85.72, pre = { 96930 }, minLevel = 54 },
})

s = R.chapter("wilds","西北哨站与神殿")
s("西北部落哨站 · 向两人报到", "山口引导在奥尔塔克处交，得200树皮声望。乌鸦的引导交泽特甘。先前没接引导时，可先做哨站当地任务。", {
    { t = "turnin", quest = 94782, title = "西部哨站", npc = 244511, npcName = "Zet'gan", map = 2482, x = 13.92, y = 54.86 },
    { t = "turnin", quest = 96830, title = "远视指引", npc = 244512, npcName = "Ortak Lomgok", map = 2482, x = 12.94, y = 52.88 },
    { t = "accept", quest = 92592, title = "最后的死亡", npc = 244511, minLevel = 57, npcName = "Zet'gan", map = 2482, x = 13.82, y = 54.57 },
    { t = "accept", quest = 95026, title = "清除疫病", npc = 244511, minLevel = 54, npcName = "Zet'gan", map = 2482, x = 13.82, y = 54.57 },
    { t = "accept", quest = 92609, title = "飞舞的羽毛", npc = 244511, minLevel = 54, npcName = "Zet'gan", map = 2482, x = 13.82, y = 54.57 },
})
s("部落哨站 · 草药和旧旗", "旗帜在北面达埃古恩废墟，留到后面去废墟时一起做。", {
    { t = "accept", quest = 96616, title = "疗愈伤者的草药", npc = 244512, npcName = "Ortak Lomgok", map = 2482, x = 12.9, y = 52.9, minLevel = 54 },
    { t = "accept", quest = 91794, title = "先祖的旗帜", npc = 265788, npcName = "Kal'tinzan", map = 2482, x = 13.7, y = 53.1, minLevel = 54 },
})
s("西北营地 · 给伤员备草药", "在哨站北面山谷采十二份蓝花草药；回奥尔塔克处取药膏，分别交给 Enho 和 Maruke，按日志回报。", {
    { t = "complete", quest = 96616 },
    { t = "turnin", quest = 96616, title = "疗愈伤者的草药", npc = 244512, npcName = "Ortak Lomgok", map = 2482, x = 12.9, y = 52.9 },
    { t = "accept", quest = 96622, title = "无痛的安息", npc = 244512, npcName = "Ortak Lomgok", map = 2482, x = 12.9, y = 52.9, minLevel = 54, pre = { 96616 } },
    { t = "complete", quest = 96622 },
    { t = "turnin", quest = 96622, title = "无痛的安息", npc = 244512, npcName = "Ortak Lomgok", map = 2482, x = 12.9, y = 52.9 },
})
s("西坡 · 枭羽、树人和哀悼之地", "取得枭羽，清两类腐化树人。最终安息需57级，击杀天灾复活者拾取护身符。", {
    { t = "accept", quest = 90865, title = "守望者之眼", npc = 264089, npcName = "Eluneth", map = 2482, x = 18.78, y = 62.01, minLevel = 54 },
    { t = "collect", quest = 92609, title = "飞舞的羽毛", item = 253341, count = 9, oi = 1, itemName = "海加尔猫头鹰羽毛", map = 2482, x = 18.67, y = 61.97 },
    { t = "kill", quest = 95026, title = "清除疫病", npc = 249247, count = 3, oi = 1, target = "Forgotten Soldier", map = 2482, x = 22.95, y = 49.52 },
    { t = "kill", quest = 95026, title = "清除疫病", npc = 249228, count = 12, oi = 2, target = "Fleshflay Ravener", map = 2482, x = 22.46, y = 49.28 },
    { t = "collect", quest = 90865, title = "守望者之眼", item = 273322, count = 8, oi = 1, itemName = "观察者之眼", map = 2482, x = 22.67, y = 50.39, fromId = 249237, fromKind = "npc", from = "Eternal Sentry" },
    { t = "collect", quest = 92592, title = "最后的死亡", item = 268573, count = 1, oi = 1, itemName = "复活者的护身符", map = 2482, x = 28, y = 57.7, fromId = 260148, fromKind = "npc", from = "Scourge Reanimator" },
})
s("哀悼之地回报 · 寻找老兵", "老兵会换位置，沿西侧营地寻找；没遇见可略过老兵支线。", {
    { t = "turnin", quest = 90865, title = "守望者之眼", npc = 264089, npcName = "Eluneth", map = 2482, x = 18.78, y = 62.01 },
    { t = "accept", quest = 92100, title = "只想离开这里", npc = 255009, npcName = "Veteran of the Third War", map = 2482, x = 21.6, y = 57.5, optional = true, minLevel = 54 },
    { t = "turnin", quest = 92592, title = "最后的死亡", npc = 244511, npcName = "Zet'gan", map = 2482, x = 13.82, y = 54.57 },
    { t = "turnin", quest = 95026, title = "清除疫病", npc = 244511, npcName = "Zet'gan", map = 2482, x = 13.82, y = 54.57 },
    { t = "turnin", quest = 92609, title = "飞舞的羽毛", npc = 244511, npcName = "Zet'gan", map = 2482, x = 13.82, y = 54.57 },
    { t = "accept", quest = 95248, title = "前往永恒峰", npc = 244511, minLevel = 54, npcName = "Zet'gan", map = 2482, x = 13.82, y = 54.57, preAll = { 92592, 92609, 94782, 95026 } },
})
s("西面瞭望台 · 剑鞘与老兵的记忆", "检查刺绣剑鞘接后续，与老兵交谈后再交任务。", {
    { t = "turnin", quest = 92100, title = "只想离开这里", object = 654121, objName = "Embroidered Scabbard", map = 2482, x = 8.75, y = 46.48, optional = true },
    { t = "accept", quest = 96550, title = "战斗的记忆", object = 654121, objName = "Embroidered Scabbard", map = 2482, x = 8.75, y = 46.48, pre = { 92100 }, optional = true, minLevel = 54 },
    { t = "talk", optional = true, npc = 255038, npcName = "Veteran of the Third War", map = 2482, x = 8.8, y = 46.49 },
    { t = "turnin", quest = 96550, title = "战斗的记忆", npc = 255038, npcName = "Veteran of the Third War", map = 2482, x = 8.8, y = 46.49, optional = true },
})
s("宁静摇篮 · 分取幼兽、泉水和荒野之神任务", nil, {
    { t = "accept", quest = 93615, title = "幼崽与猫", npc = 255683, npcName = "Shalla'kal", map = 2482, x = 31.3, y = 50.3, minLevel = 54 },
    { t = "accept", quest = 96979, title = "神圣泉水", npc = 267109, npcName = "Galvinquam Leafsyre", map = 2482, x = 32.89, y = 54.44, minLevel = 56 },
    { t = "accept", quest = 96145, title = "昔日的羽翼与利爪", npc = 268168, npcName = "Lisbael Highfeather", map = 2482, x = 42.06, y = 52.07, minLevel = 55 },
    { t = "turnin", quest = 96931, title = "向山上进发", npc = 267158, npcName = "Jereman", map = 2482, x = 41.27, y = 45.33 },
    { t = "accept", quest = 96939, title = "生死平衡", npc = 267158, npcName = "Jereman", map = 2482, x = 41.27, y = 45.33, pre = { 96931 }, minLevel = 54 },
    { t = "accept", quest = 96978, title = "凶暴的鹿群", npc = 267158, npcName = "Jereman", map = 2482, x = 41.27, y = 45.33, pre = { 96931 }, minLevel = 54 },
})
s("瀑布与三只幼兽", "给泉水目标取水，沿标注的三处找幼兽并互动。", {
    { t = "complete", quest = 96979, title = "神圣泉水", map = 2482, x = 41.6, y = 44.6 },
})
s("寻找三只幼兽","到三处标记分别与幼兽互动，确认日志后回营地。",{
    { t = "goto", text = "Solstice", map = 2482, x = 38.5, y = 47.3 },
    { t = "goto", text = "Brie", map = 2482, x = 41.4, y = 36.4 },
    { t = "goto", text = "Whisperfur", map = 2482, x = 27, y = 61.9 },
    {t="complete",quest=93615},
}, {{k="turnedin", q=93615, neg=true}, {k="complete", q=93615, neg=true}})
s("野鹿与神龛 · 两位荒野之神", "先把鹿肉交给卡拉斯，再清捕食者。前往玛洛西斯接骨头与被窃生命，同地的目标一起拾取。", {
    { t = "turnin", quest = 96978, title = "凶暴的鹿群", npc = 255693, npcName = "Kala'th", map = 2482, x = 28.68, y = 43.04 },
    { t = "accept", quest = 93617, title = "猎物与捕食者", npc = 255693, npcName = "Kala'th", map = 2482, x = 28.68, y = 43.04, pre = { 96978 }, minLevel = 54 },
    { t = "kill", quest = 93617, title = "猎物与捕食者", npc = 256809, count = 6, oi = 1, target = "Predatory Hyjal Stag", map = 2482, x = 31.56, y = 44.3 },
    { t = "turnin", quest = 93617, title = "猎物与捕食者", npc = 255693, npcName = "Kala'th", map = 2482, x = 28.68, y = 43.04 },
    { t = "turnin", quest = 96939, title = "生死平衡", npc = 267113, npcName = "Marrosis", map = 2482, x = 27.1, y = 49.99 },
    { t = "accept", quest = 92317, title = "被窃的生命", npc = 267113, npcName = "Marrosis", map = 2482, x = 27.1, y = 49.99, pre = { 96939 }, minLevel = 54 },
    { t = "accept", quest = 96957, title = "骨头的滋味", npc = 267113, npcName = "Marrosis", map = 2482, x = 27.1, y = 49.99, pre = { 96939 }, minLevel = 54 },
    { t = "collect", quest = 96957, title = "骨头的滋味", item = 275927, count = 20, oi = 1, itemName = "晒得泛白的骨堆", map = 2482, x = 25.4, y = 53.5, fromId = 656518, fromKind = "object", from = "Sun-Bleached Bone" },
    { t = "collect", quest = 92317, title = "被窃的生命", item = 272973, count = 1, oi = 1, itemName = "失落生命之滴", map = 2482, x = 25.06, y = 53.28 },
    { t = "turnin", quest = 96957, title = "骨头的滋味", npc = 267113, npcName = "Marrosis", map = 2482, x = 27.1, y = 49.99 },
    { t = "turnin", quest = 93615, title = "幼崽与猫", npc = 255683, npcName = "Shalla'kal", map = 2482, x = 31.3, y = 50.3 },
    { t = "turnin", quest = 96979, title = "神圣泉水", npc = 267109, npcName = "Galvinquam Leafsyre", map = 2482, x = 32.89, y = 54.44 },
})
s("向艾维娜神殿攀升", "沿途清理腐化瘤，交古神引导并接天空碎片。", {
    { t = "accept", quest = 96296, title = "恶臭的腐化", object = 651409, objName = "Corrupted Growth", map = 2482, x = 48.55, y = 56.35, minLevel = 55 },
    { t = "complete", quest = 96296, title = "恶臭的腐化", map = 2482, x = 52.6, y = 60.3 },
    { t = "turnin", quest = 92171, title = "飞向高处", npc = 254131, npcName = "Skylord Omnuron", map = 2482, x = 54.31, y = 63.95 },
    { t = "accept", quest = 92500, title = "一片天空", npc = 254131, npcName = "Skylord Omnuron", map = 2482, x = 54.31, y = 63.95, pre = { 92171 }, minLevel = 54 },
    { t = "turnin", quest = 96145, title = "昔日的羽翼与利爪", npc = 260825, npcName = "Phoebe Highfeather", map = 2482, x = 54.48, y = 63.91 },
    { t = "turnin", quest = 96296, title = "恶臭的腐化", npc = 260825, npcName = "Phoebe Highfeather", map = 2482, x = 54.48, y = 63.91 },
    { t = "accept", quest = 91883, title = "天穹领主之矛", npc = 254131, npcName = "Skylord Omnuron", map = 2482, x = 54.31, y = 63.95, minLevel = 55 },
    { t = "accept", quest = 92147, title = "高羽的帮手", npc = 260825, npcName = "Phoebe Highfeather", map = 2482, x = 54.48, y = 63.91, minLevel = 55 },
    { t = "accept", quest = 96252, title = "黯淡的宝物", npc = 260825, npcName = "Phoebe Highfeather", map = 2482, x = 54.48, y = 63.91, minLevel = 55 },
})
s("东北鹰身人高地 · 护符、遗物与长矛", "若在树皮地穴领了护符，同一批鹰身人可一起打。各自检查掉落。", {
    { t = "collect", quest = 92147, title = "高羽的帮手", item = 268997, count = 18, oi = 1, itemName = "虫翅针羽", map = 2482, x = 54.27, y = 62.9 },
    { t = "collect", quest = 96252, title = "黯淡的宝物", item = 273164, count = 8, oi = 1, itemName = "黯淡的高羽手镯", map = 2482, x = 53, y = 60.4, fromId = 650902, fromKind = "object", from = "Tarnished Highfeather Bangle" },
    { t = "collect", quest = 92500, title = "一片天空", item = 272974, oi = 1, itemName = "地平线明珠", map = 2482, x = 47.7, y = 59.4, fromId = 650219, fromKind = "object", from = "The Jewel of the Horizon" },
    { t = "collect", quest = 91883, title = "天穹领主之矛", item = 268998, oi = 1, itemName = "奥姆努隆的长矛", map = 2482, x = 47.62, y = 58.3, fromId = 260826, fromKind = "npc", from = "Zarrat Wormwing" },
})
s("鹰身人营地 · 十六个附魔护符", "在神殿附近的鹰身人聚落击杀、拾取护符。回西南地穴的路上交索邦。", {
    { t="collect", quest=93827, item=263028, itemName="附魔鹰身人护符", count=16, oi=1, map=2482, x=54.27, y=62.9 },
})
s("回神殿交遗物 · 返回摇篮带信", nil, {
    { t = "turnin", quest = 91883, title = "天穹领主之矛", npc = 254131, npcName = "Skylord Omnuron", map = 2482, x = 54.31, y = 63.95 },
    { t = "turnin", quest = 92147, title = "高羽的帮手", npc = 260825, npcName = "Phoebe Highfeather", map = 2482, x = 54.48, y = 63.91 },
    { t = "turnin", quest = 96252, title = "黯淡的宝物", npc = 260825, npcName = "Phoebe Highfeather", map = 2482, x = 54.48, y = 63.91 },
    { t = "accept", quest = 96991, title = "山路援手", npc = 267109, npcName = "Galvinquam Leafsyre", map = 2482, x = 32.89, y = 54.44, pre = { 96979 }, minLevel = 56 },
    { t = "accept", quest = 96964, title = "聪明的生灵", npc = 267158, npcName = "Jereman", map = 2482, x = 41.27, y = 45.33, pre = { 96931 }, minLevel = 54 },
})
s("树皮地穴 · 回交护符", "经过西南就交；准备先清山北时，可留到购包前回地穴再交。", {
    { t = "turnin", quest = 93827, optional = true, title = "风中的护符", npc = 256660, npcName = "Thobon Sapclaw", map = 2482, x = 18.5, y = 78.6 },
})

s = R.chapter("summit","达埃古恩与永恒峰")
s("北部营地 · 军团、剑圣与狐狸", nil, {
    { t = "accept", quest = 92960, title = "汲取短暂精华", npc = 263406, npcName = "Elaena Moonwhisper", map = 2482, x = 43.77, y = 32.24, minLevel = 54 },
    { t = "accept", quest = 95793, title = "遏制恶魔大军", npc = 249052, npcName = "Witherbeard", map = 2482, x = 43.74, y = 31.94, minLevel = 54 },
    { t = "accept", quest = 96959, title = "剑圣的篝火", npc = 267121, npcName = "Yashiro", map = 2482, x = 49.33, y = 32.63, minLevel = 56 },
    { t = "turnin", quest = 96964, title = "聪明的生灵", npc = 259695, npcName = "Renalard", map = 2482, x = 60.04, y = 49.35 },
    { t = "accept", quest = 92335, title = "军团登临的余烬", npc = 259695, npcName = "Renalard", map = 2482, x = 60.04, y = 49.35, pre = { 96964 }, minLevel = 54 },
    { t = "accept", quest = 96971, title = "智取恶魔", npc = 259695, npcName = "Renalard", map = 2482, x = 60.04, y = 49.35, pre = { 96964 }, minLevel = 54 },
})
s("达埃古恩 · 恶魔、工坊零件和两座篝火", "在两处营火点火；同时拾工坊零件、军团灰烬。遇到巡逻精英时让宠物单拉。", {
    { t = "kill", quest = 95793, title = "遏制恶魔大军", npc = 249229, count = 12, oi = 1, target = "Felguard Sentinel", map = 2482, x = 57.12, y = 46.18 },
    { t = "collect", quest = 92960, title = "汲取短暂精华", item = 271220, count = 6, oi = 1, itemName = "短暂精华", map = 2482, x = 55.65, y = 43.61, fromId = 249230, fromKind = "npc", from = "Defiling Hound" },
    { t = "collect", quest = 92011, title = "翻找废墟", item = 250775, count = 5, oi = 1, itemName = "磨损的线缆", map = 2482, x = 51.5, y = 37, fromId = 571603, fromKind = "object", from = "Frayed Wire" },
    { t = "collect", quest = 92011, title = "翻找废墟", item = 269244, count = 5, oi = 2, itemName = "钙化的粪便", map = 2482, x = 62.5, y = 41.5, fromId = 572028, fromKind = "object", from = "Calcified Excrement" },
    { t = "collect", quest = 92011, title = "翻找废墟", item = 269246, count = 5, oi = 3, itemName = "扭曲金属碎片", map = 2482, x = 56, y = 41.2 },
    { t = "collect", quest = 96971, title = "智取恶魔", item = 275958, count = 8, oi = 1, itemName = "被遗弃的补给品", map = 2482, x = 50.2, y = 37, fromId = 656604, fromKind = "object", from = "Abandoned Supplies" },
    { t = "collect", quest = 92335, title = "军团登临的余烬", item = 253239, count = 1, oi = 1, itemName = "阿兹加洛的灰烬", map = 2482, x = 49.5, y = 34.6, fromId = 650227, fromKind = "object", from = "Azgalor's Ashes" },
})
s("废墟法师塔 · 取部落旗帜", "塔门旁取旧旗；击杀恶魔卫士拾取三块纹章。", {
    { t = "complete", quest = 91794, map = 2482, x = 53, y = 33 },
})
s("达埃古恩 · 点燃两座营火","东南和南侧各有一处，点完看日志。",{
    { t = "goto", text = "Southeast Bonfire", map = 2482, x = 54.8, y = 40 },
    { t = "goto", text = "South Bonfire", map = 2482, x = 49.1, y = 36.1 },
    { t="complete",quest=96959 },
}, {{k="turnedin", q=96959, neg=true}, {k="complete", q=96959, neg=true}})
s("北营地回报 · 双恶魔和被困的玛埃里安", "先接抽取力量的任务，带任务物品去找两只具名恶魔。", {
    { t = "turnin", quest = 92960, title = "汲取短暂精华", npc = 263406, npcName = "Elaena Moonwhisper", map = 2482, x = 43.77, y = 32.24 },
    { t = "accept", quest = 96003, title = "引出恶徒", npc = 263406, npcName = "Elaena Moonwhisper", map = 2482, x = 43.77, y = 32.24, pre = { 92960 }, minLevel = 54 },
    { t = "turnin", quest = 95793, title = "遏制恶魔大军", npc = 249052, npcName = "Witherbeard", map = 2482, x = 43.74, y = 31.94 },
    { t = "turnin", quest = 96959, title = "剑圣的篝火", npc = 267121, npcName = "Yashiro", map = 2482, x = 49.33, y = 32.63 },
})
s("恶魔双目标 · 抽取力量再击败", "先对目标使用无尽影响之眼。玛埃里安需要的废弃补给从邻近废墟拾取。", {
    { t = "kill", quest = 96003, title = "引出恶徒", npc = 263394, oi = 1, target = "Bethra'zel the Feeble", map = 2482, x = 57.61, y = 31.11 },
    { t = "accept", quest = 97009, title = "玛埃里安的苦难", npc = 267097, npcName = "Maerion Thaelemaches", map = 2482, x = 63.28, y = 25.85, minLevel = 56 },
    { t = "collect", quest = 97009, title = "玛埃里安的苦难", item = 276100, count = 12, oi = 1, itemName = "地狱犬尖刺", map = 2482, x = 63.17, y = 25.99, fromId = 249230, fromKind = "npc", from = "Defiling Hound" },
    { t = "turnin", quest = 97009, title = "玛埃里安的苦难", npc = 267097, npcName = "Maerion Thaelemaches", map = 2482, x = 63.28, y = 25.85 },
    { t = "kill", quest = 96003, title = "引出恶徒", npc = 252457, count = 1, oi = 2, target = "Mazzogore", map = 2482, x = 50.68, y = 37.65 },
    { t = "turnin", quest = 96003, title = "引出恶徒", npc = 263406, npcName = "Elaena Moonwhisper", map = 2482, x = 43.77, y = 32.24 },
    { t = "accept", quest = 96025, title = "循鸦而行", npc = 263406, npcName = "Elaena Moonwhisper", map = 2482, x = 43.77, y = 32.24, pre = { 96003 }, minLevel = 54 },
    { t = "turnin", quest = 96971, title = "智取恶魔", npc = 259695, npcName = "Renalard", map = 2482, x = 60.04, y = 49.35 },
})
s("西北哨站回交旧旗", "把部落旗与纹章交卡尔廷赞。已学航点可从山麓再上峰。", {
    { t = "turnin", quest = 91794, title = "先祖的旗帜", npc = 265788, npcName = "Kal'tinzan", map = 2482, x = 13.7, y = 53.1 },
})
s("永恒峰 · 向山顶营地报到", nil, {
    { t = "turnin", quest = 96991, title = "山路援手", npc = 264795, npcName = "Marn Euhorn", map = 2482, x = 68.3, y = 46.71 },
    { t = "turnin", quest = 95248, title = "前往永恒峰", npc = 254915, npcName = "Thisalee Crow", map = 2482, x = 68.99, y = 49.99 },
    { t = "turnin", quest = 96025, title = "循鸦而行", npc = 254915, npcName = "Thisalee Crow", map = 2482, x = 68.99, y = 49.99 },
    { t = "accept", quest = 92017, title = "净化之风", npc = 264795, npcName = "Marn Euhorn", map = 2482, x = 68.3, y = 46.71, minLevel = 56 },
    { t = "accept", quest = 92533, title = "扭曲的工具", npc = 243855, npcName = "Toron Rockhoof", map = 2482, x = 68.88, y = 48.35, minLevel = 56 },
    { t = "accept", quest = 93584, title = "终结教派", npc = 254915, npcName = "Thisalee Crow", map = 2482, x = 68.99, y = 49.99, minLevel = 56 },
    { t = "accept", quest = 93407, title = "爪中之刺", npc = 40833, npcName = "Tiala Whitemane", map = 2482, x = 68.85, y = 50.6, minLevel = 57 },
})
s("永恒峰 · 哨兵、信使和引兽任务", "在山顶营地接齐，然后和黑刺教徒同圈。引出的奇美拉为精英。", {
    { t = "accept", quest = 93127, title = "峰顶哨兵", npc = 40833, npcName = "Tiala Whitemane", map = 2482, x = 68.9, y = 50.6 },
    { t = "accept", quest = 93422, title = "黑刺断讯", npc = 255151, npcName = "Rhylin Stonethorn", map = 2482, x = 70.7, y = 51.3, minLevel = 54 },
    { t = "accept", quest = 93444, title = "诱捕野兽", npc = 41861, npcName = "Fayran Elthas", map = 2482, x = 68.7, y = 44.1, optional = true },
})
s("山麓工坊 · 交零件后测试机械", "飞山麓，到工坊交零件并完成试验。随后去小屋，三份荒野之神的交付都在隐士这里。", {
    { t = "turnin", quest = 92011, title = "翻找废墟", npc = 249235, npcName = "Kaylaena Springwhisper", map = 2482, x = 60.01, y = 61.36 },
    { t = "accept", quest = 92328, title = "攻城技艺", npc = 249235, npcName = "Kaylaena Springwhisper", map = 2482, x = 60.01, y = 61.36, pre = { 92011 }, minLevel = 54 },
    { t = "complete", quest = 92328, title = "攻城技艺", map = 2482, x = 60.6, y = 61.2 },
    { t = "turnin", quest = 92328, title = "攻城技艺", npc = 249235, npcName = "Kaylaena Springwhisper", map = 2482, x = 60.01, y = 61.36 },
    { t = "turnin", quest = 92317, title = "被窃的生命", npc = 256222, npcName = "Ketharas", map = 2482, x = 73.27, y = 81.7 },
    { t = "turnin", quest = 92335, title = "军团登临的余烬", npc = 256222, npcName = "Ketharas", map = 2482, x = 73.27, y = 81.7 },
    { t = "turnin", quest = 92500, title = "一片天空", npc = 256222, npcName = "Ketharas", map = 2482, x = 73.27, y = 81.7 },
    { t = "accept", quest = 90647, title = "山之杖", npc = 256222, npcName = "Ketharas", map = 2482, x = 73.27, y = 81.7, preAll = { 92317, 92335, 92500 }, minLevel = 54 },
})
s("永恒峰 · 将法杖交给提亚拉", "回到峰顶，拿后续再去北面黑刺营地。", {
    { t = "turnin", quest = 90647, title = "山之杖", npc = 40833, npcName = "Tiala Whitemane", map = 2482, x = 68.85, y = 50.6 },
    { t = "accept", quest = 92169, title = "偿还契约", npc = 40833, npcName = "Tiala Whitemane", map = 2482, x = 68.85, y = 50.6, pre = { 90647 }, minLevel = 54 },
})
s("黑刺营地 · 法杖、工具和净风材料", "按任务日志用法杖、清教徒和信徒，拾取工具、荆棘及净风材料。", {
    { t = "complete", quest = 92169, title = "偿还契约", map = 2482, x = 75.9, y = 35.4 },
    { t = "kill", quest = 93584, title = "终结教派", npc = 249551, count = 10, oi = 1, target = "Blackthorne Cultist", map = 2482, x = 75.74, y = 34.57 },
    { t = "kill", quest = 93584, title = "终结教派", npc = 264570, count = 10, oi = 2, target = "Blackthorne Adept", map = 2482, x = 75.74, y = 34.83 },
    { t = "collect", quest = 92533, title = "扭曲的工具", item = 273832, count = 1, oi = 1, itemName = "Wicked Ritualist's Kris", map = 2482, x = 75.74, y = 34.57 },
    { t = "collect", quest = 92533, title = "扭曲的工具", item = 273828, count = 1, oi = 2, itemName = "Recoiling Gnarlybark Staff", map = 2482, x = 75.74, y = 34.83 },
    { t = "collect", quest = 93407, title = "爪中之刺", item = 263227, count = 18, oi = 1, itemName = "荆棘种子", map = 2482, x = 74.3, y = 40.2 },
    { t = "collect", quest = 92017, title = "净化之风", item = 274287, count = 5, oi = 1, itemName = "大角鹰兽的羽毛", map = 2482, x = 74.16, y = 39.83, fromId = 249491, fromKind = "npc", from = "Mountain Squallclimber" },
    { t = "collect", quest = 92017, title = "净化之风", item = 274288, count = 3, oi = 2, itemName = "油滑的奇美拉毛发", map = 2482, x = 70.35, y = 41.5, fromId = 249490, fromKind = "npc", from = "Wildbreath Chimaerok" },
})
s("黑刺信使与山脊 · 完成山顶三项差事", "击败巡逻信使，收集文书，并重新激活营地北、西、南的哨兵石。在北边山脊先取夜刃豹后腿作饵，再打引出的奇美拉；人少时可跳过引兽。", {
    { t = "complete", quest = 93127, map = 2482, x = 74, y = 35 },
    { t = "complete", quest = 93422, map = 2482, x = 74, y = 35 },
    { t = "complete", quest = 93444, map = 2482, x = 69.3, y = 23.6, optional = true },
})
s("峰顶回报 · 备第二圈任务", nil, {
    { t = "turnin", quest = 92169, title = "偿还契约", npc = 40833, npcName = "Tiala Whitemane", map = 2482, x = 68.85, y = 50.6 },
    { t = "turnin", quest = 93584, title = "终结教派", npc = 254915, npcName = "Thisalee Crow", map = 2482, x = 68.99, y = 49.99 },
    { t = "turnin", quest = 92533, title = "扭曲的工具", npc = 243855, npcName = "Toron Rockhoof", map = 2482, x = 68.88, y = 48.35 },
    { t = "turnin", quest = 93407, title = "爪中之刺", npc = 40833, npcName = "Tiala Whitemane", map = 2482, x = 68.85, y = 50.6 },
    { t = "turnin", quest = 92017, title = "净化之风", npc = 264795, npcName = "Marn Euhorn", map = 2482, x = 68.3, y = 46.71 },
})
s("山顶营地 · 分交战果再接后续", nil, {
    { t = "turnin", quest = 93127, title = "峰顶哨兵", npc = 40833, npcName = "Tiala Whitemane", map = 2482, x = 68.9, y = 50.6 },
    { t = "turnin", quest = 93422, title = "黑刺断讯", npc = 255151, npcName = "Rhylin Stonethorn", map = 2482, x = 70.7, y = 51.3 },
    { t = "turnin", quest = 93444, title = "诱捕野兽", npc = 41861, npcName = "Fayran Elthas", map = 2482, x = 68.7, y = 44.1, optional = true },
    { t = "accept", quest = 93547, title = "荆棘之策", npc = 40833, npcName = "Tiala Whitemane", map = 2482, x = 68.9, y = 50.6, pre = { 93407 } },
    { t = "accept", quest = 96303, title = "迷雾中的记忆", npc = 254915, npcName = "Thisalee Crow", map = 2482, x = 69, y = 50, pre = { 93584 } },
    { t = "accept", quest = 96302, title = "遗骸净礼", npc = 264795, npcName = "Marn Euhorn", map = 2482, x = 68.3, y = 46.7, pre = { 92017 } },
    { t = "accept", quest = 92016, title = "探寻树根", npc = 264795, npcName = "Marn Euhorn", map = 2482, x = 68.3, y = 46.7, pre = { 92017 } },
    { t = "accept", quest = 96301, title = "涤净力量", npc = 264795, npcName = "Marn Euhorn", map = 2482, x = 68.3, y = 46.7, minLevel = 54 },
    { t = "accept", quest = 92833, title = "维翰的陨落", npc = 40833, npcName = "Tiala Whitemane", map = 2482, x = 68.9, y = 50.6, pre = { 92169 } },
})
s("旅店、诺达希尔与永恒之井", "在旅店、仓塔、德鲁伊营地附近种荆棘；在世界树旁放五个小精灵，用熏香处理遗骸。带心脏到永恒之井，检查深根。各任务用日志内物品核对进度。", {
    { t = "complete", quest = 93547 },
    { t = "complete", quest = 96303 },
    { t = "complete", quest = 96302 },
    { t = "complete", quest = 92016, map = 2482, x = 74.3, y = 36.2 },
    { t = "complete", quest = 96301, map = 2482, x = 72.8, y = 38.4 },
})
s("北侧高地 · 用山之杖挑战维翰", "先用法杖解除维翰的力量，再击败他。读身后的书架接研究笔记。属于精英段，任一人缺任务或需要增援可回头补。", {
    { t = "complete", quest = 92833, map = 2482, x = 76.7, y = 33.6 },
    { t = "accept", quest = 93521, title = "诸神的挑战者", object = 710894, objName = "Bookshelf", map = 2482, x = 76.9, y = 35.4 },
})
s("永恒峰交任务 · 回山麓隐士收尾", "峰顶交任务后带消息飞往山麓，隐士小屋在东南。随后回树皮地穴换包。", {
    { t = "turnin", quest = 93547, title = "荆棘之策", npc = 40833, npcName = "Tiala Whitemane", map = 2482, x = 68.9, y = 50.6 },
    { t = "turnin", quest = 96303, title = "迷雾中的记忆", npc = 254915, npcName = "Thisalee Crow", map = 2482, x = 69, y = 50 },
    { t = "turnin", quest = 96302, title = "遗骸净礼", npc = 264795, npcName = "Marn Euhorn", map = 2482, x = 68.3, y = 46.7 },
    { t = "turnin", quest = 92016, title = "探寻树根", npc = 264795, npcName = "Marn Euhorn", map = 2482, x = 68.3, y = 46.7 },
    { t = "turnin", quest = 96301, title = "涤净力量", npc = 264795, npcName = "Marn Euhorn", map = 2482, x = 68.3, y = 46.7 },
    { t = "turnin", quest = 92833, title = "维翰的陨落", npc = 40833, npcName = "Tiala Whitemane", map = 2482, x = 68.9, y = 50.6 },
    { t = "turnin", quest = 93521, title = "诸神的挑战者", npc = 40833, npcName = "Tiala Whitemane", map = 2482, x = 68.9, y = 50.6 },
    { t = "accept", quest = 93848, title = "圆满收工", npc = 40833, npcName = "Tiala Whitemane", map = 2482, x = 68.9, y = 50.6, pre = { 92833 } },
    { t = "turnin", quest = 93848, title = "圆满收工", npc = 256222, npcName = "Ketharas", map = 2482, x = 73.3, y = 81.9 },
})

local _, R = ...
if not R.chapters then return end

local id = "hyjal-direct/bags"
local H, W = 2482, 1452
local beads, satchel = 263439, 262801
local steps, groups = {}, {}
local function step(group, title, note, ...)
    steps[#steps+1] = {title=title, note=note, goals={...}}
    groups[#steps] = group
end
local function seb(t, q, title)
    return R.contact(t,q,title,243815,"Sebelia",H,70.87,51.55,56)
end
local function inn(t, q, title)
    return R.contact(t,q,title,11118,"旅店老板维兹奇",W,61.31,38.89,56)
end
local function brerufa(t)
    return R.contact(t,93952,"以力量求平衡",256978,"Brerufa",H,20.56,71.73,54)
end
local function reserve(n)
    return R.goal("collect",H,33.6,68.7,{item=beads,itemName="死木部族珠",count=n,
        from="死木巢穴守卫",fromId=252063,fromKind="npc"})
end

step("mail","永恒峰 · 接「修复通讯」",
    "56级到山顶找塞贝莉娅。从永望镇出发可先开部落航点（60.4，36.4），向南经暗语峡谷进山。精英巡逻段可提前喝冬泉隐遁药水，猎人先收宠。沿途开腐化山麓（55.0，82.8）和永恒峰（68.7，44.1）航点。从费伍德起步可先跟木喉主线到永望镇。",
    seb("accept",93197,"修复通讯"))
step("mail","永望镇旅店 · 交信，再接「找回邮件」","航线已通可从永恒峰飞永望镇；徒步则沿原路穿过暗语峡谷回镇。",
    inn("turnin",93197,"修复通讯"),inn("accept",93406,"找回邮件"))
step("mail","镇东南 · 打冰蓟雪人拾回四件邮件","每人按自己的任务日志拾齐四件。",
    R.goal("collect",W,66,41,{quest=93406,title="找回邮件",oi=1,item=258323,itemName="丢失的信件",count=4,from="冰蓟雪人",fromId=7458,fromKind="npc"}))
step("mail","永望镇旅店 · 交邮件、接回邮",nil,
    inn("turnin",93406,"找回邮件"),inn("accept",93269,"送达山顶"))
step("mail","回永恒峰 · 领取18格邮政背包","带回邮找山顶的塞贝莉娅。",
    seb("turnin",93269,"送达山顶"))
step("intro","海加尔西南 · 找布雷鲁法","洞外接「以力量求平衡」。已经有树皮包而银行库存未读出时，可在步骤列表手动勾选最后的购买目标。",
    brerufa("accept"))
step("intro","死木巢穴外围 · 击败九名守卫","打海加尔的死木巢穴守卫，每人留好掉落的部族珠。",
    R.goal("kill",H,23,69.5,{quest=93952,title="以力量求平衡",npc=252063,target="死木巢穴守卫",oi=1,count=9}))
step("intro","回洞口 · 开放交珠","交给布雷鲁法。此后可用死木部族珠换树皮地穴声望。",brerufa("turnin"))
step("farm","死木村 · 攒珠子","在（24，70）至（39，67）一带打守卫、图腾师和邪能看护者。按角色各自拾取。攒满23颗即可回洞口，也可多攒几组再回。",
    reserve(23))
step("donate","布雷鲁法 · 每八颗换声望","反复交「布雷鲁法的珠子」，每次8颗、基础150声望。包里至少留15颗。若NPC不再给声望，可用木喉主线里的树皮地穴任务补足。",
    R.goal("rep",H,20.56,71.73,{faction=2747,factionName="树皮地穴",standing=6,npc=256978,npcName="Brerufa"}))
step("reserve","树皮尊敬 · 留够十五颗购包","若还缺珠子，在海加尔死木村补齐。",reserve(15))
step("buy","树皮地穴 · 购买18格树皮背包","进地穴找达拉·公颚，每人用15颗珠子买一个。已存在银行而客户端读不到时，可手动勾选本目标。",
    R.goal("buy",H,21,78.6,{npc=256629,npcName="Dala Fairmaw",item=satchel,itemName="树皮背包",count=1}))
local buyStep = #steps
assert(Polestar.RegisterGuide({id=id,pack="hyjal-direct",title="海加尔 · 双18格背包",category="Reputation",
    faction="Horde",classes={"HUNTER","SHAMAN"},zone=H,minLevel=56,maxLevel=60,version=1,
    keywords={"海加尔山","邮政","树皮","背包","Hyjal"},steps=steps,
    why="56级从永恒峰出发，送回邮领第一个包，交死木部族珠到尊敬买第二个。"}))

-- Mutable conditions must stay live even after the engine has passed a row.
local hidden = {classes={"!HUNTER","!SHAMAN"}}
local function refresh()
    local C = Polestar.Compat
    local marks = Polestar.CharState().manual
    local tick = marks and marks[id] and marks[id][buyStep..":1"] == "tick"
    local owned = (C.GetItemCount(satchel,true) or 0)>0 or C.IsItemEquipped(satchel)
    if not owned and GetInventoryItemID then
        for slot=20,23 do
            if GetInventoryItemID("player",slot)==satchel then owned=true; break end
        end
    end
    local rank = C.GetFactionStanding(2747)
    local honored = rank and rank>=6
    local needRep = not owned and not tick and not honored
    local count = C.GetItemCount(beads) or 0
    local visible = {
        mail=not C.IsQuestCompleted(93269), intro=needRep,
        farm=needRep and count<23, donate=needRep and count>=23,
        reserve=not owned and not tick and honored, buy=not owned,
    }
    local changed = false
    for i,row in ipairs(steps) do
        local filter
        if not visible[groups[i]] then filter=hidden end
        if row.only~=filter then row.only=filter; changed=true end
    end
    local engine=Polestar.Engine
    local guide=engine and engine.GetGuide()
    if changed and guide and guide.id==id then engine.RequestUpdate() end
end
Polestar.OnLogin(function()
    refresh()
    -- A tick on the final goal, including from a pinned later step, can leave
    -- the active step's signature unchanged; observe the actual toggle.
    if hooksecurefunc then hooksecurefunc(Polestar.Engine,"ToggleGoal",function(s,g)
        local guide=Polestar.Engine.GetGuide()
        if guide and guide.id==id and s==buyStep and g==1 then refresh() end
    end) end
end)
for _,event in ipairs({"PLAYER_ENTERING_WORLD","UPDATE_FACTION","QUEST_LOG_UPDATE","BAG_UPDATE_DELAYED",
    "PLAYER_EQUIPMENT_CHANGED","BANKFRAME_OPENED","BANKFRAME_CLOSED"}) do
    Polestar.RegisterEvent(event,refresh)
end

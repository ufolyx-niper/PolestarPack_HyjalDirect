local _, R = ...
if not R.chapters then return end
local F, W, H = 1448, 1452, 2482
local g, contact = R.goal, R.contact
local north = {k = "rep", faction = 576, standing = 4, neg = true}
local beforeNeutral = {north}
local function grazle(t,q,title) return contact(t,q,title,11554,"格拉兹",F,50.9,84.9,45) end
local function nafien(t,q,title) return contact(t,q,title,15395,"纳菲恩",F,64.7,8.2,45) end
local function salfa(t,q,title) return contact(t,q,title,11556,"萨尔法",W,27.75,34.53,45) end
local function kill(q,id,name,n,index,map,x,y)
    return g("kill",map,x,y,{quest=q,npc=id,target=name,count=n,oi=index})
end
local s = R.chapter("timbermaw","木喉要塞")
s("费伍德南口 · 格拉兹","从灰谷进费伍德后沿大路向北。木喉已中立时，路线自动接续到冬泉谷。",{grazle("accept",8460,"木喉熊怪盟友")},beforeNeutral)
s("经过翡翠圣地 · 可带进山的口信","55级经过格雷塔时看她是否提供「腐化之源」，有就顺手带到海加尔隐士处。无需回头。",{
    {t="accept",quest=91952,title="腐化之源",npc=10922,npcName="格雷塔·苔蹄",map=F,x=51.07,y=82.17,minLevel=55,optional=true},
},beforeNeutral)
s("南死木村 · 三类各六只","各自留死木头饰羽毛。回南口交任务时，五根一组交给格拉兹。",{
    kill(8460,7153,"死木战士",6,1,F,46.2,90),kill(8460,7155,"死木探路者",6,2,F,46.2,90),
    kill(8460,7154,"死木园丁",6,3,F,46.2,90),
},beforeNeutral)
s("格拉兹 · 回报并带话北上",nil,{grazle("turnin",8460,"木喉熊怪盟友"),grazle("accept",8462,"与纳菲恩交谈")},beforeNeutral)
s("费伍德北洞口 · 纳菲恩","沿大路北上，北端隧道口接下一批死木目标。",{
    nafien("turnin",8462,"与纳菲恩交谈"),nafien("accept",8461,"北方的死木熊怪"),
},beforeNeutral)
s("北死木村 · 三类各六只","两人各自拾羽毛。",{
    kill(8461,7156,"死木巢穴守卫",6,1,F,62,9),kill(8461,7157,"死木复仇者",6,2,F,62,9),
    kill(8461,7158,"死木萨满祭司",6,3,F,62,9),
},beforeNeutral)
s("纳菲恩 · 开放羽毛交付","交完可反复用五根死木羽毛换声望。",{
    nafien("turnin",8461,"北方的死木熊怪"),nafien("accept",8465,"与萨尔法交谈"),
},beforeNeutral)
s("木喉中立 · 在洞口核对两人声望","继续打北死木村，五根羽毛找纳菲恩交一次。达到冷淡后也可穿洞走冬泉支路，找出口萨尔法做冬泉熊怪和五颗魂珠交付。两人都到中立就往永望镇走。",{
    g("rep",F,63.7,6.1,{faction=576,factionName="木喉要塞",standing=4}),
})
s = R.chapter("winter","冬泉谷与进山")
local unknownSummit = {k="taxi",node=559,name="永恒峰",neg=true}
local outside = {k="zone",area=616,name="Mount Hyjal",neg=true}
local approach = {unknownSummit,outside}
s("木喉隧道 · 从冬泉出口出洞","费伍德北口进洞。分叉走通往冬泉谷的出口，沿大路向东到永望镇。已在镇上可跳到航点。",{
    g("enter",W,27.75,34.53,{area=618,location="冬泉谷"}),
},{outside,unknownSummit,{k="taxi",node=53,name="永望镇",neg=true}})
s("冬泉出口 · 向萨尔法回报",nil,{salfa("turnin",8465,"与萨尔法交谈")},{{k="onquest",q={8465}}})
s("永望镇 · 部落飞行点","往镇内东北侧找尤格雷克。去海加尔、月光林地和回镇送信都会用到。",{
    g("getfp",W,60.43,36.36,{node=53,area=2255,npc=11139,npcName="尤格雷克",location="永望镇"}),
})
s("准备隐遁药水 · 两人到55级","未到55级，可在永望镇做乌米的雪人毛皮，或回萨尔法做冬泉熊怪；木喉还差声望时优先熊怪。",{
    g("level",W,64.1,39.8,{level=55,grind=7458,npcName="冰蓟雪人"}),
},approach)
local function potion(q,repeatDose)
    local conditions = {outside,unknownSummit,{k="has",item=281234,neg=true},{k="buff",spell=1310655,neg=true}}
    conditions[#conditions+1] = {k="turnedin",q=92859,neg=not repeatDose}
    local function evie(t) return contact(t,q,"冬泉隐遁药水",11188,"埃文·维布鲁",W,60.7,37.7,55) end
    s(repeatDose and "药水用过 · 向埃文补领" or "永望镇 · 找埃文领药水任务","两人各自接取，只需一剂有效药水。",{evie("accept")},conditions)
    s("永望镇周边 · 每人五张皮和五根羽毛","冷风奇美拉和冬泉巨枭各掉一种材料。以两人日志的计数为准。",{
        g("collect",W,61.2,41.7,{quest=q,item=281241,itemName="冰风奇美拉的皮毛",count=5,oi=1}),
        g("collect",W,64.3,37.7,{quest=q,item=281242,itemName="冬泉巨枭的羽毛",count=5,oi=2}),
        evie("turnin"),
    },conditions)
end
potion(92859,false)
potion(98462,true)
s("暗语峡谷 · 在安全处喝药","从永望镇向南。进入精英巡逻区之前各用一剂药水；猎人先收宠。沿峡谷看巡逻间隙一起走。",{
    g("goto",W,50.5,82.8,{text="暗语峡谷南段"}),
},approach)
s("穿过峡谷 · 进入海加尔山","过地图边界后沿山路向西。",{
    g("enter",H,85.5,73.2,{area=616,location="海加尔山"}),
},approach)
s("部落山口 · 接西北哨站引导","进山第一处部落营地。把信带到西北哨站，交付给树皮声望。",{
    contact("accept",96830,"远视指引",266802,"Thark Gorax",H,79.98,70.73,54),
})
s("腐化山麓 · 学飞行点","两人都找 Bluebell 对话。",{
    g("getfp",H,54.97,82.78,{node=3242,area=16853,npc=260626,npcName="Bluebell",location="腐化山麓"}),
})
s("永恒峰 · 学飞行点","沿山路上峰。达到56级就开始送信。55级先做树皮任务，升级后路线会指向邮差。",{
    g("getfp",H,68.7,44.1,{node=559,area=16849,npc=41861,npcName="Fayran Elthas",location="永恒峰"}),
})
s=R.chapter("mail","永恒峰邮政")
local mailPending={{k="turnedin",q=93269,neg=true}}
local function post(t,q,title)
    if (q==93197 and t=="accept") or (q==93269 and t=="turnin") then
        return contact(t,q,title,243815,"Sebelia",H,70.87,51.55,56)
    end
    return contact(t,q,title,11118,"旅店老板维兹奇",W,61.31,38.89,56)
end
s("56级 · 开始送信","55级先到西南找布雷鲁法做树皮入门；升到56级，回来找山顶的塞贝莉娅。",{g("level",H,20.6,71.7,{level=56,optional=true})},mailPending)
s("永恒峰 · 第一封信",nil,{post("accept",93197,"修复通讯")},mailPending)
s("飞往永望镇 · 到旅店找维兹","从永恒峰经山麓飞回永望镇。",{
    post("turnin",93197,"修复通讯"),post("accept",93406,"找回邮件"),
},mailPending)
s("镇东南 · 拾回四件邮件","打冰蓟雪人，每人各拾四件。回镇在同一位旅店老板处交接。",{
    g("collect",W,66,41,{quest=93406,item=258323,itemName="丢失的信件",count=4,oi=1}),
    post("turnin",93406,"找回邮件"),post("accept",93269,"送达山顶"),
},mailPending)
s("飞回永恒峰 · 各领18格邮政背包","从部落航点飞回永恒峰，在塞贝莉娅处交回邮，同时取得移速饰品。",{
    post("turnin",93269,"送达山顶"),
},mailPending)

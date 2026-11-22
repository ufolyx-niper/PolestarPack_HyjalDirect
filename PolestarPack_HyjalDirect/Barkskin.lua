local _, R = ...
if not R.chapters then return end
local H = 2482
local people = {
    brerufa={256978,"Brerufa",20.56,71.73}, osi={256646,"Osi Mistpaw",21.08,80.19},
    mist={256627,"Elder Mistpaw",21.77,78.98}, pine={256650,"Elder Pinespeaker",21.77,79.37},
    suma={260661,"Suma Mossmane",20.82,79.81}, thobon={256660,"Thobon Sapclaw",18.5,78.6},
    fennar={256626,"Fennar Mossmane",20.2,78}, dala={256629,"Dala Fairmaw",21,78.6},
    mother={244425,"Barkskin Matriarch",31.5,58.6},
}
local function q(kind,id,title,person)
    local p=people[person]
    return R.contact(kind,id,title,p[1],p[2],H,p[3],p[4],54)
end
local function field(id,x,y) return R.goal("complete",H,x,y,{quest=id}) end
local function gather(id,item,name,count,x,y)
    return R.goal("collect",H,x,y,{quest=id,item=item,itemName=name,count=count,oi=1})
end
local function rep(standing,x,y)
    return R.goal("rep",H,x,y,{faction=2747,factionName="树皮地穴",standing=standing})
end
local function notOwned()
    return {{k="has",item=262801,neg=true},{k="equipped",item=262801,neg=true}}
end
local s=R.chapter("burrow","树皮地穴")
s("西南洞外 · 布雷鲁法","先在洞外取得信任。山上的死木部族珠给树皮，费伍德的羽毛给木喉。",{q("accept",93952,"以力量求平衡","brerufa")})
s("死木巢穴外围 · 击败九名守卫",nil,{
    R.goal("kill",H,23,69.5,{quest=93952,npc=252063,target="死木巢穴守卫",count=9,oi=1}),
    q("turnin",93952,"以力量求平衡","brerufa"),q("accept",92111,"毛皮之友","brerufa"),
})
s("进树皮地穴 · 奥西的熊果","先跟奥西说话，再回地表采浆果。",{
    q("turnin",92111,"毛皮之友","osi"),q("accept",93831,"甜爪果酱","osi"),
    gather(93831,262818,"熊果",30,23.5,75.5),
})
s("地穴议事处 · 拜见两位长老","与松语长老和雾爪长老分别对话，按日志确认完成再交。",{
    q("turnin",93831,"甜爪果酱","osi"),q("accept",91697,"拜见长老","osi"),
    { t = "talk", quest = 91697, title = "拜见长老", npc = 256650, npcName = "Elder Pinespeaker", oi = 1, map = 2482, x = 21.63, y = 79.32 },
    { t = "talk", quest = 91697, title = "拜见长老", npc = 256627, npcName = "Elder Mistpaw", oi = 2, map = 2482, x = 21.57, y = 78.95 },
    q("turnin",91697,"拜见长老","mist"),
    q("accept",93826,"让死木闻风丧胆","mist"),q("accept",93825,"树皮祝福","suma"),
    q("accept",93827,"风中的护符","thobon"),
})
s("西坡 · 沿古树采苔，向北进死木村","月幕苔长在古树旁。神殿鹰身人的护符留到艾维娜神殿一圈，避免专程折返。",{
    gather(93825,262802,"月幕苔",12,16,51.9),
    R.goal("kill",H,34,69,{quest=93826,npc=252116,target="死木图腾师",count=8,oi=1}),
    R.goal("kill",H,35,72,{quest=93826,npc=252096,target="死木邪能看护者",count=8,oi=2}),
})
s("回地穴交树皮任务","死木洞深处的牢笼在（31.5，58.6）。两人有把握可顺路救族母；后面回地穴补声望时，顺路任务栏也会列出救援步骤。",{
    q("turnin",93826,"让死木闻风丧胆","pine"),q("turnin",93825,"树皮祝福","suma"),
})
s=R.chapter("satchel","树皮尊敬与购包")
local canDonate=notOwned()
canDonate[#canDonate+1]={k="has",item=263439,n=23}
canDonate[#canDonate+1]={k="rep",faction=2747,standing=6,neg=true}
s("布雷鲁法 · 八颗珠子换声望","包内至少二十三颗才提示。想继续换，可在同一个 NPC 重复对话，始终留十五颗。",{
    {t="turnin",quest=93925,title="布雷鲁法的珠子",direct=true,optional=true,npc=256978,npcName="Brerufa",map=H,x=20.56,y=71.73},
},canDonate)
local wards=q("turnin",93827,"风中的护符","thobon")
wards.optional=true
s("回地穴 · 交神殿带回的护符","在索邦处交十六个附魔护符，先结算声望，再看还差多少。",{wards},{{k="complete",q=93827}})
s("回西南地穴 · 树皮声望到中立","先交山口引导和已完成的长老任务。顺路任务栏里的族母护送也给声望。打死木村熊怪拾部族珠，五颗羽毛的交付只在费伍德。每次交八颗给布雷鲁法，保留十五颗买包。",{
    rep(4,20.56,71.73),
},notOwned())
s("地穴中立 · 一趟接齐营地差事",nil,{
    q("accept",94504,"树皮的开端","mist"),q("turnin",94504,"树皮的开端","mist"),
    q("accept",93828,"洞穴草药","fennar"),q("accept",93830,"海加尔之水","fennar"),
    q("accept",93834,"洞穴甲虫","dala"),q("accept",93833,"邪恶的智慧","pine"),
},notOwned())
s("洞里找草药和甲虫，洞外池塘装水","洞内取十份悬挂草药、六份甲虫碎片。到死木巢穴外的池塘用芬纳尔的水袋，再向东打海加尔猫头鹰取五具完整躯体。",{
    field(93828,20.2,78),field(93834,21,78.6),field(93830,21.4,64.9),
    gather(93833,262816,"完整的猫头鹰躯体",5,34.8,73.9),
},notOwned())
s("回地穴 · 四项交付","有队伍时，可做顺路任务栏里的死木洞精英任务补声望。",{
    q("turnin",93828,"洞穴草药","fennar"),q("turnin",93830,"海加尔之水","fennar"),
    q("turnin",93834,"洞穴甲虫","dala"),q("turnin",93833,"邪恶的智慧","pine"),
},notOwned())
s("树皮友善 · 回报松语长老","每次交珠前至少有23颗，换8颗后留15颗。西北哨站交付、营救和精英支线都能补树皮声望。两人的珠子与声望各算各的。",{
    rep(5,20.56,71.73),q("accept",96666,"地穴情谊","pine"),q("turnin",96666,"地穴情谊","pine"),
},notOwned())
s("死木村至布雷鲁法 · 补到尊敬","在（24，70）至（39，67）打守卫、图腾师、邪能看护者，珠子各自拾。每攒到23颗就可在洞外重复交8颗，基础声望150。达到尊敬停止交珠。包已经存银行或已经装备且客户端未识别时，可跳过已经完成的购包步骤。",{
    rep(6,33.6,68.7),
},notOwned())
s("留够十五颗死木部族珠","少于十五颗继续打海加尔死木村；已经尊敬就把余珠留在包里。",{
    R.goal("collect",H,33.6,68.7,{item=263439,itemName="死木部落珠串",count=15,from="死木巢穴守卫",fromId=252063,fromKind="npc"}),
},notOwned())
s("达拉·公颚 · 购买树皮背包","地穴内找军需官 Dala Fairmaw，每人花15颗换一个18格树皮背包，再分别确认。已经装备、存银行或客户端读不到时，可手动勾选这项。",{
    R.goal("buy",H,21,78.6,{npc=256629,npcName="Dala Fairmaw",item=262801,itemName="树皮背包",count=1}),
},{{k="equipped",item=262801,neg=true}})
s=R.chapter("den","可选 · 死木洞救援")
s("死木洞北面牢笼 · 族母的钥匙","先接两人各自的任务，打附近死木看守拿钥匙，回同一处牢笼。",{
    q("accept",91698,"树皮突围","mother"),gather(91698,272936,"死木钥匙",1,31.4,57.9),
    q("turnin",91698,"树皮突围","mother"),
})
s("等队友接齐 · 护送一家出洞","两人同时在笼边接任务，跟紧族母回西南。护送失败时放弃失败任务，等族母在笼边刷新再接。也可跳过这一节继续主线。",{
    q("accept",91696,"狩猎季节","mother"),field(91696,20.6,71.7),q("turnin",91696,"狩猎季节","brerufa"),
})
s("地穴长老 · 洞内精英支线","回营地看两位长老和芬纳尔提供的任务；优先接能合走的差事。只接两人当前能接的任务。",{
    q("accept",95108,"秘法混合物","mist"),q("accept",95107,"击败深吼","pine"),q("accept",95273,"海加尔之水 · 净化","fennar"),
})
s("死木洞深处 · 秘术师、酋长与洞底水源","进洞找两名死亡秘术师和两口坩埚；在酋长营地取断杖。带净化药剂者到洞底水里使用。箭头指进洞集结点，洞内按日志走。",{
    field(95108,31.5,58.6),field(95107,31.5,58.6),field(95273,31.5,58.6),
})
s("返回树皮长老 · 收取声望",nil,{
    q("turnin",95108,"秘法混合物","mist"),q("turnin",95107,"击败深吼","pine"),q("turnin",95273,"海加尔之水 · 净化","fennar"),
})
s("经过上层废营时 · 击碎守卫","雾爪长老提供任务后，到海加尔上层被毁的联盟营地摧毁六个永恒哨兵再回报。可同北段山顶任务合做。",{
    q("accept",93832,"击碎石头守望者","mist"),{t="complete",quest=93832},q("turnin",93832,"击碎石头守望者","mist"),
})

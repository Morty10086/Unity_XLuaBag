--Json数据读取到Lua的表中存储

--从AB包中加载json表
--TextAsset对象
local txt=ABMgr:LoadRes("json","JsonData",typeof(TextAsset))
--print(txt.text)
--获取它的文本信息，进行json解析
local itemList=Json.decode(txt.text)
print(itemList[1])
print(itemList[1].id)
--加载出来是一个数组
--不方便通过id获取内容，需要用一张新表转存一次
--而且这张新的道具表在任何地方都能被使用

--用来存储道具信息
--键——道具ID，值——表一行的信息
ItemData={}
for _,value in pairs(itemList) do
    ItemData[value.id]=value
end
--[[for key,value in pairs(ItemData) do
    print(key,value)
end]]

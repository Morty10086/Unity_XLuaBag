print("11111111")
print("TestLuaIDDebug")
--初始化得到的类别名
require("InitClass")
require("Object")
--初始化道具表信息
require("PlayerData")
require("ItemData")
require("BasePanel")
require("MainPanel")
require("ItemGrid")
require("BagPanel")
PlayerData:Init()
MainPanel:ShowMe()


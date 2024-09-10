BasePanel:subClass("BagPanel")

BagPanel.Content=nil

BagPanel.items={}
BagPanel.nowType=-1

BagPanel.panelName="BagPanel"
function BagPanel:Init()
    self.base.Init(self)
    if self.isInitEvent==false then
         --Conent没有挂载UI组件，需要手动找到   
        self.Content=self:GetControl("svBag","ScrollRect").transform:Find("Viewport").transform:Find("Content")
        self:GetControl("btnClose","Button").onClick:AddListener(function()
            self:HideMe()
            self.nowType=-1
        end)

        --toggle 对应委托是UnityAction<bool>，必须加CSharpCallLua特性
        self:GetControl("togItem","Toggle").onValueChanged:AddListener(function(value)
            if value==true then
                self:ChangeType(1)
            end
        end)
        self:GetControl("togEquip","Toggle").onValueChanged:AddListener(function(value)
            if value==true then
                self:ChangeType(2)
            end
        end)
        self:GetControl("togGem","Toggle").onValueChanged:AddListener(function(value)
            if value==true then
                self:ChangeType(3)
            end
        end)
        self.isInitEvent=true
    end
end

function BagPanel:ShowMe()
    self.base.ShowMe(self)
    if self.nowType==-1 then
        --print("GridTest")
        self:GetControl("togItem","Toggle").isOn=true
        self:ChangeType(1)
    end
end


function BagPanel:ChangeType(type)
    if self.nowType==type then
        return
    end

    --print("GridTest")
    for i=1,#self.items do
        self.items[i]:Destroy()
    end
    self.items={}
    self.nowType=type
    local nowItemList=nil
    if type==1 then
        nowItemList=PlayerData.items
    elseif type==2 then
        nowItemList=PlayerData.equips
    else
        nowItemList=PlayerData.gems   
    end
    
    for i=1,#nowItemList do
        --print("GridTest")
        local grid=ItemGrid:new()
        grid:Init(self.Content,(i-1)%4*150,math.floor((i-1)/4)*150)
        grid:InitData(nowItemList[i])
        table.insert(self.items,grid)
    end
    
end

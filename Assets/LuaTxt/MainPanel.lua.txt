BasePanel:subClass("MainPanel")
--实例化面板对象，为其处理对应逻辑

MainPanel.panelName="MainPanel"
--初始化面板，实例化对象，控件事件监听
function MainPanel:Init()
    self.base.Init(self)
    if self.isInitEvent==false then
        print(self:GetControl("btnRole","Image"))
        self:GetControl("btnRole","Button").onClick:AddListener(function()
            self:BtnRoleClick()
        end)
        self.isInitEvent=true
    end
end

function MainPanel:BtnRoleClick()
    print("ClickRoleBtn")
    --print(self.panelObj)
    BagPanel:ShowMe()
end
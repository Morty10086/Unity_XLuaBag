Object:subClass("BasePanel")
BasePanel.panelName=nil
BasePanel.panelObj=nil

BasePanel.controls={}
BasePanel.isInitEvent=false

function BasePanel:Init()
    if self.panelObj==nil then
        self.panelObj=ABMgr:LoadRes("ui",self.panelName,typeof(GameObject))
        self.panelObj.transform:SetParent(Canvas,false)
    
        local allControls=self.panelObj:GetComponentsInChildren(typeof(UIBehaviour))
    
        --避免存入没用的UI控件
        for i=0,allControls.Length-1 do
            local controlName=allControls[i].name
            if string.find(controlName,"btn")~=nil or
                string.find(controlName,"tog")~=nil or
                string.find(controlName,"img")~=nil or
                string.find(controlName,"sv")~=nil or
                string.find(controlName,"text")~=nil then
                local typeName=allControls[i]:GetType().Name
                if self.controls[controlName]~=nil then
                    self.controls[controlName][typeName]=allControls[i]
                else
                    self.controls[controlName]={[typeName]=allControls[i]}
                end
            end
        end
    end
   
end

function BasePanel:GetControl(name,typeName)
    if self.controls[name]~=nil then
        local sameNameCOntrols=self.controls[name]
        if sameNameCOntrols[typeName]~=nil then
            return sameNameCOntrols[typeName]
        end
    end
end

function BasePanel:ShowMe()
    self:Init()
    self.panelObj:SetActive(true)
end

function BasePanel:HideMe()
    self.panelObj:SetActive(false)
end




Object:subClass("ItemGrid")

ItemGrid.obj=nil
ItemGrid.imgIcon=nil
ItemGrid.TextNum=nil

--实例化格子对象
function ItemGrid:Init(father,posX,posY)
    --实例化格子预设体
    self.obj=ABMgr:LoadRes("ui","ItemGrid",typeof(GameObject))
    --设置父对象
    self.obj.transform:SetParent(father,false)
    --设置位置
    self.obj.transform.localPosition=Vector3(posX,posY,0)
    --获取控件
    self.imgIcon=self.obj.transform:Find("itemImage"):GetComponent(typeof(Image))
    self.TextNum=self.obj.transform:Find("textNum"):GetComponent(typeof(Text))
end

--初始化格子信息
function ItemGrid:InitData(data)
    local itemData=ItemData[data.id]
    local strs=string.split(itemData.icon,"_")
    local spriteAtlas=ABMgr:LoadRes("ui",strs[1],typeof(SpriteAtlas))
    self.imgIcon.sprite=spriteAtlas:GetSprite(strs[2])
    self.TextNum.text=data.num
end

function ItemGrid:Destroy()
    GameObject.Destroy(self.obj)
    self.obj=nil
end





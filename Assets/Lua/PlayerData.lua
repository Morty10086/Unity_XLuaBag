PlayerData={}

PlayerData.equips={}
PlayerData.items={}
PlayerData.gems={}

function PlayerData:Init()
    --只会存道具ID和道具数量
    table.insert(self.equips,{id=1,num=1})
    table.insert(self.equips,{id=2,num=1})
    
    table.insert(self.items,{id=3,num=2})
    table.insert(self.items,{id=4,num=2})

    table.insert(self.gems,{id=5,num=3})
    table.insert(self.gems,{id=6,num=3})
end






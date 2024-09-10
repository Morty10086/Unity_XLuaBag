require("Object")

require("SplitTools")

Json=require("JsonUtility")
--Unity相关
GameObject=CS.UnityEngine.GameObject
Resources=CS.UnityEngine.Resources
Transform=CS.UnityEngine.Transform
TextAsset=CS.UnityEngine.TextAsset
RectTransform=CS.UnityEngine.RectTransform
--图集对象类
SpriteAtlas=CS.UnityEngine.U2D.SpriteAtlas
Vector3=CS.UnityEngine.Vector3
Vector2=CS.UnityEngine.Vector2
--UI相关
UI=CS.UnityEngine.UI
Image=UI.Image
Text=UI.Text
Button=UI.Button
Toggle=UI.Toggle
ScrollRect=UI.ScrollRect
UIBehaviour=CS.UnityEngine.EventSystems.UIBehaviour
    --找到场景中的Canvas物体
Canvas=GameObject.Find("Canvas").transform
RectTransform=CS.UnityEngine.RectTransform

--AB包管理器
ABMgr=CS.ABMgr.GetInstance()

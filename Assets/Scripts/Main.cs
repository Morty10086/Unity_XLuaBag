using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.UI;

public class Main : MonoBehaviour
{
    // Start is called before the first frame update
    public UnityAction u1;
    void Start()
    {
        LuaMgr.GetInstance().Init();
        LuaMgr.GetInstance().DoLuaFile("Main");
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}

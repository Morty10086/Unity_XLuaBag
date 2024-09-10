using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UnityEngine.Events;
using XLua;

namespace XLuaBag.Assets.Scripts
{
    public static class CSharpCallLuaList
    {
        [CSharpCallLua]
        public static List<Type> cSharpCallLuaList=new List<Type>()
        {
            typeof(UnityAction<bool>)
        };
    }
}
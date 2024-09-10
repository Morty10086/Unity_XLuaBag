using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEditor;
using UnityEngine;

public class LuaCopyEditor : Editor
{
    [MenuItem("XLua/自动生成txt后缀的Lua文件")]
   public static void CopyLuaToTxt()
   {
    //找到所有Lua文件
    string path=Application.dataPath+"/Lua/";
    if(!Directory.Exists(path))
        return;
    //得到每一个lua文件的路径
    string[] pathStrs=Directory.GetFiles(path,"*.lua");
    //把Lua文件拷贝到新文件夹
    string newPath=Application.dataPath+"/LuaTxt/";
    if(!Directory.Exists(newPath))
        Directory.CreateDirectory(newPath);
    else
    {
        //每次生成时，把原来的删除
        string[] oldFilePaths=Directory.GetFiles(newPath,"*.txt");
        for(int i=0;i<oldFilePaths.Length;i++)
        {
            File.Delete(oldFilePaths[i]);
        }
    }
    List<string> newFilePaths=new List<string>();
    string fileName;
    for(int i=0;i<pathStrs.Length;i++)
    {
        fileName=newPath+pathStrs[i].Substring(pathStrs[i].LastIndexOf("/")+1)+".txt";
        newFilePaths.Add(fileName);
        File.Copy(pathStrs[i],fileName);
    }

    AssetDatabase.Refresh();
    for(int i=0;i<newFilePaths.Count;i++)
    {
        //该API传入路径必须是相对Assets文件夹的
        AssetImporter importer=AssetImporter.GetAtPath(newFilePaths[i].Substring(newFilePaths[i].IndexOf("Assets")));
        if(importer!=null)
        {
            importer.assetBundleName="lua";
        }
    }

    AssetDatabase.Refresh();


   }
}

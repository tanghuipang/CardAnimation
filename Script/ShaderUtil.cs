using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using UnityEngine;

public enum ShaderPropertyType
{
    Color = 0,
    Vector = 1,
    Float = 2, 
    Range = 3, //alse is a float value
    Texture = 4,
}

public static class ShaderUtilInterface
{
    public static Dictionary<string, MethodInfo> methods = new Dictionary<string, MethodInfo>();

    static ShaderUtilInterface()
    {
        var asm = AppDomain.CurrentDomain.GetAssemblies().FirstOrDefault(a => a.GetTypes().Any(t => t.Name == "ShaderUtil"));
        if (asm != null)
        {
            var tp = asm.GetTypes().FirstOrDefault(t => t.Name == "ShaderUtil");
            foreach (var method in tp.GetMethods(BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.Static))
            {
                methods[method.Name] = method;
            }
        }
    }

    public static List<Texture> GetTextures(this Material shader)
    {
        var list = new List<Texture>();
        var count = shader.GetPropertyCount();
        for (var i = 0; i < count; i++)
        {
            if (shader.GetPropertyType(i) == ShaderPropertyType.Texture)
            {
                list.Add((Texture)shader.GetProperty(i));
            }
        }
        return list;
    }

    public static int GetPropertyCount(this Material shader)
    {
        return Call<int>("GetPropertyCount", shader.shader);
    }

    public static ShaderPropertyType GetPropertyType(this Material shader, int index)
    {
        return Call<ShaderPropertyType>("GetPropertyType", shader.shader, index);
    }

    public static string GetPropertyName(this Material shader, int index)
    {
        return Call<string>("GetPropertyName", shader.shader, index);
    }

    public static void SetProperty(this Material material, int index, object value)
    {
        var name = material.GetPropertyName(index);
        var type = material.GetPropertyType(index);
        switch (type)
        {
            case ShaderPropertyType.Color:
                material.SetColor(name, (Color)value);
                break;
            case ShaderPropertyType.Vector:
                material.SetVector(name, (Vector4)value);
                break;
            case ShaderPropertyType.Float:
            case ShaderPropertyType.Range:
                material.SetFloat(name, (float)value);
                break;
            case ShaderPropertyType.Texture:
                material.SetTexture(name, (Texture)value);
                break;
        }
    }



    public static object GetProperty(this Material material, int index)
    {
        var name = material.GetPropertyName(index);
        var type = material.GetPropertyType(index);
        switch (type)
        {
            case ShaderPropertyType.Color:
                return material.GetColor(name);

            case ShaderPropertyType.Vector:
                return material.GetVector(name);


            case ShaderPropertyType.Float:
            case ShaderPropertyType.Range:
                return material.GetFloat(name);

            case ShaderPropertyType.Texture:
                return material.GetTexture(name);

        }
        return null;
    }

    public static T Call<T>(string name, params object[] parameters)
    {
        return (T)methods[name].Invoke(null, parameters);
    }

}
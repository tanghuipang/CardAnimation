using System;
using UnityEngine;

[Serializable]
public class CardAnimation
{
    public enum LoopType
    {
        NotLoop = 0,
        Repeat = 1,     
        Pingpong = 2,
    }

    const int r = 0;
    const int g = 1;
    const int b = 2;
    const int a = 3;

    const int x = 0;
    const int y = 1;
    const int z = 2;
    const int w = 3;

    public string propertyName;
    public ShaderPropertyType type;
    public LoopType loopType;
    Material mat;
    
    Vector4 defaultValue = new Vector4(1, 1, 1, 1);

    public AnimationCurve[] curves = new AnimationCurve[4];
    public bool[] isDimensionUsed = new bool[4] { false, false, false, false };

    /// <summary>
    /// 构造一个CardAnimation
    /// </summary>
    /// <param name="propertyName">对应的材质属性名（eg. _Layer1_Color）</param>
    /// <param name="type">属性的类型</param>
    /// <param name="mat">被控制的Material。对于NGUI的UITexture，应该是其dynamicMat对象</param>
    public CardAnimation(string propertyName, ShaderPropertyType type, Material mat)
    {
        this.propertyName = propertyName;
        this.type = type;
        this.mat = mat;
        loopType = LoopType.Repeat;
    }

    public void ApplyDefaultValue()
    {
        GetDefaultValue();
    }

    public void SetIsDimensionUsed(bool value, int index)
    {
        if (isDimensionUsed[index] != value)
        {
            isDimensionUsed[index] = value;
            if (curves[index] == null)
                curves[index] = new AnimationCurve();
        }
    }

    public Material Mat
    {
        get { return mat; }
        set
        {
            mat = value;
            GetDefaultValue();
        }
    }

    float time;
    public void Update(float time)
    {
        if (mat == null)
            return;
        this.time = time;

        switch (type)
        {
            case ShaderPropertyType.Color:
                mat.SetColor(propertyName, GetColor());
                break;
            case ShaderPropertyType.Vector:
                mat.SetVector(propertyName, GetVector());
                break;
            case ShaderPropertyType.Float:
            case ShaderPropertyType.Range:
                mat.SetFloat(propertyName, GetFloat(x));
                break;
            case ShaderPropertyType.Texture:
            default:
                break;
        }
    }

    Color GetColor()
    {
        return new Color(GetFloat(r), GetFloat(g), GetFloat(b), GetFloat(a));
    }

    Vector4 GetVector()
    {
        return new Vector4(GetFloat(x), GetFloat(y), GetFloat(z), GetFloat(w));
    }

    float GetFloat(int dimensionIndex)
    {
        if (dimensionIndex > w || dimensionIndex < x)
            return 0;

        if (!isDimensionUsed[dimensionIndex] || curves[dimensionIndex] == null)
        {
            switch (dimensionIndex)
            {
                case x:
                    return defaultValue.x;
                case y:
                    return defaultValue.y;
                case z:
                    return defaultValue.z;
                case w:
                    return defaultValue.w;
                default:
                    return 0;
            }
        }

        float v = curves[dimensionIndex].Evaluate(GetRealNow(dimensionIndex));
        Debug.Log(v);
        return v;
    }

    float GetRealNow(int dimensionIndex)
    {
        AnimationCurve ac = curves[dimensionIndex];
        float timeMax = 0;
        if (ac.length > 0)
        {
            timeMax = ac.keys[ac.length - 1].time;
        }

        switch (loopType)
        {
            case LoopType.NotLoop:
                return timeMax > time ? time : timeMax;
            case LoopType.Repeat:
                return time % timeMax;
            case LoopType.Pingpong:
                float t = time % (2 * timeMax);
                if (t > timeMax)
                    t = 2 * timeMax - t;
                return t;
            default:
                return 0;
        }
    }

    void GetDefaultValue()
    {
        if (mat == null)
            return;
        switch (type)
        {
            case ShaderPropertyType.Color:
                defaultValue = mat.GetColor(propertyName);
                break;
            case ShaderPropertyType.Vector:
                defaultValue = mat.GetVector(propertyName);
                break;
            case ShaderPropertyType.Float:
            case ShaderPropertyType.Range:
                defaultValue.x = mat.GetFloat(propertyName);
                break;
            case ShaderPropertyType.Texture:
            default:
                break;
        }
    }
}
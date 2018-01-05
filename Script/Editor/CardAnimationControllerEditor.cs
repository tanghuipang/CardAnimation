using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;

[CustomEditor(typeof(CardAnimationController))]
public class CardAnimationControllerInspector : Editor {
    List<string> animationNames;
    CardAnimationController mTarget;
    Dictionary<string, int> propertyNameIndex = new Dictionary<string, int>();

    public override void OnInspectorGUI()
    {
        if (!mTarget)
            return;
        if (needRemove.Count > 0)
        {
            foreach (CardAnimation ca in needRemove)
                mTarget.animations.Remove(ca);
            RebuiltDatas();
        }
        needRemove.Clear();

        foreach (CardAnimation ca in mTarget.animations)
        {
            DrawAnimationNode(ca);
        }

        DrawAddNew();
    }

    void OnEnable()
    {
        mTarget = target as CardAnimationController;
        layerArr = layerSelections.ToArray();
        typeArr = typeSelections.ToArray();
        RebuiltDatas();
        if (mTarget.Mat == null)
            return;
        for (int i = 0; i < mTarget.Mat.GetPropertyCount(); i++)
        {
            string propertyName = mTarget.Mat.GetPropertyName(i);
            propertyNameIndex.Add(propertyName, i);
        }
    }
    //重建layerSelections/typeSelections/layerArr/typeArr/animationNames 数据
    void RebuiltDatas()
    {
        animationNames = new List<string>();
        foreach (CardAnimation ca in mTarget.animations)
            animationNames.Add(ca.propertyName);
    }

    int layerSelection = 0;
    int typeSelection = 0;
    //private System.Enum Selected = ;
    List<string> layerSelections = new List<string>(System.Enum.GetNames(typeof(CardLayer)));
    List<string> typeSelections = new List<string>(System.Enum.GetNames(typeof(CardAnimationType)));

    string[] layerArr;
    string[] typeArr;
    void DrawAddNew()
    {
        EditorGUILayout.BeginHorizontal();
        layerSelection = EditorGUILayout.Popup(layerSelection, layerArr, "DropDown");
        typeSelection = EditorGUILayout.Popup(typeSelection, typeArr, "DropDown");
        if (GUILayout.Button("Add"))
        {
            TryAddNewAnimation("_" + layerSelections[layerSelection] + "_" + typeSelections[typeSelection]);
        }
        EditorGUILayout.EndHorizontal();
    }

    void TryAddNewAnimation(string propertyName)
    {
        if (animationNames.Contains(propertyName))
        {
            Debug.LogError("已经存在这个属性动画:" + propertyName + ", 请不要重复添加。");
            return;
        }
        Material mat = mTarget.Mat;
        if (mat == null || mat.shader == null)
            return;
        int index;
        if (!propertyNameIndex.TryGetValue(propertyName, out index))
        {
            return;
        }
        ShaderPropertyType type = mat.GetPropertyType(index);

        CardAnimation ca = new CardAnimation(propertyName, type, mTarget.Mat);
        mTarget.animations.Add(ca);
        mTarget.animations.Sort(CompareAnim);
    }

    int CompareAnim(CardAnimation a, CardAnimation b)
    {
        return propertyNameIndex[a.propertyName] - propertyNameIndex[b.propertyName];
    }

    List<CardAnimation> needRemove = new List<CardAnimation>();
    void DrawAnimationNode(CardAnimation ca)
    {
        if (CardEditorUtils.DrawHeader(ca.propertyName, ca.propertyName, false, false))
        {
            switch (ca.type)
            {
                case ShaderPropertyType.Color:
                    for (int i = 0; i < ca.isDimensionUsed.Length; i++)
                    {
                        GUILayout.BeginHorizontal();
                        GUILayout.Space(30);
                        ca.isDimensionUsed[i] = GUILayout.Toggle(ca.isDimensionUsed[i], GetColorDimensionName(i), GUILayout.Width(30));
                        if (ca.isDimensionUsed[i])
                        {
                            if (ca.curves[i] == null)
                                ca.curves[i] = new AnimationCurve(new Keyframe(0, 0), new Keyframe(1, 1));
                            EditorGUILayout.CurveField(ca.curves[i], GUILayout.Height(28));
                        }
                        GUILayout.EndHorizontal();
                    }
                    break;
                case ShaderPropertyType.Vector:
                    for (int i = 0; i < ca.isDimensionUsed.Length; i++)
                    {
                        GUILayout.BeginHorizontal();
                        GUILayout.Space(30);
                        ca.isDimensionUsed[i] = GUILayout.Toggle(ca.isDimensionUsed[i], GetVectorDimensionName(i), GUILayout.Width(30));
                        if (ca.isDimensionUsed[i])
                        {
                            if (ca.curves[i] == null)
                                ca.curves[i] = new AnimationCurve(new Keyframe(0, 0), new Keyframe(1, 1));
                            EditorGUILayout.CurveField(ca.curves[i], GUILayout.Height(28));
                        }
                        GUILayout.EndHorizontal();
                    }
                    break;
                case ShaderPropertyType.Float:
                    GUILayout.BeginHorizontal();
                    GUILayout.Space(30);
                    ca.isDimensionUsed[0] = true; // GUILayout.Toggle(ca.isDimensionUsed[0], GetVectorDimensionName(i), GUILayout.Width(30));
                    //if (ca.isDimensionUsed[i])
                    {
                        if (ca.curves[0] == null)
                            ca.curves[0] = new AnimationCurve(new Keyframe(0, 0), new Keyframe(1, 1));
                        EditorGUILayout.CurveField(ca.curves[0], GUILayout.Height(28));
                    }
                    GUILayout.EndHorizontal();
                    break;
                case ShaderPropertyType.Range:
                    break;
                case ShaderPropertyType.Texture:
                    break;
                default:
                    break;
            }

            GUILayout.BeginHorizontal();
            GUILayout.Label("LoopType:");
            ca.loopType = (CardAnimation.LoopType)EditorGUILayout.EnumPopup(ca.loopType);
            GUILayout.EndHorizontal();

            GUILayout.BeginHorizontal();
            GUILayout.Space(20);
            if (GUILayout.Button("delete", GUILayout.Width(60)))
            {
                if (!needRemove.Contains(ca))
                    needRemove.Add(ca);
            }
            GUILayout.EndHorizontal();
        }
    }

    string[] colorDimensionNames = { "R", "G", "B", "A" };
    string GetColorDimensionName(int index)
    {
        if (index < 0 || index >= colorDimensionNames.Length)
            return "error";
        else
            return colorDimensionNames[index];
    }

    string[] vectorDimensionNames = { "X", "Y", "Z", "W" };
    string GetVectorDimensionName(int index)
    {
        if (index < 0 || index >= colorDimensionNames.Length)
            return "error";
        else
            return vectorDimensionNames[index];
    }

    public enum CardLayer
    {
        Layer1,
        Layer2,
        Layer3,
        Layer4,
        Layer5,
    }

    public enum CardAnimationType
    {
        Color,
        Translate,
        Rotate,
        Scale,
        Blend,
        Distortion,
        FlowTranslate,
        FlowRotate,
        FlowScale,
    }
}

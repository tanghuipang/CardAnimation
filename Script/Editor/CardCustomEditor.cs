using UnityEngine;
using UnityEditor;
using System.Collections.Generic;

public class CardCustomEditor : ShaderGUI
{
    enum LayerProperty
    {
        IsEnable = 0,
        Tex = 1,
        Mask = 2,
        Color,
        Translate,
        Rotate,
        Scale,
        Blend,
        Distortion,
        FLOWMAP,
        FlowTex,
        FlowTranslate,
        FlowRotate,
        FlowScale,
        FlowParams,
        Max,
    }

    const int MaxLayerCount = 5;
    enum LayerCount
    {
        OneLayer = 1,
        TwoLayers,
        ThreeLayers,
        FourLayers,
        FiveLayers,
    }

    Dictionary<int, MaterialProperty[]> dict = new Dictionary<int, MaterialProperty[]>();
    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        materialEditor.SetDefaultGUIWidths();
        foreach(MaterialProperty mp in properties)
        {
            if (!TryAddToLayerList(mp))
                materialEditor.ShaderProperty(mp, mp.displayName);
        }

        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.LabelField("Select layer count:");
        EditorGUI.BeginChangeCheck();
        maxLayer = (int)(LayerCount)(EditorGUILayout.EnumPopup((LayerCount)maxLayer));
        if (EditorGUI.EndChangeCheck())
        {
            for(int i = 1; i <= MaxLayerCount; i++)
            {
                MaterialProperty[] mps;
                if (dict.TryGetValue(i, out mps) && mps[(int)LayerProperty.IsEnable] != null)
                {
                    mps[(int)LayerProperty.IsEnable].floatValue = maxLayer >= i ? 1 : 0;
                }
            }
            materialEditor.PropertiesChanged();
            return;
        }
        EditorGUILayout.EndHorizontal();

        for (int i = 1; i <= maxLayer; i++)
        {
            DrawLayer(dict[i], materialEditor,i);
        }
    }

    const string prefix = "_Layer";
    const string upperPrefix = "_LAYER";
    int maxLayer = 1;
    private bool TryAddToLayerList(MaterialProperty mp)
    {
        string s = mp.name;
        if (!s.StartsWith(prefix) && !s.StartsWith(upperPrefix))
            return false;
        string idStr = mp.name.Substring(prefix.Length, 1);
        int id;
        if (!int.TryParse(idStr, out id))
        {
            return false;
        }

        MaterialProperty[] layer;
        if (!dict.TryGetValue(id, out layer))
        {
            layer = new MaterialProperty[(int)LayerProperty.Max];
            dict.Add(id, layer);
        }

        bool result = false;
        if (s.Length == prefix.Length + 1)
        {
            layer[(int)LayerProperty.IsEnable] = mp;
            if (mp.floatValue == 1)
                maxLayer = id;
            result = true;
        }
        else
        {
            string type = s.Substring(prefix.Length + 2);
            if (System.Enum.IsDefined(typeof(LayerProperty), type))
            {
                LayerProperty lp = (LayerProperty)System.Enum.Parse(typeof(LayerProperty), type);
                layer[(int)lp] = mp;
                result = true;
            }
        }
        return result;
    }

    private void DrawLayer(MaterialProperty[] layer, MaterialEditor me, int layerIndex)
    {
        if (CardEditorUtils.DrawHeader("Layer " + layerIndex, "CardMaterialLayer" + layerIndex, false, false))
        {
            for (int i = 1; i < (int)LayerProperty.FLOWMAP; i++)
            {
                DrawProperty(layer[i], me);
            }

            MaterialProperty flowMap = layer[(int)LayerProperty.FLOWMAP];
            bool isUseFlowMap = flowMap.floatValue == 1;
            if (flowMap != null)
            {
                EditorGUI.BeginChangeCheck();
                isUseFlowMap = GUILayout.Toggle(isUseFlowMap, new GUIContent(flowMap.displayName));
                if (EditorGUI.EndChangeCheck())
                {
                    flowMap.floatValue = isUseFlowMap ? 1 : 0;
                    me.PropertiesChanged();
                    return;
                }
            }
            if (isUseFlowMap)
            {
                for (int i = (int)LayerProperty.FlowTex; i < (int)LayerProperty.Max; i++)
                {
                    DrawProperty(layer[i], me);
                }
            }
        }
    }

    void DrawProperty(MaterialProperty mp, MaterialEditor me)
    {
        if (mp != null)
        {
            if (mp.type == MaterialProperty.PropType.Texture)
                me.TexturePropertySingleLine(new GUIContent(mp.displayName), mp);
            else
            {
                EditorGUI.BeginChangeCheck();
                me.ShaderProperty(mp, mp.displayName);
                if (EditorGUI.EndChangeCheck())
                {
                    if (Selection.activeGameObject != null)
                    {
                        CardAnimationController cac = Selection.activeGameObject.GetComponent<CardAnimationController>();
                        if (cac != null)
                            cac.ApplyDefaultValues(mp.name);
                    }
                }
            }
        }
    }
}

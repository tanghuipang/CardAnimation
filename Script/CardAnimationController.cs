using System.Collections.Generic;
using UnityEngine;

//用于NGUI.UITexture
//普通实现使用Animation更合理
//注意，由于NGUI实际显示时并不使用原Material而是复制出一个新的，需要在此dynamicMat复制出来后将它指定给每个CardAnimation
public class CardAnimationController : MonoBehaviour {
    Material mat;
    public Material Mat
    {
        get
        {
            if (mat == null)
                FindMaterial();
            return mat;
        }
    }
    public List<CardAnimation> animations = new List<CardAnimation>();

    void Init()
    {
        FindMaterial();
    }

    void FindMaterial()
    {
        Renderer rd = GetComponent<Renderer>();
        if (rd)
            mat = rd.sharedMaterial;
        if (mat == null)
        {
            UnityEngine.UI.Image img = GetComponent<UnityEngine.UI.Image>();
            if (img)
                mat = img.materialForRendering;
        }

        if (animations != null)
            for (int i = 0; i < animations.Count; i++)
            {
                animations[i].Mat = mat;
            }
        //add more find material code here
    }

    float start;
    private void Start()
    {
        start = Time.time;
    }

    public void Reset()
    {
        start = Time.time;
    }

    // Update is called once per frame
    void Update () {
        float timePassed = Time.time - start;
        foreach (CardAnimation ca in animations)
            ca.Update(timePassed);
	}

    //刷新默认值
    public void ApplyDefaultValues(string propertyType)
    {
        foreach(CardAnimation ca in animations)
        {
            if (ca.propertyName == propertyType)
                ca.ApplyDefaultValue();
        }
    }
}

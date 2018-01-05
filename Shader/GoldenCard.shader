Shader "Unlit/GoldenCard"
{
	Properties{
	_MainTex("Main Texture", 2D) = "white" { }
	_MaskTex("Mask Texture", 2D) = "white" { }

	//[Toggle(EFFECT_LAYER_1_ON)] _LAYER1("LAYER1", Float) = 0 //层1是否启用
	_Layer1_Tex("Layer 1 Texture", 2D) = "clear" { }
	_Layer1_Mask("Layer 1 Mask", Color) = (1,0,0,0)
		_Layer1_Color("Layer 1 Color", Color) = (1,1,1,1)
		_Layer1_Translate("Layer 1 Translate: Offset XY/Speed XY", Vector) = (0,0,0,0)
		_Layer1_Rotate("Layer 1 Rotate: Angle/Speed/Center XY", Vector) = (0,0,0.5,0.5)
		_Layer1_Scale("Layer 1 Scale: XY/Center XY", Vector) = (1,1,0.5,0.5)
		_Layer1_Blend("Layer 1 Blending with MainTex", Vector) = (0,0,0,0)
		_Layer1_Distortion("Layer 1 Distortion XY", Vector) = (0,0,0,0)

	[Toggle(_LAYER1_FLOWMAP)] _LAYER1_FLOWMAP("LAYER1Flow", Float) = 0 //层1扰动是否启用
	_Layer1_FlowTex("Layer 1 Flow Texture", 2D) = "clear" { }
		_Layer1_FlowTranslate("Layer 1 Flow Translate: Offset XY/Speed XY", Vector) = (0,0,0,0)
		_Layer1_FlowRotate("Layer 1 Flow Rotate: Angle/Speed/Center XY", Vector) = (0,0,0.5,0.5)
		_Layer1_FlowScale("Layer 1 Flow Scale: XY/Center XY", Vector) = (1,1,0.5,0.5)
		_Layer1_FlowParams("Layer 1 Flow Params: XY/扰动比率 ZW/扰动削减值", Vector) = (1, 1, 0, 0)

	[Toggle(_LAYER2)] _LAYER2("LAYER2", Float) = 0
	_Layer2_Tex("Layer 2 Texture", 2D) = "clear" { }
	_Layer2_Mask("Layer 2 Mask", Color) = (0,1,0,0)
		_Layer2_Color("Layer 2 Color", Color) = (1,1,1,1)
		_Layer2_Translate("Layer 2 Translate: Offset XY/Speed XY", Vector) = (0,0,0,0)
		_Layer2_Rotate("Layer 2 Rotate: Angle/Speed/Center XY", Vector) = (0,0,0.5,0.5)
		_Layer2_Scale("Layer 2 Scale: XY/Center XY", Vector) = (1,1,0.5,0.5)
		_Layer2_Blend("Layer 2 Blending with MainTex", Vector) = (0,0,0,0)
		_Layer2_Distortion("Layer 2 Distortion: Main Texture XY/Previous Layer XY", Vector) = (0,0,0,0)

	[Toggle(_LAYER2_FLOWMAP)] _LAYER2_FLOWMAP("LAYER2Flow", Float) = 0
		_Layer2_FlowTex("Layer 2 Flow Texture", 2D) = "clear" { }
		_Layer2_FlowTranslate("Layer 2 Flow Translate: Offset XY/Speed XY", Vector) = (0,0,0,0)
		_Layer2_FlowRotate("Layer 2 Flow Rotate: Angle/Speed/Center XY", Vector) = (0,0,0.5,0.5)
		_Layer2_FlowScale("Layer 2 Flow Scale: XY/Center XY", Vector) = (1,1,0.5,0.5)
		_Layer2_FlowParams("Layer 2 Flow Params: XY/扰动比率 ZW/扰动削减值", Vector) = (1, 1, 0, 0)

	[Toggle(_LAYER3)] _LAYER3("LAYER3", Float) = 0
	_Layer3_Tex("Layer 3 Texture", 2D) = "clear" { }
	_Layer3_Mask("Layer 3 Mask", Color) = (0,0,1,0)
		_Layer3_Color("Layer 3 Color", Color) = (1,1,1,1)
		_Layer3_Translate("Layer 3 Translate: Offset XY/Speed XY", Vector) = (0,0,0,0)
		_Layer3_Rotate("Layer 3 Rotate: Angle/Speed/Center XY", Vector) = (0,0,0.5,0.5)
		_Layer3_Scale("Layer 3 Scale: XY/Center XY", Vector) = (1,1,0.5,0.5)
		_Layer3_Blend("Layer 3 Blending with MainTex", Vector) = (0,0,0,0)
		_Layer3_Distortion("Layer 3 Distortion: Main Texture XY/Previous Layer XY", Vector) = (0,0,0,0)
	[Toggle(_LAYER3_FLOWMAP)] _LAYER3_FLOWMAP("LAYER3Flow", Float) = 0
		_Layer3_FlowTex("Layer 3 Flow Texture", 2D) = "clear" { }
		_Layer3_FlowTranslate("Layer 3 Flow Translate: Offset XY/Speed XY", Vector) = (0,0,0,0)
		_Layer3_FlowRotate("Layer 3 Flow Rotate: Angle/Speed/Center XY", Vector) = (0,0,0.5,0.5)
		_Layer3_FlowScale("Layer 3 Flow Scale: XY/Center XY", Vector) = (1,1,0.5,0.5)
		_Layer3_FlowParams("Layer 3 Flow Params: XY/扰动比率 ZW/扰动削减值", Vector) = (1, 1, 0, 0)
	
	[Toggle(_LAYER4)] _LAYER4("LAYER4", Float) = 0
	_Layer4_Tex("Layer 4 Texture", 2D) = "clear" { }
	_Layer4_Mask("Layer 4 Mask", Color) = (0,0,1,0)
		_Layer4_Color("Layer 4 Color", Color) = (1,1,1,1)
		_Layer4_Translate("Layer 4 Translate: Offset XY/Speed XY", Vector) = (0,0,0,0)
		_Layer4_Rotate("Layer 4 Rotate: Angle/Speed/Center XY", Vector) = (0,0,0.5,0.5)
		_Layer4_Scale("Layer 4 Scale: XY/Center XY", Vector) = (1,1,0.5,0.5)
		_Layer4_Blend("Layer 4 Blending with MainTex", Vector) = (0,0,0,0)
		_Layer4_Distortion("Layer 4 Distortion: Main Texture XY/Previous Layer XY", Vector) = (0,0,0,0)
	[Toggle(_LAYER4_FLOWMAP)] _LAYER4_FLOWMAP("LAYER4Flow", Float) = 0
		_Layer4_FlowTex("Layer 4 Flow Texture", 2D) = "clear" { }
		_Layer4_FlowTranslate("Layer 4 Flow Translate: Offset XY/Speed XY", Vector) = (0,0,0,0)
		_Layer4_FlowRotate("Layer 4 Flow Rotate: Angle/Speed/Center XY", Vector) = (0,0,0.5,0.5)
		_Layer4_FlowScale("Layer 4 Flow Scale: XY/Center XY", Vector) = (1,1,0.5,0.5)
		_Layer4_FlowParams("Layer 4 Flow Params: XY/扰动比率 ZW/扰动削减值", Vector) = (1, 1, 0, 0)

	[Toggle(_LAYER5)] _LAYER5("LAYER5", Float) = 0
	_Layer5_Tex("Layer 5 Texture", 2D) = "clear" { }
	_Layer5_Mask("Layer 5 Mask", Color) = (0,0,1,0)
		_Layer5_Color("Layer 5 Color", Color) = (1,1,1,1)
		_Layer5_Translate("Layer 5 Translate: Offset XY/Speed XY", Vector) = (0,0,0,0)
		_Layer5_Rotate("Layer 5 Rotate: Angle/Speed/Center XY", Vector) = (0,0,0.5,0.5)
		_Layer5_Scale("Layer 5 Scale: XY/Center XY", Vector) = (1,1,0.5,0.5)
		_Layer5_Blend("Layer 5 Blending with MainTex", Vector) = (0,0,0,0)
		_Layer5_Distortion("Layer 5 Distortion: Main Texture XY/Previous Layer XY", Vector) = (0,0,0,0)
	[Toggle(_LAYER5_FLOWMAP)] _LAYER5_FLOWMAP("LAYER5Flow", Float) = 0
		_Layer5_FlowTex("Layer 5 Flow Texture", 2D) = "clear" { }
		_Layer5_FlowTranslate("Layer 5 Flow Translate: Offset XY/Speed XY", Vector) = (0,0,0,0)
		_Layer5_FlowRotate("Layer 5 Flow Rotate: Angle/Speed/Center XY", Vector) = (0,0,0.5,0.5)
		_Layer5_FlowScale("Layer 5 Flow Scale: XY/Center XY", Vector) = (1,1,0.5,0.5)
		_Layer5_FlowParams("Layer 5 Flow Params: XY/扰动比率 ZW/扰动削减值", Vector) = (1, 1, 0, 0)
		_Layers_Inherit_Transform("Inherit Transform for Layers 2/3/4/5", Vector) = (0,0,0,0)
	}
	SubShader
	{
		Tags
		{
			"Queue" = "Transparent"
			"IgnoreProjector" = "True"
			"RenderType" = "Transparent"
		}

		Pass
		{
			Cull Off
			Lighting Off
			ZWrite Off
			Offset -1, -1
			Fog{ Mode Off }
			ColorMask RGB
			Blend SrcAlpha OneMinusSrcAlpha
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			//#pragma shader_feature _LAYER1
			#pragma shader_feature _LAYER1_FLOWMAP
			#pragma shader_feature _LAYER2
			#pragma shader_feature _LAYER2_FLOWMAP
			#pragma shader_feature _LAYER3
			#pragma shader_feature _LAYER3_FLOWMAP
			#pragma shader_feature _LAYER4
			#pragma shader_feature _LAYER4_FLOWMAP
			#pragma shader_feature _LAYER5
			#pragma shader_feature _LAYER5_FLOWMAP

			#include "UnityCG.cginc"
			#include "card.cginc"	

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float4 uv0 : TEXCOORD0;
#if _LAYER2 && !(_LAYER3 || _LAYER4 || _LAYER5)
				float2 uv1 :TEXCOORD1;
#elif _LAYER3 || _LAYER4 || _LAYER5
				float4 uv1 : TEXCOORD1;
#if _LAYER4 && !_LAYER5
				float2 uv2 :TEXCOORD2;
#elif _LAYER5
				float4 uv2 : TEXCOORD2;
#endif
#endif
				float4 vertex : SV_POSITION;
			};


			sampler2D _MainTex;
			sampler2D _MaskTex;
			float4 _MainTex_ST;

//#ifdef EFFECT_LAYER_1_ON

			//vert data
			float4 _Layer1_Translate;
			float4 _Layer1_Rotate;
			float4 _Layer1_Scale;
			//frag data
			sampler2D _Layer1_Tex;
			half4 _Layer1_Mask;
			half4 _Layer1_Color;
			half4 _Layer1_Blend;
			half2 _Layer1_Distortion;
#if _LAYER1_FLOWMAP
			sampler2D _Layer1_FlowTex;
			float4 _Layer1_FlowRotate;
			float4 _Layer1_FlowScale;
			float4 _Layer1_FlowTranslate;
			float4 _Layer1_FlowParams;
#endif

			half4 _Layers_Inherit_Transform;
#if _LAYER2 || _LAYER3 || _LAYER4 || _LAYER5
			//vert data
			float4 _Layer2_Translate;
			float4 _Layer2_Rotate;
			float4 _Layer2_Scale;
			//frag data
			sampler2D _Layer2_Tex;
			half4 _Layer2_Mask;
			half4 _Layer2_Color;
			half4 _Layer2_Blend;
			half4 _Layer2_Distortion;
#if _LAYER2_FLOWMAP
			sampler2D _Layer2_FlowTex;
			float4 _Layer2_FlowRotate;
			float4 _Layer2_FlowScale;
			float4 _Layer2_FlowTranslate;
			float4 _Layer2_FlowParams;
#endif

#if _LAYER3 || _LAYER4 || _LAYER5
			//vert data
			float4 _Layer3_Translate;
			float4 _Layer3_Rotate;
			float4 _Layer3_Scale;
			//frag data
			sampler2D _Layer3_Tex;
			half4 _Layer3_Mask;
			half4 _Layer3_Color;
			half4 _Layer3_Blend;
			half4 _Layer3_Distortion;
#if _LAYER3_FLOWMAP
			sampler2D _Layer3_FlowTex;
			float4 _Layer3_FlowRotate;
			float4 _Layer3_FlowScale;
			float4 _Layer3_FlowTranslate;
			float4 _Layer3_FlowParams;
#endif

#if _LAYER4 || _LAYER5
			//vert data
			float4 _Layer4_Translate;
			float4 _Layer4_Rotate;
			float4 _Layer4_Scale;
			//frag data
			sampler2D _Layer4_Tex;
			half4 _Layer4_Mask;
			half4 _Layer4_Color;
			half4 _Layer4_Blend;
			half4 _Layer4_Distortion;
#if _LAYER4_FLOWMAP
			sampler2D _Layer4_FlowTex;
			float4 _Layer4_FlowRotate;
			float4 _Layer4_FlowScale;
			float4 _Layer4_FlowTranslate;
			float4 _Layer4_FlowParams;
#endif

#if _LAYER5
			//vert data
			float4 _Layer5_Translate;
			float4 _Layer5_Rotate;
			float4 _Layer5_Scale;
			//frag data
			sampler2D _Layer5_Tex;
			half4 _Layer5_Mask;
			half4 _Layer5_Color;
			half4 _Layer5_Blend;
			half4 _Layer5_Distortion;
#if _LAYER5_FLOWMAP
			sampler2D _Layer5_FlowTex;
			float4 _Layer5_FlowRotate;
			float4 _Layer5_FlowScale;
			float4 _Layer5_FlowTranslate;
			float4 _Layer5_FlowParams;
#endif
#endif
#endif
#endif
#endif
			
			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv0.xy = v.uv * _MainTex_ST.xy + _MainTex_ST.zw;
				o.uv0.zw = CalculateUV0(_Layer1_Translate, _Layer1_Rotate, _Layer1_Scale, o.uv0.xy);
#if _LAYER2 || _LAYER3 || _LAYER4 || _LAYER5
				o.uv1.xy = CalculateUV(_Layer2_Translate, _Layer2_Rotate, _Layer2_Scale, _Layers_Inherit_Transform.xx, o.uv0.xy, o.uv0.zw);
#if _LAYER3 || _LAYER4 || _LAYER5
				o.uv1.zw = CalculateUV(_Layer3_Translate, _Layer3_Rotate, _Layer3_Scale, _Layers_Inherit_Transform.yy, o.uv0.xy, o.uv1.xy);
#if _LAYER4 || _LAYER5
				o.uv2.xy = CalculateUV(_Layer4_Translate, _Layer4_Rotate, _Layer4_Scale, _Layers_Inherit_Transform.zz, o.uv0.xy, o.uv1.zw);
#if _LAYER5
				o.uv2.zw = CalculateUV(_Layer5_Translate, _Layer5_Rotate, _Layer5_Scale, _Layers_Inherit_Transform.ww, o.uv0.xy, o.uv2.xy);

#endif
#endif
#endif
#endif
				return o;
			}

			float2 CalculateScaledUV(float4 scale, float4 translate, float2 flow)
			{
				float2 pos = scale.zw - translate.xy;
				float2 uv = flow - pos;
				uv = uv * scale.xy;
				uv = uv + pos;
				uv = uv + (translate.xy + translate.zw);
				return uv;
			}

			float2 CalculateRotateScaledUV(float4 rotate, float4 scale, float4 translate, float2 flow)
			{
				float a = rotate.x + rotate.y;
				float sina = sin(a);
				float cosa = cos(a);
				float2x2 mat = float2x2(cosa, sina, -sina, cosa);
				float2 center = rotate.zw - translate.xy;
				float2 uv = flow - center;
				uv = mul(uv, mat);
				uv = uv + center;
				return CalculateScaledUV(scale, translate, uv);
			}

			fixed4 frag(v2f i) : SV_Target
			{
				half4 maskCol = tex2D(_MaskTex, i.uv0.xy);

				half2 distortion = half2(0, 0);
				half2 mainDistortion = half2(0, 0);

#if _LAYER5
				float2 layer5uv = i.uv2.zw + distortion * 0.001;
#if _LAYER5_FLOWMAP
				float2 layer5flowUV = CalculateRotateScaledUV(_Layer5_FlowRotate, _Layer5_FlowScale, _Layer5_FlowTranslate, layer5uv);
				half4 layer5FlowCol = tex2D(_Layer5_FlowTex, layer5flowUV) - _Layer5_FlowParams.zw;
				layer5uv += layer5FlowCol.rg * _Layer5_FlowParams.xy;
#endif
				half4 layer5Col = tex2D(_Layer5_Tex, layer5uv);
				half layer5Rate = layer5Col.w * min(dot(maskCol, _Layer5_Mask), 1.0);
				half2 layer5DistortRateVec = layer5Col.xy * layer5Rate;
				distortion = distortion + layer5DistortRateVec * _Layer5_Distortion.zw * layer5Rate;
				mainDistortion += layer5DistortRateVec * _Layer5_Distortion.xy * layer5Rate;
#endif

#if _LAYER4 || _LAYER5
				float2 layer4uv = i.uv2.xy + distortion * 0.001;
#if _LAYER4_FLOWMAP
				float2 layer4flowUV = CalculateRotateScaledUV(_Layer4_FlowRotate, _Layer4_FlowScale, _Layer4_FlowTranslate, layer4uv);
				half4 layer4FlowCol = tex2D(_Layer4_FlowTex, layer4flowUV) - _Layer4_FlowParams.zw;
				layer4uv += layer4FlowCol.rg * _Layer4_FlowParams.xy;
#endif
				half4 layer4Col = tex2D(_Layer4_Tex, layer4uv);
				half layer4Rate = layer4Col.w * min(dot(maskCol, _Layer4_Mask), 1.0);
				half2 layer4DistortRateVec = layer4Col.xy * layer4Rate;
				distortion = distortion + layer4DistortRateVec * _Layer4_Distortion.zw * layer4Rate;
				mainDistortion += layer4DistortRateVec * _Layer4_Distortion.xy * layer4Rate;
#endif

#if _LAYER3 || _LAYER4 || _LAYER5
				float2 layer3uv = i.uv1.zw + distortion * 0.001;
#if _LAYER3_FLOWMAP
				float2 layer3flowUV = CalculateRotateScaledUV(_Layer3_FlowRotate, _Layer3_FlowScale, _Layer3_FlowTranslate, layer3uv);
				half4 layer3FlowCol = tex2D(_Layer3_FlowTex, layer3flowUV) - _Layer3_FlowParams.zw;
				layer3uv += layer3FlowCol.rg * _Layer3_FlowParams.xy;
#endif
				half4 layer3Col = tex2D(_Layer3_Tex, layer3uv);
				half layer3Rate = layer3Col.w * min(dot(maskCol, _Layer3_Mask), 1.0);
				half2 layer3DistortRateVec = layer3Col.xy * layer3Rate;
				distortion = distortion + layer3DistortRateVec * _Layer3_Distortion.zw * layer3Rate;
				mainDistortion += layer3DistortRateVec * _Layer3_Distortion.xy * layer3Rate;
#endif

#if _LAYER2 || _LAYER3 || _LAYER4 || _LAYER5
				float2 layer2uv = i.uv1.xy + distortion * 0.001;
#if _LAYER2_FLOWMAP
				float2 layer2flowUV = CalculateRotateScaledUV(_Layer2_FlowRotate, _Layer2_FlowScale, _Layer2_FlowTranslate, layer2uv);
				half4 layer2FlowCol = tex2D(_Layer2_FlowTex, layer2flowUV) - _Layer2_FlowParams.zw;
				layer2uv += layer2FlowCol.rg * _Layer2_FlowParams.xy;
#endif
				half4 layer2Col = tex2D(_Layer2_Tex, layer2uv);
				half layer2Rate = layer2Col.w * min(dot(maskCol, _Layer2_Mask), 1.0);
				half2 layer2DistortRateVec = layer2Col.xy * layer2Rate;
				distortion = distortion + layer2DistortRateVec * _Layer2_Distortion.zw * layer2Rate;
				mainDistortion += layer2DistortRateVec * _Layer2_Distortion.xy * layer2Rate;
#endif

				float2 layer1uv = i.uv0.zw + distortion * 0.001;
#if _LAYER1_FLOWMAP
				float2 layer1flowUV = CalculateRotateScaledUV(_Layer1_FlowRotate, _Layer1_FlowScale, _Layer1_FlowTranslate, layer1uv);
				half4 layer1FlowCol = tex2D(_Layer1_FlowTex, layer1flowUV) - _Layer1_FlowParams.zw;
				layer1uv += layer1FlowCol.rg * _Layer1_FlowParams.xy;
#endif
				half4 layer1Col = tex2D(_Layer1_Tex, layer1uv);
				half layer1Rate = layer1Col.w * min(dot(maskCol, _Layer1_Mask), 1.0);
				half2 layer1DistortRateVec = layer1Col.xy * layer1Rate;
				mainDistortion += layer1Col.xy * _Layer1_Distortion * layer1Rate;

				float2 mainUV = i.uv0.xy + mainDistortion * 0.001;
				half4 mainCol = tex2D(_MainTex, mainUV);

				layer1Col = layer1Col * (_Layer1_Color * _Layer1_Color.w);
				half4 col1 = mainCol;
				if (_Layer1_Blend.w > 0.0)
				{
					col1 = lerp(mainCol, layer1Col, clamp(_Layer1_Blend.w * layer1Col.w, 0.0, 1.0));
				}
				col1 = col1 + col1 * layer1Col * _Layer1_Blend.y;
				col1 = col1 + layer1Col * _Layer1_Blend.x;
				if (_Layer1_Blend.z > 0.0)
				{
					half4 col11 = lerp(2.0 * col1 * layer1Col, 1.0 - (2.0 * (1.0 - col1) * (1.0 - layer1Col)), min(floor(col1 * 2.0), float4(1.0, 1.0, 1.0, 1.0)));
					col1 = lerp(mainCol, col11, _Layer1_Blend.z);
				}
				fixed4 finalColor = lerp(mainCol, col1, layer1Rate);

#if _LAYER2 || _LAYER3 || _LAYER4 || _Layer5
				layer2Col = layer2Col * (_Layer2_Color * _Layer2_Color.w);
				half4 col2 = finalColor;
				if (_Layer2_Blend.w > 0.0)
				{
					col2 = lerp(finalColor, layer2Col, clamp(_Layer2_Blend.w * layer2Col.w, 0.0, 1.0));
				}
				col2 = col2 + (col2 * layer2Col * _Layer2_Blend.y);
				col2 = col2 + layer2Col * _Layer2_Blend.x;
				if (_Layer2_Blend.z > 0.0)
				{
					half4 col22 = lerp(2.0 * col2 * layer2Col, 1.0 - (2.0 * (1.0 - col2) * (1.0 - layer2Col)), min(floor(col2 * 2.0), float4(1.0, 1.0, 1.0, 1.0)));
					col2 = lerp(finalColor, col22, _Layer2_Blend.z);
				}
				finalColor = lerp(finalColor, col2, layer2Rate);
#endif

#if _LAYER3 || _LAYER4 || _Layer5
				layer3Col = layer3Col * (_Layer3_Color * _Layer3_Color.w);
				half4 col3 = finalColor;
				if (_Layer2_Blend.w > 0.0)
				{
					col3 = lerp(finalColor, layer3Col, clamp(_Layer3_Blend.w * layer3Col.w, 0.0, 1.0));
				}
				col3 = col3 + (col3 * layer3Col * _Layer3_Blend.y);
				col3 = col3 + layer3Col * _Layer3_Blend.x;
				if (_Layer3_Blend.z > 0.0)
				{
					half4 col33 = lerp(2.0 * col3 * layer3Col, 1.0 - (2.0 * (1.0 - col3) * (1.0 - layer3Col)), min(floor(col3 * 2.0), float4(1.0, 1.0, 1.0, 1.0)));
					col3 = lerp(finalColor, col33, _Layer3_Blend.z);
				}
				finalColor = lerp(finalColor, col3, layer3Rate);
#endif

#if _LAYER4 || _Layer5
				layer4Col = layer4Col * (_Layer4_Color * _Layer4_Color.w);
				half4 col4 = finalColor;
				if (_Layer4_Blend.w > 0.0)
				{
					col4 = lerp(finalColor, layer4Col, clamp(_Layer4_Blend.w * layer4Col.w, 0.0, 1.0));
				}
				col4 = col4 + (col4 * layer4Col * _Layer4_Blend.y);
				col4 = col4 + layer4Col * _Layer4_Blend.x;
				if (_Layer4_Blend.z > 0.0)
				{
					half4 col44 = lerp(2.0 * col4 * layer4Col, 1.0 - (2.0 * (1.0 - col4) * (1.0 - layer4Col)), min(floor(col4 * 2.0), float4(1.0, 1.0, 1.0, 1.0)));
					col4 = lerp(finalColor, col44, _Layer4_Blend.z);
				}
				finalColor = lerp(finalColor, col4, layer4Rate);
#endif

#if _Layer5
				layer5Col = layer5Col * (_Layer5_Color * _Layer5_Color.w);
				half4 col5 = finalColor;
				if (_Layer5_Blend.w > 0.0)
				{
					col5 = lerp(finalColor, layer5Col, clamp(_Layer5_Blend.w * layer5Col.w, 0.0, 1.0));
				}
				col5 = col5 + (col5 * layer5Col * _Layer5_Blend.y);
				col5 = col5 + layer5Col * _Layer5_Blend.x;
				if (_Layer5_Blend.z > 0.0)
				{
					half4 col55 = lerp(2.0 * col5 * layer5Col, 1.0 - (2.0 * (1.0 - col5) * (1.0 - layer5Col)), min(floor(col5 * 2.0), float4(1.0, 1.0, 1.0, 1.0)));
					col5 = lerp(finalColor, col55, _Layer5_Blend.z);
				}
				finalColor = lerp(finalColor, col5, layer5Rate);
#endif

				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "CardCustomEditor"
}

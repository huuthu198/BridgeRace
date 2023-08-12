Shader "Shader Graphs/Snow" {
	Properties {
		[NoScaleOffset] _MainTex ("Main Texture", 2D) = "white" {}
		[NoScaleOffset] [Normal] _Normal ("Normal Texture", 2D) = "bump" {}
		[NoScaleOffset] _TrailColor ("Trail Texture", 2D) = "white" {}
		[NoScaleOffset] _TrailNormal ("Trail Normal Texture", 2D) = "white" {}
		_TrailBlend ("Trail Blending", Range(0, 1)) = 0
		_TrailColor_1 ("TrailColor", Vector) = (1,1,1,1)
		[NoScaleOffset] _SplatMap ("SplatMap", 2D) = "black" {}
		_HeightMultiplier ("Height Multiplier", Float) = 0
		_DissolveRate ("Splat Dissolve", Float) = 0
		[NoScaleOffset] _Noise ("Noise Texture", 2D) = "white" {}
		_Emission ("Emission", Float) = 0
		_SnowGloss ("Snow Gloss", Float) = 0
		_TrailGloss ("Trail Gloss", Float) = 0
		Vector2_7B6887A ("Noise Tiling", Vector) = (0,0,0,0)
		_SparkleMix ("SparkleMix", Range(0, 1)) = 0.5
		_TrailTiling ("Trail Tiling", Vector) = (0,0,0,0)
		_BaseColor ("BaseColor", Vector) = (0,0,0,0)
		_NormalStrenght ("NormalStrenght", Float) = 0
		[HideInInspector] _QueueOffset ("_QueueOffset", Float) = 0
		[HideInInspector] _QueueControl ("_QueueControl", Float) = -1
		[HideInInspector] [NoScaleOffset] unity_Lightmaps ("unity_Lightmaps", 2DArray) = "" {}
		[HideInInspector] [NoScaleOffset] unity_LightmapsInd ("unity_LightmapsInd", 2DArray) = "" {}
		[HideInInspector] [NoScaleOffset] unity_ShadowMasks ("unity_ShadowMasks", 2DArray) = "" {}
	}
	//DummyShaderTextExporter
	SubShader{
		Tags { "RenderType"="Opaque" }
		LOD 200
		CGPROGRAM
#pragma surface surf Standard
#pragma target 3.0

		sampler2D _MainTex;
		struct Input
		{
			float2 uv_MainTex;
		};

		void surf(Input IN, inout SurfaceOutputStandard o)
		{
			fixed4 c = tex2D(_MainTex, IN.uv_MainTex);
			o.Albedo = c.rgb;
			o.Alpha = c.a;
		}
		ENDCG
	}
	Fallback "Hidden/Shader Graph/FallbackError"
	//CustomEditor "UnityEditor.ShaderGraph.GenericShaderGraphMaterialGUI"
}
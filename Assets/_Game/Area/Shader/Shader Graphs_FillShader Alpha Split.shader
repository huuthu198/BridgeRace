Shader "Shader Graphs/FillShader Alpha Split" {
	Properties {
		_FillMin ("FillMin", Float) = 0
		_FillMax ("FillMax", Float) = 0
		_FillAmount ("FillAmount", Float) = 0
		_Metallic ("Metallic", Float) = 0
		_Smoothness ("Smoothness", Float) = 0
		Color_b43fd8118e424606bab700a896a542a4 ("DefaultColor", Vector) = (0,0,0,0)
		_FillColor ("FillColor", Vector) = (0,0,0,0)
		[NoScaleOffset] _GradientTexture ("GradientTexture", 2D) = "white" {}
		[HideInInspector] _QueueOffset ("_QueueOffset", Float) = 0
		[HideInInspector] _QueueControl ("_QueueControl", Float) = -1
		[HideInInspector] [NoScaleOffset] unity_Lightmaps ("unity_Lightmaps", 2DArray) = "" {}
		[HideInInspector] [NoScaleOffset] unity_LightmapsInd ("unity_LightmapsInd", 2DArray) = "" {}
		[HideInInspector] [NoScaleOffset] unity_ShadowMasks ("unity_ShadowMasks", 2DArray) = "" {}
	}
	//DummyShaderTextExporter
	SubShader{
		Tags { "RenderType" = "Opaque" }
		LOD 200
		CGPROGRAM
#pragma surface surf Standard
#pragma target 3.0

		struct Input
		{
			float2 uv_MainTex;
		};

		void surf(Input IN, inout SurfaceOutputStandard o)
		{
			o.Albedo = 1;
		}
		ENDCG
	}
	Fallback "Hidden/Shader Graph/FallbackError"
	//CustomEditor "UnityEditor.ShaderGraph.GenericShaderGraphMaterialGUI"
}
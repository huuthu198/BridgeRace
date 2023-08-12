Shader "Shader Graphs/DeformSea" {
	Properties {
		Vector1_5572C99E ("Speed", Float) = 0.5
		Vector1_41FB9715 ("Scale", Float) = 50
		Vector1_547CC3EB ("Height", Float) = 0.2
		Vector1_74C47520 ("Smoothness", Float) = 0.7
		Vector1_FF4E8C2D ("Metallic", Float) = 0
		Vector1_86467C60 ("Occulusion", Float) = 1
		Color_BD726D9 ("Color", Vector) = (0,0,0,0)
		Color_BD726D9_1 ("Emission", Vector) = (0,0,0,0)
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
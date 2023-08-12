Shader "Stylized Water" {
	Properties {
		[NoScaleOffset] _WaterColorGradientTexture ("Gradient Texture", 2D) = "white" {}
		_WaterColorShallow ("Shallow Color", Vector) = (0,0.7725491,0.6235294,0.5019608)
		_WaterColorDeep ("Deep Color", Vector) = (0.01176471,0.2862745,0.509804,1)
		_WaterColorDepth ("Color Depth", Float) = 0.8
		_WaterColorHorizon ("Horizon Color", Vector) = (0,0.227451,0.8,1)
		_WaterColorHorizonDistance ("Horizon Distance", Float) = 20
		_ShoreColor ("Shore Color", Vector) = (0,0.9803922,0.3019608,0.3411765)
		_ShoreDepth ("Shore Depth", Float) = 0.74
		_ShoreFade ("Shore Fade", Float) = 1
		_ShoreBlend ("Shore Blend", Float) = 1
		_WaveColor ("Wave Color", Vector) = (0,0,0,0)
		_WaterColorUnderwater ("Underwater Color", Vector) = (0.2039216,0.3098039,0.5176471,0)
		[NoScaleOffset] _SurfaceFoamTexture ("Surface Foam Texture", 2D) = "black" {}
		_SurfaceFoamSampling ("Surface Foam Sampling", Vector) = (0.62,0,0,0)
		_SurfaceFoamBlend ("Surface Foam Blend", Float) = 1
		_SurfaceFoamColor1 ("Surface Foam Color 1", Vector) = (1,1,1,0.3215686)
		_SurfaceFoamColor2 ("Surface Foam Color 2", Vector) = (1,1,1,0.7294118)
		_SurfaceFoamMovement ("Surface Foam Movement", Vector) = (0.7,0,0.47,0.01)
		_SurfaceFoamTilingAndOffset ("Surface Foam Tiling and Offset", Vector) = (-1,-1,0.57,0.22)
		[NoScaleOffset] _IntersectionFoamTexture ("Intersection Foam Texture", 2D) = "white" {}
		_IntersectionFoamSampling ("Intersection Foam Sampling", Vector) = (1,0,0,0)
		_IntersectionFoamBlend ("Intersection Foam Blend", Float) = 1
		_IntersectionFoamColor ("Intersection Foam Color", Vector) = (1,1,1,1)
		_IntersectionFoamDepth ("Intersection Depth", Float) = 0.72
		[NoScaleOffset] _NormalsTexture ("Normals Texture", 2D) = "white" {}
		_FoamShadowDepth ("Foam Shadow Depth", Float) = 10
		_SurfaceFoamShadowProjection ("Surface Foam Shadow Projection", Float) = 15
		_IntersectionFoamShadowProjection ("Intersection Foam Shadow Projection", Float) = 4.6
		_WaveVisuals ("Wave Visuals", Vector) = (0.132,7.9,1.38,0)
		_WaveDirections ("Wave Directions", Vector) = (0,0.64,1,0.33)
		_PlanarReflectionStrength ("Reflection Strength", Float) = 0.82
		_PlanarReflectionFresnel ("Reflection Fresnel", Float) = 2.5
		_RefractionStrength ("Refraction", Float) = 0.022
		_NormalsMovement ("Normals Movement", Vector) = (0.04,0.36,0,0)
		_NormalsStrength ("Normals Strength", Float) = 0.29
		_LightingSmoothness ("Smoothness", Range(0, 1)) = 1
		_LightingHardness ("Hardness", Float) = 0
		_LightingSpecularColor ("Specular", Vector) = (1,1,1,0)
		_LightingDiffuseColor ("Diffuse", Vector) = (0,0,0,0)
		_UnderwaterRefractionStrength ("Underwater Refraction", Float) = 0.099
		_SurfaceFoamHeightMask ("Height Mask", Range(0, 1)) = 0
		_SurfaceFoamHeightMaskSmoothness ("Height Mask Smoothness", Range(0, 1)) = 0
		_FoamShadowStrength ("Shadow Strength", Float) = 0.45
		_IntersectionFoamMovement ("Intersection Foam Movement", Vector) = (0,0,0,0)
		_IntersectionFoamScale ("Intersection Foam Scale", Float) = 0.19
		_IntersectionWaterBlend ("Intersection Water Blend", Range(0, 1)) = 0
		_ShoreFoamSpeed ("Shore Foam Speed", Float) = 0
		_ShoreFoamWidth ("Shore Foam Width", Float) = 0
		_ShoreFoamFrequency ("Shore Foam Frequency", Float) = 0
		_ShoreFoamBreakupStrength ("Shore Foam Breakup Strength", Float) = 0
		_ShoreFoamBreakupScale ("Shore Foam Breakup Scale", Float) = 0
		[NoScaleOffset] _CausticsTexture ("Caustics Texture", 2D) = "white" {}
		_CausticsStrength ("Caustics Strength", Float) = 2.09
		_CausticsSplit ("Caustics RGB Split", Float) = 0.318
		_CausticsSpeed ("Caustics Speed", Float) = 0.219
		_CausticsScale ("Caustics Scale", Float) = 2.41
		_CausticsShadowMask ("Shadow Mask", Float) = 1
		_CausticsDepth ("Caustics Depth", Float) = 0.6
		[HideInInspector] _QueueOffset ("_QueueOffset", Float) = 0
		[HideInInspector] _QueueControl ("_QueueControl", Float) = -1
		[HideInInspector] [NoScaleOffset] unity_Lightmaps ("unity_Lightmaps", 2DArray) = "" {}
		[HideInInspector] [NoScaleOffset] unity_LightmapsInd ("unity_LightmapsInd", 2DArray) = "" {}
		[HideInInspector] [NoScaleOffset] unity_ShadowMasks ("unity_ShadowMasks", 2DArray) = "" {}
		[Toggle] SURFACE_FOAM ("Surface Foam", Float) = 0
		[Toggle] INTERSECTION_EFFECTS ("Intersection Effects", Float) = 1
		[Toggle] FOAM_SHADOWS ("Foam Shadows", Float) = 1
		[Toggle] WATER_LIGHTING ("Lighting", Float) = 1
		[Toggle] SHORE_MOVEMENT ("Shore Movement", Float) = 0
		[Toggle] WORLD_SPACE_UV ("World Space", Float) = 1
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
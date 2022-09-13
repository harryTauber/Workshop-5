//UNITY_SHADER_NO_UPGRADE

Shader "Unlit/TextureVertexShader"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
        _BlendFct ("Blend Factor", Float) = 0.5
	}
	SubShader
	{
		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			#include "UnityCG.cginc"

			uniform sampler2D _MainTex;	
            uniform float _BlendFct;

			struct vertIn
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
                float4 color: COLOR;
			};

			struct vertOut
			{
				float4 vertex : SV_POSITION;
				float2 uv : TEXCOORD0;
                float4 color: COLOR;
			};

			// Implementation of the vertex shader
			vertOut vert(vertIn v)
			{
				vertOut o;
				o.vertex = mul(UNITY_MATRIX_MVP, v.vertex);
                o.color = v.color;
				o.uv = v.uv;
				return o;
			}
			
			// Implementation of the fragment (pixel) shader
			fixed4 frag(vertOut v) : SV_Target
			{
				fixed4 color = (tex2D(_MainTex, v.uv)*_BlendFct) + (v.color*(1-_BlendFct));
				return color;
			}
			ENDCG
		}
	}
}

Shader "Proto/ToonRamp" {
    Properties {
        _Color ("Color", Color) = (1,1,1,1)
        _RampTex ("Ramp", 2D) = "white" {}
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        LOD 200
        
        CGPROGRAM
        #pragma surface surf ToonRamp

        fixed4 _Color;
        sampler2D _RampTex;

        half4 LightingToonRamp(SurfaceOutput s, half3 lightDir, half atten) {
            half diffuse = dot(s.Normal, lightDir);
            float h = diffuse * 0.5 + 0.5;
            float2 rh = h;
            float3 ramp = tex2D(_RampTex, rh).rgb;

            half4 c;
            c.rgb = s.Albedo * _LightColor0.rgb * (ramp * atten);
            c.a = s.Alpha;
            return c;
        }

        struct Input {
            float2 uv_MainTex;
            float3 viewDir;
        };

        void surf (Input IN, inout SurfaceOutput o) {
            half diffuse = dot(o.Normal, IN.viewDir);
            float h = diffuse * 0.5 + 0.5;
            float2 rh = h;
            float3 ramp = tex2D(_RampTex, rh).rgb;
            o.Albedo = ramp;
            // o.Albedo = _Color.rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}

Shader "Proto/RimShader" {
    Properties {
        _tex ("Texture", 2D) = "white" {}
        _rimColor ("Rim Color", Color) = (0, 0.5, 0.5, 0)
        _rimPower ("Rim Power", Range(0.5, 8)) = 2
        _rimThreshold ("Rim Threshold", Range(0, 1)) = 0.5
    }

    SubShader {

        CGPROGRAM
            #pragma surface surf Standard

            struct Input {
                float2 uv_MainTex;
                float3 viewDir;
                float3 worldPos;
            };

            float4 _rimColor;
            float _rimPower;
            float _rimThreshold;

            sampler2D _tex;

            void surf (Input IN, inout SurfaceOutputStandard o) {
                o.Albedo = tex2D (_tex, IN.uv_MainTex).rgb;

                half rim = 1 - saturate(dot(normalize(IN.viewDir), o.Normal));
                o.Emission = frac(IN.worldPos.y * 10 * _rimPower) > _rimThreshold ? rim  : 0;
                // o.Emission = IN.worldPos > _rimThreshold ? rim  : 0;
                // o.Emission = _rimColor.rgb * pow(rim, _rimPower) > _rimThreshold ? rim : 0;
                // o.Emission = _rimColor.rgb * pow(rim, _rimPower) > 0.8 ? rim : 0;
            }
        ENDCG

    }

    Fallback "Diffuse"
}
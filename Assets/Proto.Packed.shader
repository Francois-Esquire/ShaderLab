Shader "Proto/PackedShader" {

    Properties {
        _color ("Color", Color) = (1,1,1,1)
    }

    SubShader {

        CGPROGRAM
            #pragma surface surf Lambert

            struct Input {
                float2 uvMainTex;
            };

            fixed4 _color;

            void surf (Input IN, inout SurfaceOutput o) {
                o.Albedo.r = _color.r;
            }
        ENDCG

    }

    Fallback "Diffuse"
}
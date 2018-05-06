Shader "Proto/Surface" {

	Properties {
        _color ("Surface Color", Color) = (1,1,1,1)
        _emission ("Surface Emission", Color) = (1,1,1,1)
		_normals ("Surface Normals", Color) = (1,1,1,1)
	}
    
	SubShader {
		
		CGPROGRAM
            #pragma surface surf Lambert

            struct Input {
                float2 uvMainTex;
            };

            fixed4 _color;
            fixed4 _emission;
            fixed4 _normals;

            void surf (Input IN, inout SurfaceOutput o) {
                o.Albedo = _color.rgb;
                o.Emission = _emission.rgb;
                o.Normal = _normals.rgb;
            }

		ENDCG
	}
    
	FallBack "Diffuse"
    
}

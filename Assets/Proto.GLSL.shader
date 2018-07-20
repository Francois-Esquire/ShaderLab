Shader "Proto/GLSL" {
    Properties {
        _MainTex ("Base (RGB)", 2D) = "white" {}
        _rimColor ("Rim Color", Color) = (0, 0.5, 0.5, 0)
        _rimPower ("Rim Power", Range(0.5, 8)) = 2
    }
   
    SubShader {
        Tags { "Queue" = "Geometry" }
       
        Pass {
            GLSLPROGRAM
           
            #ifdef VERTEX
           
            varying vec2 TextureCoordinate;
           
            void main()
            {
                gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
                TextureCoordinate = gl_MultiTexCoord0.xy;
            }
           
            #endif
           
            #ifdef FRAGMENT
                       
            uniform sampler2D _MainTex;
            varying vec2 TextureCoordinate;
           
            void main()
            {
                gl_FragColor = texture2D(_MainTex, TextureCoordinate);
            }
           
            #endif
           
            ENDGLSL
        }
    }
}
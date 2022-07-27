 // Need to provide precision  mediump - highp - lowp
 
 precision mediump float;

// Varying declared on Vertex shader
 varying float vRandom;
 varying vec2 vUv;
 varying float vElevation;

 uniform vec3 uColor;
 uniform sampler2D uTexture;

void main(){
    // Blue & Purple varying
    // gl_FragColor = vec4(vRandom, vRandom* 0.5, 1.0, 1.0);
    // gl_FragColor = vec4(uColor, 1.0);
    
    vec4 textureColor = texture2D(uTexture, vUv);
    textureColor.rgb *= vElevation * 2.0 + 0.5;

    gl_FragColor = textureColor;
}
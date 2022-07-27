/*
* Uniform matrices
*/
// Uniform are global variables made accessible to us. You can also create uniforms inside THREE.RawShaderMa terial


uniform mat4 modelMatrix; // apply transformations to the Mesh (position, rotation, scale)
uniform mat4 viewMatrix;   // apply transformations to the camera (position,rotation, fov, near, far)
uniform mat4 projectionMatrix;  // transform the coordinates into thew clip space coordinates
uniform vec2 uFrequency; // new created uniform in threeJS
uniform float uTime;

/*
* Attributes
*/
/*
    The attributes are found in the Mesh Geometry. The vertex shader has access to them,
    the default attributes are position, normal & uv.

    However we can create custom attributes like aRandom by using new THREE.BufferAttribute.
*/

attribute vec3 position;
attribute float aRandom;
attribute vec2 uv;

/*
*  Varyings
*/
// Varyings are variables that we pass to the fragment shader.


varying float vRandom;
varying vec2 vUv;
varying float vElevation;

void main(){
    // gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(position, 1.0);
    
    // Or

    vec4 modelPosition = modelMatrix * vec4(position, 1.0);
    
    /*
    *  Making wave transforming model position
    */
    float elevation = sin(modelPosition.x * uFrequency.x - uTime) * 0.1 ;
    elevation += sin(modelPosition.y * uFrequency.y - uTime) * 0.1 ;

    modelPosition.z += elevation;

    /*
    *  Making random transformation using random attribute
    */
    // modelPosition.z += aRandom * 0.1;



    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;

    gl_Position = projectedPosition;

    vRandom = aRandom;
    vUv = uv;
    vElevation = elevation;
}
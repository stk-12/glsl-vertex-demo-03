varying vec2 vUv;
uniform float uTime;

varying vec3 vNormal;
varying float vDistortion;

#pragma glslify: pnoise = require(glsl-noise/periodic/3d);
#pragma glslify: rotateY = require(glsl-rotate/rotateY);

void main() {
  vUv = uv;
  vec3 pos = position;

  float distortion = pnoise((normal + uTime), vec3(20.0) * 1.5) * 30.0;
  pos = pos + (normal + distortion);

  vNormal = normal;
  vDistortion = distortion * 0.1;

  gl_Position = projectionMatrix * modelViewMatrix * vec4(pos, 1.0);
}
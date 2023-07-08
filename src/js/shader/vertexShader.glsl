varying vec2 vUv;
uniform float uTime;
uniform float uSpeed;
uniform float uWave;

varying vec3 vNormal;
varying float vDistortion;

#pragma glslify: pnoise = require(glsl-noise/periodic/3d);
#pragma glslify: rotateY = require(glsl-rotate/rotateY);

void main() {
  vUv = uv;
  vec3 pos = position;

  // vec2 noiseFreq = vec2(2.0, 3.0);
  // float noiseFreq = 2.0;

  float distortion = pnoise((normal + uTime * uSpeed), vec3(20.0) * 1.5) * uWave;
  // distortion = max(0.5, distortion);
  pos = pos + (normal + distortion);

  vNormal = normal;
  vDistortion = distortion * 0.1;

  gl_Position = projectionMatrix * modelViewMatrix * vec4(pos, 1.0);
}
#version 330 core

out vec3 color;

in vec3 vertexPosition_worldspace;
in vec3 Normal_cameraspace;

in struct Light
{
  vec3 position;
  vec3 direction;
} light;

uniform vec3 pawnColor;

void main()
{
  vec3 n = normalize(Normal_cameraspace);

  vec3 l = normalize(light.direction);
  float dist = length(vertexPosition_worldspace - light.position);

  float cosTheta = clamp(dot(n,l), 0.0, 1.0);

  vec3 ambientColor = vec3(0.03,0.03,0.03) + pawnColor/4.0;
  vec3 modelColor = ambientColor + pawnColor*cosTheta/pow(dist,2)*360;
  color = modelColor;
}

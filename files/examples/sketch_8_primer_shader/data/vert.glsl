uniform mat4 transform;

attribute vec4 position;
attribute vec4 color;

varying vec4 fcolor;

void main() {
  // aqui aplicamos transformacion de coordenadas
  gl_Position = transform * position;
  fcolor = color;
}
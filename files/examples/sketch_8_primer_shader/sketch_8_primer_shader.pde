PShader minimo; 

void setup() {
  size(600, 600, P3D);
  minimo = loadShader("frag.glsl", "vert.glsl");
  fill(0, 0, 255);
}

void draw() {
  background(150);
  shader(minimo);
  translate(width/2, height/2);
  rotateY(0.01 * frameCount);
  sphere(200);
}

void keyPressed() {
  save("flat.png");  
}
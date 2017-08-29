float angulo = 0;
void setup() {
  size(640, 480, P3D);
  fill(#AD71B7);
}

void draw() {
  background(#81B771);
  
  lights();
  
  translate(width/2, height/2);
  rotateY(angulo);
  rotateX(angulo*2);
  box(200);
  
  angulo += 0.01;
}
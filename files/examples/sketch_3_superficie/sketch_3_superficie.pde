void setup() {
  size(640, 360, P3D);
  smooth(8);
  frameRate(120);
}

void draw() {
  background(150);  
  lights();
  translate(width/2, height/2);
  rotateX(QUARTER_PI);
  beginShape(QUADS);
  for (int i = 0; i < 50; i++) {
    for (int j = 0; j < 50; j++) {
      float x0 = map(i, 0, 50, -width/2, width/2);
      float y0 = map(j, 0, 50, -height/2, height/2);
      float x1 = x0 + width/50.0;
      float y1 = y0 + height/50.0;
      float t = 0.0001 * millis();
      float z1 = 100 * noise(0.1 * i, 0.1 * j, t);
      float z2 = 100 * noise(0.1 * (i + 1), 0.1 * j, t);
      float z3 = 100 * noise(0.1 * (i + 1), 0.1 * (j + 1), t);
      float z4 = 100 * noise(0.1 * i, 0.1 * (j + 1), t);
      vertex(x0, y0, z1);
      vertex(x1, y0, z2);
      vertex(x1, y1, z3);
      vertex(x0, y1, z4);
    }
  }
  endShape();
}
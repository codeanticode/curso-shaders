PVector[] coordenadas;

void setup() {
  size(800, 600, P3D);

  String[] lineas = loadStrings("puntos.txt");  
  coordenadas = new PVector[lineas.length];
  for (int i = 0; i < lineas.length; i++) {
    String linea = lineas[i];
    String[] valores = linea.split(" ");
    float x = float(valores[0]);
    float y = float(valores[1]);
    float z = float(valores[2]);
    coordenadas[i] = new PVector(x, y, z);
  }  
  noStroke();
}

void draw() {
  background(255);
  
  fill(0);
  text(frameRate, 30, 30);
  
  fill(255, 0, 0);
  lights();
  translate(width/2, height/2, -1000);
  rotateY(map(mouseX, 0, width, 0, TWO_PI));
  for (PVector v: coordenadas) {
    pushMatrix();
    translate(v.x, v.y, v.z);
    sphere(10);
    popMatrix();
  }  
}
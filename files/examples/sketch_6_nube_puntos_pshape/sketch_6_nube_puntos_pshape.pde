PVector[] coordenadas; 
PShape esferas;

void setup() {
  size(800, 600, P3D);

  esferas = createShape(GROUP);
  String[] lineas = loadStrings("puntos.txt");  
  coordenadas = new PVector[lineas.length];
  for (int i = 0; i < lineas.length; i++) {
    String linea = lineas[i];
    String[] valores = linea.split(" ");
    float x = float(valores[0]);
    float y = float(valores[1]);
    float z = float(valores[2]);
    coordenadas[i] = new PVector(x, y, z);
    PShape esfera = createShape(SPHERE, 10);
    esfera.translate(x, y, z);
    esfera.setFill(color(255, 0, 0));
    esfera.setStroke(false);
    esferas.addChild(esfera);
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
  shape(esferas);
}
PShape star;

void setup() {
  size(640, 360, P2D);
  star = createShape();
  star.beginShape();
  star.fill(102);
  star.stroke(255);
  star.strokeWeight(2);
  star.vertex(0, -50);
  star.vertex(14, -20);
  star.vertex(47, -15);
  star.vertex(23, 7);
  star.vertex(29, 40);
  star.vertex(0, 25);
  star.vertex(-29, 40);
  star.vertex(-23, 7);
  star.vertex(-47, -15);
  star.vertex(-14, -20);
  star.endShape(CLOSE);
}

void draw() {
  background(51);
  translate(mouseX, mouseY);
  shape(star);
}
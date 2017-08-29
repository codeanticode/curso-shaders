float r = 0;
void setup() {
  size(300, 300);
  background(240, 53, 97); 
  //noStroke();
  stroke(20, 50, 150);
  fill(255, 100);
}

void draw() {  
  r = abs(30 * cos(frameRate));
  ellipse(mouseX, mouseY, r, r);  
}

void keyPressed() {
  background(240, 53, 97);  
} 
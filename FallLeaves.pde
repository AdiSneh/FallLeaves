PVector wind; // TODO
Forest forest;

void setup() {
  size(500, 300);
  forest = new Forest(30, width, height);
}

void draw() {
  background(110, 180, 255);
  forest.run();
}

void mousePressed() {
  println(mouseX, mouseY);
}

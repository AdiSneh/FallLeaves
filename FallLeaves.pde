PVector wind;
Forest forest;

void setup() {
  size(770, 500);
  forest = new Forest(50, width, height);
}

void draw() {
  background(110, 180, 255);
  forest.run();
}

void mousePressed() {
  println(mouseX, mouseY);
}

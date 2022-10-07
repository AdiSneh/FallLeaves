PVector wind; // TODO - also make them fall at the end
Forest forest;

void setup() {
  size(600, 400);
  forest = new Forest(20, width, height);
}

void draw() {
  background(110, 180, 255);
  forest.run();
}

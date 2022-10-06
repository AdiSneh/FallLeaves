class Leaf {
  PVector LEAF_SIZE = new PVector(5, 10);
  color MAX_LEAF_COLOR = color(100, 50, 10);
  
  PVector position;
  PVector size;
  color color_;
  float angle;
  
  Leaf(float x, float y) {
    position = new PVector(x, y);
    size = new PVector(LEAF_SIZE.x, LEAF_SIZE.y);
    color_ = color(10, 180, 40);
    angle = random(radians(-20), radians(20));
  }
  
  void run() {
    update();
    render();
  }
  
  // Method to update position
  void update() {
  }
  
  void render() {
    fill(color_);
    float leafVeinColorDiff = 20;
    stroke(red(color_) - leafVeinColorDiff, green(color_) - leafVeinColorDiff, blue(color_) - leafVeinColorDiff);
    
    pushMatrix();
    
    translate(position.x, position.y);
    rotate(angle);
    
    beginShape(TRIANGLE_FAN);
    vertex(0, 0);
    vertex(0, -size.y);
    vertex(+size.x, 0);
    vertex(0, size.y);
    vertex(-size.x, 0);
    vertex(0, -size.y);
    // TODO: Make more intricate veins
    endShape();
        
    popMatrix();
  }
}

class Leaf {
  PVector LEAF_SIZE = new PVector(5, 10);
  
  PVector position;
  PVector size;
  color color_;
  float angle;
  
  Leaf(float x, float y) {
    position = new PVector(x, y);
    size = new PVector(LEAF_SIZE.x, LEAF_SIZE.y);
    color_ = color(0, 255, 100);
    angle = 0;  // TODO
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
    
    rotate(angle);
    
    beginShape(TRIANGLE_FAN);
    vertex(position.x, position.y);
    vertex(position.x, position.y - size.y);
    vertex(position.x + size.x, position.y);
    vertex(position.x, position.y + size.y);
    vertex(position.x - size.x, position.y);
    vertex(position.x, position.y - size.y);
    // TODO: Make more intricate veins
    endShape();
    
    popMatrix();
  }
}

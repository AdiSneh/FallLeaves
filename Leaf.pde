class Leaf {
  PVector LEAF_SIZE = new PVector(5, 10);
  color INITIAL_LEAF_COLOR = color(0, 120, 10);
  color FINAL_LEAF_COLOR = color(100, 50, 10);
  
  PVector position;
  PVector size;
  color color_;
  float angle;
  
  Leaf(float x, float y) {
    position = new PVector(x, y);
    size = new PVector(LEAF_SIZE.x, LEAF_SIZE.y);
    color_ = INITIAL_LEAF_COLOR;
    angle = random(radians(-20), radians(20));
  }
  
  void run(float treeColorVariance) {
    update(treeColorVariance);
    render();
  }
  
  void update(float treeColorVariance) {
    // TODO: Make the trees turn yellow first
    
    float newRed = red(color_);
    float newGreen = green(color_);
    float newBlue = blue(color_);
    if (red(color_) > red(FINAL_LEAF_COLOR)) {
      newRed = red(color_) - random(max(0, treeColorVariance - 50), treeColorVariance);
    }
    if (green(color_) > green(FINAL_LEAF_COLOR)) {
      newGreen = green(color_) - random(max(0, treeColorVariance - 10), treeColorVariance);
    }
    if (blue(color_) > blue(FINAL_LEAF_COLOR)) {
      newBlue = blue(color_) - random(max(0, treeColorVariance - 10), treeColorVariance);
    }
    
    color_ = color(max(red(FINAL_LEAF_COLOR), newRed), max(green(FINAL_LEAF_COLOR), newGreen), max(blue(FINAL_LEAF_COLOR), newBlue));
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

class Leaf {
  PVector LEAF_SIZE = new PVector(5, 10);
  color INITIAL_LEAF_COLOR = color(0, 120, 10);
  color INTERMEDIATE_LEAF_COLOR = color(190, 180, 0);
  color FINAL_LEAF_COLOR = color(100, 50, 10);
  boolean isBeforeIntermediate = true;
  
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
    float newRed = red(color_);
    float newGreen = green(color_);
    float newBlue = blue(color_);
        
    if (isBeforeIntermediate) {
      if (red(color_) != red(INTERMEDIATE_LEAF_COLOR)) {
        newRed = red(color_) + getRandomLeafColorVariance(treeColorVariance);
      }
      if (green(color_) != green(INTERMEDIATE_LEAF_COLOR)) {
        newGreen = green(color_) + getRandomLeafColorVariance(treeColorVariance);
      }
      if (blue(color_) != blue(INTERMEDIATE_LEAF_COLOR)) {
        newBlue = blue(color_) - getRandomLeafColorVariance(treeColorVariance);
      }
      
      color_ = color(min(red(INTERMEDIATE_LEAF_COLOR), newRed), min(green(INTERMEDIATE_LEAF_COLOR), newGreen), max(blue(INTERMEDIATE_LEAF_COLOR), newBlue));
      if (color_ == INTERMEDIATE_LEAF_COLOR) {
        isBeforeIntermediate = false;
      }
    }
    else {
      if (red(color_) != red(FINAL_LEAF_COLOR)) {
        newRed = red(color_) - getRandomLeafColorVariance(treeColorVariance);
      }
      if (green(color_) != green(FINAL_LEAF_COLOR)) {
        newGreen = green(color_) - getRandomLeafColorVariance(treeColorVariance);
      }
      if (blue(color_) != blue(FINAL_LEAF_COLOR)) {
        newBlue = blue(color_) + getRandomLeafColorVariance(treeColorVariance);
      }
      
      color_ = color(max(red(FINAL_LEAF_COLOR), newRed), max(green(FINAL_LEAF_COLOR), newGreen), min(blue(FINAL_LEAF_COLOR), newBlue));
    }
  }
  
  float getRandomLeafColorVariance(float treeColorVariance) {
    return random(max(0, treeColorVariance - 50), treeColorVariance);
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

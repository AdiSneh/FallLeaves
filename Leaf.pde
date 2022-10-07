class Leaf {
  PVector LEAF_SIZE = new PVector(5, 10);
  color GREEN_COLOR = color(0, 120, 10);
  color YELLOW_COLOR = color(190, 180, 0);
  color BRIGHT_ORANGE_COLOR = color(254,204,92);
  color DARK_ORANGE_COLOR = color(247,140,63);
  color RED_COLOR = color(39,61,34);  // color(220, 180, 0);
  color DARK_RED_COLOR = color(189,32,42);
  color BROWN_COLOR = color(152,56,32); // color(100, 50, 10);
  
  IntList colorStages;
  
  PVector position;
  PVector size;
  color color_;
  float angle;
  
  Leaf(float x, float y) {
    position = new PVector(x, y);
    size = new PVector(LEAF_SIZE.x, LEAF_SIZE.y);
    color_ = GREEN_COLOR;
    angle = random(radians(-20), radians(20));
    
    colorStages = new IntList();
    colorStages.append(GREEN_COLOR);
    colorStages.append(YELLOW_COLOR);
    colorStages.append(BRIGHT_ORANGE_COLOR);
    colorStages.append(DARK_ORANGE_COLOR);
    colorStages.append(RED_COLOR);
    colorStages.append(DARK_RED_COLOR);
    colorStages.append(BROWN_COLOR);
  }
  
  void run(float treeColorVariance) {
    update(treeColorVariance);
    render();
  }
  
  void update(float treeColorVariance) {
    if (colorStages.size() > 1) {
      color previousColor = colorStages.get(0);
      color targetColor = colorStages.get(1);
      
      float newRed = red(color_);
      float newGreen = green(color_);
      float newBlue = blue(color_);
      
      if (red(color_) != red(targetColor)) {
        if (red(targetColor) > red(previousColor)) {
          newRed = min(red(targetColor), red(color_) + getRandomLeafColorVariance(treeColorVariance));
        }
        else {
          newRed = max(red(targetColor), red(color_) - getRandomLeafColorVariance(treeColorVariance));
        }
      }
      if (green(color_) != green(targetColor)) {
        if (green(targetColor) > green(previousColor)) {
          newGreen = min(green(targetColor), green(color_) + getRandomLeafColorVariance(treeColorVariance));
        }
        else {
          newGreen = max(green(targetColor), green(color_) - getRandomLeafColorVariance(treeColorVariance));
        }
      }
      if (blue(color_) != blue(targetColor)) {
        if (blue(targetColor) > blue(previousColor)) {
          newBlue = min(blue(targetColor), blue(color_) + getRandomLeafColorVariance(treeColorVariance));
        }
        else {
          newBlue = max(blue(targetColor), blue(color_) - getRandomLeafColorVariance(treeColorVariance));
        }
      }
      color_ = color(newRed, newGreen, newBlue);
      
      if (color_ == targetColor) {
        colorStages.remove(0);
      }
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

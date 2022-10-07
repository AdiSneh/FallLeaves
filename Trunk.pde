class Trunk {
  float MAX_BARK_INTERVAL = 5;
  PVector SIZE = new PVector(25, 90);
  color COLOR = color(70, 30, 0);
  
  PVector position;
  ArrayList<Number> barkIntervals;  // TODO: Use FloatList
  
  Trunk(float x, float y) {
    position = new PVector(x - SIZE.x / 2, y);
    barkIntervals = new ArrayList<Number>();
    
    float barkWidth = 0;
    float barkInterval = 0;
    while (barkWidth + MAX_BARK_INTERVAL < SIZE.x) {
      barkIntervals.add(barkInterval);
      barkWidth += barkInterval;
      barkInterval = random(MAX_BARK_INTERVAL);
    }
    barkIntervals.add(SIZE.x - barkWidth);
  }
  
  void run() {
    render();
  }
  
  void render() {
    fill(COLOR);
    float barkLineColorDiff = 30;
    stroke(red(COLOR) - barkLineColorDiff, green(COLOR) - barkLineColorDiff, blue(COLOR) - barkLineColorDiff);
    
    pushMatrix();
        
    beginShape(QUAD_STRIP);
    float xVertex = position.x;
    for (Number barkInterval : barkIntervals) {
      vertex(xVertex, position.y);
      vertex(xVertex, position.y + SIZE.y);
      xVertex += (float) barkInterval;
    }
    endShape();
    
    popMatrix();
  }
}

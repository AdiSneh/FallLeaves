class Tree {
  int NUM_LEAVES = 130;
  PVector TREE_SIZE = new PVector(60, 80);
  
  PVector position;
  ArrayList<Leaf> leaves;
  Trunk trunk;
  float colorVariance;
  float colorVarianceRate;
  
  Tree(float x, float y) {
    position = new PVector(x, y);
    
    trunk = new Trunk(position.x, position.y);
    
    leaves = new ArrayList<Leaf>();
    for (int i = 0; i <= NUM_LEAVES; i++) {
      float leafX = random(position.x - TREE_SIZE.x / 2, position.x + TREE_SIZE.x / 2);
      float leafY = random(position.y - TREE_SIZE.y / 2, position.y + TREE_SIZE.y / 2);
      leaves.add(new Leaf(leafX, leafY));
    }
    
    colorVarianceRate = random(1, 2);
  }
  
  void run() {
    update();
    trunk.run();
    for (Leaf leaf : leaves) {
      leaf.run(colorVariance);
    }
  }
  
  void update() {
    colorVariance = abs(randomGaussian()) * colorVarianceRate;
    colorVarianceRate *= 1.005;
  }
}

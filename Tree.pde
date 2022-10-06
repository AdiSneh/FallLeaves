class Tree {
  int NUM_LEAVES = 60;
  PVector TREE_SIZE = new PVector(40, 60);
  
  PVector position;
  ArrayList<Leaf> leaves;
  Trunk trunk;
  
  Tree(float x, float y) {
    position = new PVector(x, y);
    
    trunk = new Trunk(position.x, position.y);
    
    leaves = new ArrayList<Leaf>();
    for (int i = 0; i <= NUM_LEAVES; i++) {
      float leafX = random(position.x - TREE_SIZE.x / 2, position.x + TREE_SIZE.x / 2);
      float leafY = random(position.y - TREE_SIZE.y / 2, position.y + TREE_SIZE.y / 2);
      leaves.add(new Leaf(leafX, leafY));
    }
  }
  
  color getAverageColor() {
    return 0;
  }

  void run() {
    trunk.run();
    for (Leaf leaf : leaves) {
      leaf.run();
    }
  }
}

class Forest {
  ArrayList<Tree> trees;

  Forest(int numTrees, int sizeX, int sizeY) {
    trees = new ArrayList<Tree>();
    for (int i = 0; i < numTrees; i++) {
      trees.add(new Tree(
        random(sizeX), 
        random(sizeY)
      ));
    }
  }
  
  color getAverageColor() {
    return 0;
  }

  void run() {
    for (Tree tree : trees) {
      tree.run();
    }
  }
}

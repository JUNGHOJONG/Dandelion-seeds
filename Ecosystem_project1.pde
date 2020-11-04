Hall [] halls;
Dandelion_full [] dandelions;
Firefly [] fireflys;
Background backgrounds;
Tree [] trees;
Lawn lawns;

void setup() {

  size(500, 500);
  smooth();
  frameRate(30);
  halls= new Hall[40];
  dandelions= new Dandelion_full[40];
  fireflys= new Firefly[60];
  backgrounds= new Background();
  trees= new Tree[3];
  lawns= new Lawn();

  for (int i=0; i<trees.length; i++) {

    trees[i]= new Tree();
  }

  for (int i=0; i<fireflys.length; i++) {

    fireflys[i]= new Firefly();
  }

  for (int i=0; i<halls.length; i++) {

    halls[i]= new Hall();
  }

  for (int i=0; i<dandelions.length; i++) {

    dandelions[i]= new Dandelion_full();
  }
}

void draw() {

  //background(3, 37, 54);

  backgrounds.timer();
  backgrounds.display();
  // backgrounds.update();

  for (int i=0; i<trees.length; i++) {
    pushMatrix();
    trees[i].translates(i);
    if (i==0) {
      trees[i].branch(140);
    } else if (i==1) {
      trees[i].branch(70);
    } else {
      trees[i].branch(80);
    }
    popMatrix();
  }

  for (int i=0; i<fireflys.length; i++) {

    fireflys[i].display();
    fireflys[i].update();
  }

  for (int i=0; i<halls.length; i++) {

    halls[i].display();
    halls[i].update();
  }

  for (int i=0; i<dandelions.length; i++) {

    dandelions[i].display();
    dandelions[i].update();
  }

  lawns.display();
  lawns.update();

  //saveFrame("my image_####.png");
}

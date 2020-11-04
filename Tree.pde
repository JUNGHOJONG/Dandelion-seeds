class Tree {

  float angle;
  float x1;
  float x2;


  Tree() {

    angle=PI/6;
    x1= random(width/4, width/2);
    x2= random(width/2, (width/4)*3);
  }
  void translates(int i) {

    if (i==0) {
      translate(width/2, height);
    } else if (i==1) {
      translate(x1, height);
    } else if (i==2) {
      translate(x2, height);
    }
  }

  void branch(float len) {

    strokeWeight(len/30);
    line(0, 0, 0, -len);
    translate(0, -len);


    if (len>10) {

      pushMatrix();
      rotate(angle);
      branch(len*0.67);
      popMatrix();
      pushMatrix();
      rotate(-angle);
      branch(len*0.67);
      popMatrix();
    }
  }
}

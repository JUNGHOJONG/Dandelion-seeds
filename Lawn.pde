class Lawn {

  float theta;
  float thetaSpeed;
  color c;

  Lawn() {

    theta=0;
    thetaSpeed=0.05;
    c= color(200);
  }

  void display() {

    float x= theta;////////////lawn

    for (float i=0; i<width; i=i+0.1) {

      float y=-noise(x)*15+height;

      //noStroke();
      strokeWeight(0.3);
      //fill(c);
      point(i, y);
      for (float j=y+1; j<height; j=j+0.1) {

        point(i, j);
      }
      x+=0.5;
    }
  }

  void update() {

    theta+=thetaSpeed;
  }
}

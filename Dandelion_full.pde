class Dandelion_full {

  float xtime;
  float ytime;
  float xRandom;// random init x
  float theta;// rotation of Dandelion
  float spectrum;// hall range
  float speed;// speed of theta
  float increment;// xtime, ytime increase
  color c;
  float rootx;// x of stem root
  float rooty;// y of stem root

  Dandelion_full() {

    xtime= random(width);
    ytime= random(height);
    xRandom= random(width);
    increment= random(0.01, 0.05);// moving fast
    theta=0;
    spectrum= random(PI+HALF_PI, TWO_PI);
    speed= random(-0.003, 0.003);
    c= color(200, 255);
    rootx= (sin(xtime)*10)+xRandom;/////x bottom of stem
    rooty= height;/////y bottom of stem
  }

  void display() {

    float len= noise(xtime)*(width/13);///////////length of hall(width/10)

    float x= (sin(xtime)*10)+xRandom;//////////// x of center
    float y= (sin(ytime)*10)+height-height/7;//////////// y of center(height/5)

    noFill();
    strokeWeight(1.5);

    beginShape();////////////////// stem
    curveVertex(rootx, rooty-1);
    curveVertex(rootx, rooty);
    curveVertex((sin(xtime-0.05)*10)+xRandom, (sin(ytime-0.05)*10)+height-height/9);
    curveVertex(x, y);
    curveVertex(x, y+1);
    endShape();
    /*
    beginShape();
    curveVertex(rootx, rooty-1);
    curveVertex(rootx, rooty);
    curveVertex(rootx, rooty-1);
    curveVertex(rootx, rooty);
    endShape();
*/
    pushMatrix();
    translate(x, y);

    for (float i=0; i<spectrum; i+=0.1) {

      pushMatrix();
      rotate(theta+i);

      noStroke();

      for (int i2=2; i2>=0; i2--) {/////////// shape of center

        fill(255-80*i2, 100);
        ellipse(0, 0, len/4*(i2+1)/3, len/8*(i2+1)/3);
      }

      stroke(c);
      strokeWeight(0.3);
      line(0, 0, len, 0);
      translate(len, 0);

      for (float j=0; j<TWO_PI; j+=0.5) {

        pushMatrix();

        rotate(-theta-j);
        line(0, 0, len/4, 0);
        popMatrix();
      }

      popMatrix();
    }
    popMatrix();
  }

  void update() {

    xtime+=increment;
    ytime+=increment;
    theta+=speed;
  }
}

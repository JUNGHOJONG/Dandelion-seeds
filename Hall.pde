class Hall {

  float xtime;
  float ytime;
  float increment;// xtime, ytime increase
  float theta;// rotation of Dandelion
  float spectrum;// hall range
  float speed;// speed of theta
  color c;

  Hall() {

    xtime= random(width);
    ytime= random(height);
    increment= random(0.005, 0.01);// moving fast
    theta=0;
    spectrum= random(PI/16, PI/4);
    speed= random(-0.03, 0.03);
    c= color(200, 255);
  }

  void display() {

    float len= noise(xtime)*(width/13);

    float x= noise(xtime)*width;
    float y= noise(ytime)*height;
    /*
    x= constrain(x, (width/4)*1, (width/4)*3);
     y= constrain(y, (height/4)*1, (height/4)*3);
     */
    pushMatrix();
    translate(x, y);

    noStroke();
    for (int i=2; i>=0; i--) {/////////// shape of center

      fill(255-80*i, 100);
      ellipse(0, 0, len/4*(i+1)/3, len/4*(i+1)/3);
    }

    for (float i=0; i<spectrum; i+=0.1) {

      pushMatrix();
      rotate(theta+i);
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

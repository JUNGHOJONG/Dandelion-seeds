class Firefly {

  float xtime;
  float ytime;
  float speed;
  color c;

  Firefly() {

    xtime=random(width);
    ytime=random(height);
    speed= random(0.006, 0.008);
    c= color(247, 255, 41);
  }

  void display() {

    float x= noise(xtime)*width;
    float y= noise(ytime)*height;
    float len= noise(xtime)*(width/10);

    fill(c);
    noStroke();

    ellipse(x, y, len/8, len/8);
  }

  void update() {

    xtime+=speed;
    ytime+=speed;
  }
}

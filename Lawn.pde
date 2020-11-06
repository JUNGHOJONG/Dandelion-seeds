class Lawn {

  private static final float CHANGE_SPEED = 0.05;
  private final color COLOR = color(225);
  private final float STROKE_WEIGHT = 1.2;

  private float heightChange = 0;
  private boolean check = true;

  void display() {
    float change = heightChange;
    for (float j=0; j<width; j+=1) {
      float y = -noise(change) * 15 + height;
      stroke(COLOR);
      strokeWeight(STROKE_WEIGHT);
      point(j, y);
      for (float i=y+1; i<height; i+=1) {
        point(j, i);
      }
      change += 0.5;
    }
  }

  void updateHeightChange() {
    if (heightChange < 1 && check) {
      heightChange += CHANGE_SPEED;
      return;
    }
    check = false;
    if (heightChange > 0 && !check) {
      heightChange -= CHANGE_SPEED;
      return;
    }
    check = true;
  }
}

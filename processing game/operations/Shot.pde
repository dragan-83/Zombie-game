float shotSize=4;
class bullet {
  float x, y;
  float xDiff, yDiff;
  float xSpeed;
  float ySpeed;
  boolean alive=true;
  void shoot() {
    if (alive==true) {
      if (x>width||x<0||y>height||y<0) {
      } else {
        stroke(255, 215, 0);
        fill(255, 215, 0);
        circle(x, y, shotSize);
        x+=xSpeed;
        y+=ySpeed;
      }
    }
  }
}

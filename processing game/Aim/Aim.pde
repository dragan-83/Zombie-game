
void aimLine(){
  float angle = atan2(mouseY - posY, mouseX - posX);
  float x1 = posX + 10000 * cos(angle);
  float y1 = posY + 10000 * sin(angle);
  stroke(255, 0, 0, 180);
  strokeWeight(3);
  line(posX, posY, x1, y1);
}

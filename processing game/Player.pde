float velocity, currentVelocity;
float posX=600, posY=600;
void player(){
  circle(posX,posY,30);
}

void controls(){
  velocity=3;
  boolean multipleKeysPressed = false;    
    if (keys[0] && keys[1] || keys[1] && keys[2] || keys[2] && keys[3] || keys[3] && keys[0])
      multipleKeysPressed = true;   

    if (multipleKeysPressed)
      currentVelocity = velocity/2+velocity/3;
    else
      currentVelocity = velocity;

    if (keys[0] == true) 
      posY -= currentVelocity;
    if (keys[1] == true) 
      posX += currentVelocity;
    if (keys[2] == true) 
      posY += currentVelocity;
    if (keys[3] == true) 
      posX -= currentVelocity;
    if (keys[4] == true)
      shoot();
    if (keys[5] == true)
      aimLine();
}

void shoot(){
  Projectile proj;
  proj = new Projectile();
  proj.draws();
}

float getPosX() {
    return posX;
  }

float getPosY() {
    return posY;
  }

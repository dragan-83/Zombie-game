float velocity=4, currentVelocity;
float posX=600, posY=600;
float diameter=25;
float bulletSpeed=14;
float fireRate=10;
int r=0;
int g=109;
int b=109;

void player() {
  strokeWeight(3);
  stroke(0, 0, 0);
  fill(r, g, b);
  circle(posX, posY, diameter);
  r=0;
  g=109;
  b=109;
  for (int i=0; i<zombies.length; i+=1) {
    if (zombies[i].alive==true) {
      if (posX+diameter>zombies[i].zX && posX-diameter<zombies[i].zX && posY+diameter>zombies[i].zY && posY-diameter<zombies[i].zY) {
        playerHealth=playerHealth-damage;
        r=128;
        g=0;
        b=0;
      }
    }
  }
  for (int i=0; i<zombieBullets.length; i+=1) {
    if (zombieBullets[i].alive==true) {
      if (posX+diameter>zombieBullets[i].x && posX-diameter<zombieBullets[i].x && posY+diameter>zombieBullets[i].y && posY-diameter<zombieBullets[i].y) {
        playerHealth=playerHealth-damage;
        r=128;
        g=0;
        b=0;
        zombieBullets[i].alive=false;
      }
    }
  }
}

void controls() {
  boolean multipleKeysPressed = false;    
  if (keys[0] && keys[1] || keys[1] && keys[2] || keys[2] && keys[3] || keys[3] && keys[0])
    multipleKeysPressed = true;   

  if (multipleKeysPressed)
    currentVelocity = velocity/2+velocity/3;
  else
    currentVelocity = velocity;
  if (keys[0] == true) 
    if (posY>45) {
      posY -= currentVelocity;
    }
  if (keys[1] == true) 
    if (posX<width-30) {
      posX += currentVelocity;
    }
  if (keys[2] == true) 
    if (posY<height-30) {
      posY += currentVelocity;
    }
  if (keys[3] == true) 
    if (posX>30) {
      posX -= currentVelocity;
    }
  if (keys[4] == true)
    fire();
  if (keys[5] == true)
    aimLine();
  if (keys[7] == true && numberOfHealthPots>0)
    useHealthPot();
}

void useHealthPot() {
  numberOfHealthPots=numberOfHealthPots-1;
  playerHealth=playerHealth+20;
}

void fire() {
  if (frameCount % fireRate==0) {
    if (frameCount>1 && !shoot.isPlaying()) {
      shoot.play();
    }
    bullets=(bullet[])append(bullets, new bullet());
    bullets[bullets.length-1].x=posX;
    bullets[bullets.length-1].y=posY;
    bullets[bullets.length-1].xDiff=(mouseX-posX);
    bullets[bullets.length-1].yDiff=(mouseY-posY);
    bullets[bullets.length-1].xSpeed=(mouseX-posX)/sqrt((((mouseX-posX)*(mouseX-posX))+((mouseY-posY)*(mouseY-posY))))*bulletSpeed;
    bullets[bullets.length-1].ySpeed=(mouseY-posY)/sqrt((((mouseX-posX)*(mouseX-posX))+((mouseY-posY)*(mouseY-posY))))*bulletSpeed;
    bullets[bullets.length-1].shoot();
  }
}

void bulletUpdate() {
  for (int i=0; i<bullets.length; i=i+1) { 
    bullets[i].shoot();
  }
}

float getPosX() {
  return posX;
}

float getPosY() {
  return posY;
}

int waveNumber=0;
float xPU=0, yPU=0;
boolean onField=false;
void waves() {
  if (frameCount % 800==0) {
    waveNumber+=1;
    difficulty+=10;
    playerScore+=25;
    apocalypse();
  }
}

void powerUps() {
  if (frameCount % 800==0) {
    onField=true;
    xPU=random(width);
    yPU=random(34, height);
  }
  //createPowerUp();
}

void createPowerUp() {
  if (onField==true) {
    fill(255);
    rect(xPU, yPU, 15, 15);
    if (posX+diameter>xPU && posX-diameter<xPU && posY+diameter>yPU && posY-diameter<yPU) {
      onField=false;
      //velocity=velocity+1;
      playerHealth=playerHealth+20;
    }
  }
}

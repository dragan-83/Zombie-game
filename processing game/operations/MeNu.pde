float x=width/2, y=height/2;
float w=1340, h=120;
float w2=1340, h2=h*2;
float x2=width/2, y2=y+h2;
float healthPotPrice=75, numberOfHealthPots=1;
float speedPrice=100;
float shotSizePrice=25;
float armourPrice=250, armourOn=0;
float bulletSpeedPrice=50;
float bX=85, bY=85;
float pistolPrice=50;
boolean pistol=false;
float akPrice=100;
boolean ak47=false;
float laserPrice=100;
boolean laser=false;
float doubleCoinPrice=200;
boolean doubleCoin=false;

void health() {
  stroke(0, 0, 0);
  fill(255, 0, 0);
  rect(0, 0, playerHealth*4, 34);
  if (playerHealth<0) {
    dead=true;
  }
}

void menu() {
  textSize(40);
  fill(255, 255, 255, 75);
  text("Coins", 30, 75); 
  text(playerScore, 130, 75);
  text("level", 1260, 75); 
  text(waveNumber, 1350, 75);
  if (level==0) {
    background(105, 105, 105);
    textSize(40);
    fill(34, 139, 34);
    stroke(0);
    rect(x, y, w, h);
    fill(255);
    text("Start", 650, h);
    if (mousePressed && x+w>mouseX && x-w<mouseX && y+h>mouseY && y-h<mouseY) {
      level=1;
    }
    fill(34, 139, 34);
    stroke(0);
    rect(x2, y2, w2, h);
    fill(255);
    text("exit", 650, h2*1.5);
    if (mousePressed && x2+w2>mouseX && x2-w2<mouseX && y2+h2>mouseY && y2<mouseY) {
      exit();
    }
  }
}

void shop() {
  fill(192, 192, 192, 80);
  stroke(0);
  rect(15, 15, width-30, height-30);
  fill(192, 192, 192);
  rect(bX, bY, 240, 60);
  textSize(30);
  fill(0);
  text("HealthPot $75", 95, 120);
  if (mousePressed && bX+240>mouseX && bX-240<mouseX && bY+60>mouseY && bY-60<mouseY && playerScore>=healthPotPrice) {
    playerScore=playerScore-healthPotPrice;
    numberOfHealthPots=numberOfHealthPots+1;
  }
  fill(192, 192, 192);
  rect(bX*4, bY, 240, 60);
  textSize(30);
  fill(0);
  text("Speed+ $100", (bX*4)+10, 120);
  if (mousePressed && bX*4+240>mouseX && bX*4-240<mouseX && bY+60>mouseY && bY-60<mouseY && playerScore>=speedPrice) {
    playerScore=playerScore-speedPrice;
    velocity=velocity+1;
  }
  fill(192, 192, 192);
  rect(bX*7, bY, 240, 60);
  textSize(30);
  fill(0);
  text("Bullet+ $25", (bX*7)+10, 120);
  if (mousePressed && bX*7+240>mouseX && bX*7-240<mouseX && bY+60>mouseY && bY-60<mouseY && playerScore>=shotSizePrice) {
    playerScore=playerScore-shotSizePrice;
    shotSize=shotSize+2;
  }
  fill(192, 192, 192);
  rect(bX, bY*3, 240, 60);
  textSize(30);
  fill(0);
  text("Armour $250", bX+10, (bY+35)*2.5);
  if (mousePressed && bX+240>mouseX && bX-240<mouseX && bY*3+60>mouseY && bY*3-60<mouseY && playerScore>=healthPotPrice && armourOn==0) {
    playerScore=playerScore-armourPrice;
    armourOn=armourOn+1;
    damage=damage-0.4;
  }
  fill(192, 192, 192);
  rect(bX*4, bY*3, 240, 60);
  textSize(30);
  fill(0);
  text("BulletSpd+ $50", (bX*4)+10, (bY+35)*2.5);
  if (mousePressed && bX*4+240>mouseX && bX*4-240<mouseX && bY*3+60>mouseY && bY*3-60<mouseY && playerScore>=bulletSpeedPrice) {
    playerScore=playerScore-bulletSpeedPrice;
    bulletSpeed=bulletSpeed+2;
  }
  fill(192, 192, 192);
  rect(bX*7, bY*3, 240, 60);
  textSize(30);
  fill(0);
  text("Pistol $50", (bX*7)+10, (bY+35)*2.5);
  if (mousePressed && bX*7+240>mouseX && bX*7-240<mouseX && bY*3+60>mouseY && bY*3-60<mouseY && playerScore>=pistolPrice && pistol==false) {
    playerScore=playerScore-pistolPrice;
    fireRate=8;
    pistol=true;
    ak47=false;
    laser=false;
  }
  fill(192, 192, 192);
  rect(bX*10, bY*3, 240, 60);
  textSize(30);
  fill(0);
  text("AK47 $100", (bX*10)+10, (bY+35)*2.5);
  if (mousePressed && bX*10+240>mouseX && bX*10-240<mouseX && bY*3+60>mouseY && bY*3-60<mouseY && playerScore>=akPrice && ak47==false) {
    playerScore=playerScore-akPrice;
    fireRate=5;
    ak47=true;
    pistol=false;
    laser=false;
  }
  fill(192, 192, 192);
  rect(bX*10, bY*5, 240, 60);
  textSize(30);
  fill(0);
  text("laser $200", (bX*10)+10, (bY+35)*3.9);
  if (mousePressed && bX*10+240>mouseX && bX*10-240<mouseX && bY*5+60>mouseY && bY*5-60<mouseY && playerScore>=laserPrice && laser==false) {
    playerScore=playerScore-laserPrice;
    fireRate=1;
    laser=true;
    ak47=false;
    pistol=false;
  }
  fill(192, 192, 192);
  rect(bX*10, bY, 240, 60);
  textSize(30);
  fill(0);
  text("CoinDropx2 $200", (bX*10)+10, (bY+35));
  if (mousePressed && bX*10+240>mouseX && bX*10-240<mouseX && bY+60>mouseY && bY-60<mouseY && playerScore>=doubleCoinPrice && doubleCoin==false) {
    playerScore=playerScore-doubleCoinPrice;
    coinDrops+=1;
    doubleCoin=true;
  }
}

void gameOver() {
  textSize(60);
  text("GAMEOVER", width/2.8, height/2);
  rect(width/2.8, height/1.8, 330, 75);
  text("RETRY", width/2.45, height/1.6);
  if (mousePressed && width/2.8+330>mouseX && width/2.8-330<mouseX && height/1.8+75>mouseY && height/1.8-75<mouseY) {
    level=1;
    reset();
  }
}

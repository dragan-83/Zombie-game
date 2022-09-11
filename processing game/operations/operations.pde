static boolean[] keys = new boolean[12];
int level=0;
bullet[] bullets=new bullet[0];
zombie[] zombies=new zombie[0];
bullet[] zombieBullets=new bullet[0];
import processing.sound.*;
SoundFile shoot;
float playerScore=0, playerHealth=100;
int difficulty=10;
float damage=1;
zombie z1=new zombie();
boolean dead=false;
float coinDrops=1;

void setup() {
  fullScreen();
  frameRate(60);
  shoot=new SoundFile(this, "shoot.mp3");
  apocalypse();
}

void draw() {
  background(105, 105, 105);
  menu();
  if (level==1) {
    if (dead==false) {
      controls();
      player();
      bulletUpdate();
      zombieUpdate();
      waves();
      powerUps();
      zombieBulletUpdate();
    } else {
      gameOver();
    }
    if (keys[6] == true){
      shop();
    }
    health();
  }
}

void zombieUpdate() { 
  for (int i=0; i<zombies.length; i=i+1) { 
    if (zombies[i].alive==true) {
      for (int j=0; j<bullets.length; j=j+1) { 
        if (bullets[j].x+shotSize*2>zombies[i].zX && bullets[j].x-shotSize*2<zombies[i].zX && bullets[j].y+shotSize*2>zombies[i].zY && bullets[j].y-shotSize*2<zombies[i].zY) {
          //pulse.play();
          playerScore=playerScore+coinDrops;
          //playerHealth=playerHealth+0.2;
          zombies[i].alive=false;
        }
      }
    }
    zombies[i].follow();
  }
}

void zombieBulletUpdate() {
  for (int i=0; i<zombies.length; i+=1) { 
    if (zombies[i].alive==true  && frameCount % 60==0) {
      zombieBullets=(bullet[])append(zombieBullets, new bullet());
      zombieBullets[zombieBullets.length-1].x=zombies[i].zX;
      zombieBullets[zombieBullets.length-1].y=zombies[i].zY;
      zombieBullets[zombieBullets.length-1].xDiff=(posX-zombies[i].zX);
      zombieBullets[zombieBullets.length-1].yDiff=(posX-zombies[i].zY);
      zombieBullets[zombieBullets.length-1].xSpeed=(posX-zombies[i].zX)/sqrt((((posX-zombies[i].zX)*(posX-zombies[i].zX))+((posY-zombies[i].zY)*(posY-zombies[i].zY))))*6;
      zombieBullets[zombieBullets.length-1].ySpeed=(posY-zombies[i].zY)/sqrt((((posX-zombies[i].zX)*(posX-zombies[i].zX))+((posY-zombies[i].zY)*(posY-zombies[i].zY))))*6;
    }
  }
  for (int j=0; j<zombieBullets.length; j+=1) {
    zombieBullets[j].shoot();
  }
}
void apocalypse() {
  for (int i=0; i<difficulty; i+=1) {
    zombies=(zombie[])append(zombies, new zombie());
    zombies[zombies.length-1].alive=true;
    do {
      zombies[zombies.length-1].zX=random(width);
      zombies[zombies.length-1].zY=random(height);
    } while (posX+diameter*10>zombies[zombies.length-1].zX && posX-diameter*10<zombies[zombies.length-1].zX && posY+diameter*10>zombies[zombies.length-1].zY && posY-diameter*10<zombies[zombies.length-1].zY);

    zombies[zombies.length-1].follow();
  }
}


void reset() {
  level=0;
  playerScore=0;
  playerHealth=100;
  difficulty=10;
  dead=false;
  posX=600;
  posY=600;
  diameter=25;
  r=0;
  g=109;
  b=109;
  waveNumber=0;
  xPU=0;
  yPU=0;
  onField=false;
  for (int i=0; i<zombieBullets.length; i+=1) {
    zombieBullets[i].alive=false;
  }
  for (int j=0; j<zombies.length; j+=1) {
    zombies[j].alive=false;
  }
}
void keyPressed() {
  if (key == 'w')
    keys[0] = true;
  if (key == 'd')  
    keys[1] = true;
  if (key == 's')
    keys[2] = true;
  if (key == 'a')  
    keys[3] = true;
  if (key == 'q')  
    keys[6] = true;
  if (key == 'e')  
    keys[7] = true;
}

void keyReleased() {
  if (key == 'w')
    keys[0] = false;
  if (key == 'd')  
    keys[1] = false;
  if (key == 's')
    keys[2] = false;
  if (key == 'a')  
    keys[3] = false;
  if (key == 'q')  
    keys[6] = false;
  if (key == 'e')  
    keys[7] = false;
}

void mousePressed() {    
  if (mouseButton==LEFT)
    keys[4] = true;
  if (mouseButton==RIGHT)
    if (keys[5]==false)
      keys[5] = true;
    else
      keys[5]=false;
}

void mouseReleased() {
  if (keys[4])
    keys[4] = false;
}

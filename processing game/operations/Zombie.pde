class zombie {

  float zX, zY;
  boolean alive;

  void follow() {
    if (zX>width||zX<0||zY>height||zY<0) {
    } else {
      if (alive==true) {
        stroke(0, 0, 0);
        fill(34, 139, 34);
        circle(zX, zY, 20);
      }
      if (posX>zX) {
        zX=zX+random(1, 1.5);
      } else if (posX<zX) {
        zX=zX-random(1, 1.5);
      }
      if (posY>zY) {
        zY=zY+random(1, 1.5);
      } else if (posY<zY) {
        zY=zY-random(1, 1.5);
      }
    }
  }
}

//void dead(){
//for(int i=0; i<bullets.length; i=i+1){ 
//if(bullets[i].x+5>zX && bullets[i].x<zX && bullets[i].y+5>zY && bullets[i].y<zY){
//playerScore=playerScore+1;
//zombies[3].alive=false;
//}
//}
// }

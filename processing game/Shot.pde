class Projectile{
  float x=posX, y=posY;
  boolean onScreen=false;
  float angle = atan2(mouseY - posY, mouseX - posX);
  float x1 = posX + 10000 * cos(angle);
  float y1 = posY + 10000 * sin(angle);

  void draws(){
    circle(x,y,5);
    travel();
  }
  
  void travel(){
    if (onScreen=true){
      if(x1>x){
         x=x+1;;
      }else if(x1<x){
        x=x-1;
      }
      if(y1>y){
        y=y+1;
      }else if(y1<y){
        y=y-1;
      }
      if(x>1200||x<0||y>1200||y<0){
        onScreen=false;
     }else{
       draws();
     }
    }
  }
}

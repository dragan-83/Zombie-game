class zombie{
  
  float zX, zY;
  void create(){
    circle(zX,zY,40);
    follow();
  }

  void follow(){
    circle(zX,zY,40);
    if(posX>zX){
       zX=zX+1;
    }else if(posX<zX){
      zX=zX-1;
    }
    if(posY>zY){
      zY=zY+1;
    }else if(posY<zY){
      zY=zY-1;
  }
  }
}

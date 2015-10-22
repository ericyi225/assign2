PImage fighterImg;
PImage hpImg;
PImage treasureImg;
PImage enemyImg;
PImage bg1Img;
PImage bg2Img;
PImage start1Img;
PImage start2Img;
PImage end1Img;
PImage end2Img;
int hp,Tx,Ty,Ex,Ey,E;
final int GAME_START=1, GAME_RUN=2, GAME_FINISH=3;
int gameState;
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
int Fx,Fy;

void setup () {
  size(640,480);
  
  fighterImg=loadImage("img/fighter.png");
  hpImg=loadImage("img/hp.png");
  treasureImg=loadImage("img/treasure.png");
  enemyImg=loadImage("img/enemy.png");
  bg1Img=loadImage("img/bg1.png");
  bg2Img=loadImage("img/bg2.png");
  start1Img=loadImage("img/start1.png");
  start2Img=loadImage("img/start2.png");
  end1Img=loadImage("img/end1.png");
  end2Img=loadImage("img/end2.png");
  
  hp=40;
  Tx=floor(random(20,550));
  Ty=floor(random(30,460));
  Ex=0;
  Ey=floor(random(30,440));
  E=0;
  Fx=580;
  Fy=240;
  gameState = GAME_START;
}

void draw() {
  switch(gameState){
    
  case GAME_START:
  
    image(start2Img,0,0);
  if(mouseX>202.3 && mouseX<457.1 && mouseY>373 && mouseY<415){
    if(mousePressed){
      gameState = GAME_RUN;
    }
    else{
      image(start1Img,0,0);
    }
  }
  break;
  
  case GAME_RUN:
  
  image(bg1Img,E,0);
  image(bg2Img,E-640,0);//
  image(bg1Img,E-1280,0);
  image(fighterImg,Fx,Fy);
  rect(20,10,hp,20);
  fill(255,0,0);
  image(treasureImg,Tx,Ty);
  image(enemyImg,Ex,Ey);
  image(hpImg,10,10);
  
  Ex+=5;
  Ex%=640;
  E+=1;
  E%=1280;
 
  if (upPressed) {
    Fy -= 5;
    if(Fy<0){
    Fy=0;
    }
  }
  if (downPressed) {
    Fy += 5;
    if(Fy>430){
    Fy=430;
    }
  }
  if (leftPressed) {
    Fx -= 5;
    if(Fx<0){
    Fx=0;
    }
  }
  if (rightPressed) {
    Fx += 5;
    if(Fx>590){
    Fx=590;
    }
  }
  //treasure+hp
  if(Fx<Tx+41 && Fx>=Tx-41 && Fy<=Ty+41 && Fy>=Ty-41){
   Tx=floor(random(20,550));
   Ty=floor(random(30,460));
   hp+=20;
  }
  
  //enemy-hp
  if(Fx<=Ex+50 && Fx>=Ex-60.8 && Fy<=Ey+60.8 && Fy>=Ey-60.8){
   Ex=0;
   Ey=floor(random(30,440));
   hp-=40;
  }
  if(hp>=195){
  hp=195;
  }
  if(hp<=0){
  gameState = GAME_FINISH;
  }
  break;
  
  case GAME_FINISH:
      
  image(end2Img,0,0);
  if(mouseX>202.3 && mouseX<440 && mouseY>300 && mouseY<355){
    if(mousePressed){
      hp=40;
      Tx=floor(random(20,550));
      Ty=floor(random(30,460));
      Ex=0;
      Ey=floor(random(30,440));
      E=0;
      Fx=580;
      Fy=240;
      gameState = GAME_RUN;
    }
    else{
      image(end1Img,0,0);
    }
  
  
  
  break;
  }
}
}
  void keyPressed() {
  if (key == CODED) { // detect special keys 
    switch (keyCode) {
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
    }
  }
}
  void keyReleased() {
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
    }
  }
}



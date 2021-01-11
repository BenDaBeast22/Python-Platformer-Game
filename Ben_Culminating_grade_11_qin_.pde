//PImages
PImage heart;
PImage grass;
PImage platform;
PImage strawberry;
PImage donught;
PImage rocket;
PImage menu;
PImage lava;
PImage donut2;
PImage menustrawberry;
//Calling methods
Key k;
Key k2;
Enemy e;
Enemy e2;
Enemy e3;
Enemy e4;
Enemy e5;
Enemy e6;
Enemy e7;
Enemy e8;
Enemy e9;
Enemy e10;
Enemy e11;
Enemy e12;
Enemy e13;
Enemy e14;
Enemy e15;
Portal t;
Portal t2;
Portal t3;
Platform p;
Sprite s;
Sprite s2;
Sprite s3;
//Platforms Arrays
Platform [] platforms;
Platform [] platforms2;
Platform [] platforms3;
//Global variables
float x = 250;
float y = 250;
float speed = 2.5;
boolean left;
boolean right;
boolean up;
boolean down;
int gamestate = 0;//sets the gamescreen
int lifecounter = 1;
int keycounter = 0;
boolean platfall = false;
boolean pconnected=false;
int deathcounter = 0;

void setup(){
  size(800,600);
  background(0);
  smooth();
  cursor(HAND);
  //level one enemies
  e = new Enemy(532,90,20,20,1.8);
  e2 = new Enemy(255,200,20,20,1.8);
  e3 = new Enemy(255,370,20,20,1.8);
  e11 = new Enemy(365,120,20,20,1.8);
  
  //level two enemies
  e4 = new Enemy(535,370,20,20,2);
  e5 = new Enemy(275,370,20,20,2);
  e6 = new Enemy(-100,575,950,80,2);//lava
  e7 =  new Enemy(95,50,20,20,2.4);
  e8 =  new Enemy(705,50,20,20,2.4); 
  e9 =  new Enemy(100,280,20,20,5); 
  e10 = new Enemy(350,120,20,20,5); 
  //level three enemies
  e12 = new Enemy(185,100,20,20,5); 
  e13 = new Enemy(205,100,20,20,5);
  e14 = new Enemy(550,480,20,20,5);
  e15 = new Enemy(450,480,20,20,5);
  //rocket ships
  t = new Portal(650,100,45,45,2);
  t2 = new Portal(391,20,45,45,2);
  t3 = new Portal(693,440,45,45,2);
  //level two keys
  k = new Key(26,105,15,15);
  k2 = new Key(755,105,15,15);
  
  //All level sprites
  //p = new Platform(300,500,180,20);
  s = new Sprite(350,540,21,23);
  s2 = new Sprite(400,460,21,23);
  s3 = new Sprite(55,100,21,23);
  
  //Level one platforms
  platforms = new Platform[7];
  platforms[0]=new Platform(0,560,800,10);//ground platform
  platforms[1]=new Platform(302,463,41,1);//platform 1
  platforms[2]=new Platform(185,400,41,1);
  platforms[3]=new Platform(185,293,41,1);
  platforms[4]=new Platform(302,210,41,1);
  platforms[5]=new Platform(410,140,82,1);
  platforms[6]=new Platform(585,140,170,10);
  
  //Level Two Platforms
  platforms2 = new Platform[15];
  platforms2[0]=new Platform(0,1560,800,10);//ground platform
  platforms2[1]=new Platform(390,460,41,1);
  platforms2[2]=new Platform(520,410,41,1);
  platforms2[3]=new Platform(520,330,41,1);
  platforms2[4]=new Platform(390,260,41,1);
  platforms2[5]=new Platform(260,410,41,1);
  platforms2[6]=new Platform(260,330,41,1);
  platforms2[7]=new Platform(110,170,41,1);
  platforms2[8]=new Platform(10,120,41,1);
  platforms2[9]=new Platform(740,120,41,1);
  platforms2[10]=new Platform(390,60,41,1);
  platforms2[11]=new Platform(433,60,41,1);
  platforms2[12]=new Platform(347,60,41,1);
  platforms2[13]=new Platform(620,310,41,1);
  platforms2[14]=new Platform(160,310,41,1);
  
  //Level 3 Platforms
  platforms3 = new Platform[11];
  platforms3[0]=new Platform(0,130,41,1);
  platforms3[1]=new Platform(43,130,41,1);
  platforms3[2]=new Platform(86,130,41,1);
  platforms3[3]=new Platform(586,480,41,1);
  platforms3[4]=new Platform(629,480,41,1);
  platforms3[5]=new Platform(672,480,41,1);
  platforms3[6]=new Platform(715,480,41,1);
  platforms3[7]=new Platform(758,480,41,1);
  platforms3[8]=new Platform(300,340,41,1);
  platforms3[9]=new Platform(380,500,41,1);
  platforms3[10]=new Platform(490,430,41,1);
  
  grass = loadImage("grass.png");
  heart = loadImage("heart.png");
  platform = loadImage("platform1.png");
  strawberry = loadImage("strawberry.png");
  donught = loadImage("donught.png");
  rocket = loadImage("rocket.png");
  menu = loadImage("menu.png");
  lava = loadImage("lava.png");
  donut2 = loadImage("donut2.png");
  menustrawberry = loadImage("menustrawberry.png");
  
  left = false;
  right = false;
  up = false;
  down = false;
  
}
void draw(){
  if(gamestate == 0){
    menu();
  }
    else if(gamestate == 1){
      level_one();
    }
    else if(gamestate==2){
      level_two();
    }
    else if(gamestate==3){
      gameover();
    }
    else if(gamestate==4){
      level_three();
    }
    else if(gamestate==5){
      highscores();
    }
    else if(gamestate==6){
      winscreen();
    }
    else if(gamestate == -1){
      instructions();
    }
}
void level_one(){
  background(135,206,250);
  s.update();
  if(t.fly==false){
    s.display();
  }
  e.move();
  e.display();
  e2.display();
  e2.move2();
  e3.display();
  e3.move3();
  e11.move9();
  e11.display();
  t.display();
  t.move();
  t.finish();
  s.boundary();
  //fill(0);
  //textSize(20);
  //text("Level 1/3",10,25);
  //p.display();
  //image(heart,10,5,30,30);
  //image(heart,45,5,30,30);
  //image(heart,80,5,30,30);
  //Platform Images
  image(grass,-100,548,950,80);//ground
  image(platform,407.5,137,50,50);//platform 5
  image(platform,449.5,137,50,50);//platform 5
  image(platform,583,137,50,50);//platform 6
  image(platform,583+43,137,50,50);//platform 6
  image(platform,583+43*2,137,50,50);//platform 6
  image(platform,583+43*3,137,50,50);//platform 6 
  
  platforms[1].display();
  platforms[2].display();
  platforms[3].display();
  platforms[4].display();
  
  fill(255);
  textSize(20);
  text("Deaths: "+deathcounter,20,30);
  text("level 1/3",700,30);
  
  //platforms[5].display();
  //platforms[6].display();
  //for(int i = 0; i<platforms.length; i++){
  //  platforms[i].display();
  //}
   if(collision(s,t)){
    t.fly = true;
  }
  for(int i = 0;i<platforms.length; i++){
    if(collision(s,platforms[i])){
    s.land(platforms[i].y);
    break;
  }else{
    s.connected = false;
  }
  }
  if(collision(s,e)){
    fill(255,0,0,100);
    rect(0,0,width,height);
    lifecounter=lifecounter-1;
  }
   if(collision(s,e2)){
    fill(255,0,0,100);
    rect(0,0,width,height);
    lifecounter=lifecounter-1;
  }
   if(collision(s,e3)){
    fill(255,0,0,100);
    rect(0,0,width,height);
    lifecounter=lifecounter-1;
  }
   if(collision(s,e11)){
    fill(255,0,0,100);
    rect(0,0,width,height);
    lifecounter=lifecounter-1;
  }
  if(lifecounter<=0){
    s.respawn();
  }
  if(t.rectmove==true){
    t.transition();
  }
}
void level_two(){
  stroke(0);
  background(135,206,250);
  if(t2.fly==false){
    s2.display();
  }
  t2.display2();
  image(lava,-100,548,950,80);//lava picture
  s2.update();
  s2.boundary();
  //display platforms
  for(int i = 1; i<platforms2.length; i++){
    platforms2[i].display();
  }
  platforms2[7].move();
  e4.display();
  e4.move4();
  e5.display();
  e7.display();
  e7.move7();
  e8.display();
  e8.move7();
  e9.display2();
  e9.move5();
  e10.display2();
  e10.move8();
  e5.move6();
  k.display();
  k2.display();
  s2.pmove();
  t.transition();
  t2.move2();
  t2.finish();
  //text("keycounter"+keycounter,80,80);
  fill(255);
  textSize(20);
  text("Deaths: "+deathcounter,20,30);
  text("level 2/3",700,30);
  
  //moving platform
  if(platfall==true){
    platforms2[9].move2();
  }
  
  //Collisions
  
  //Platform Collision
  for(int i = 0;i<platforms2.length; i++){
    if(collision(s2,platforms2[i])){
      s2.land(platforms2[i].y);
      break;
    }else{
      s2.connected = false;
    }
}
  if(collision(s2,t2)&&(keycounter==2)){//key collision
       t2.fly = true;
  }
  if(t2.rectmove==true){
    t2.transition_level_two();
  }
  //enemy collisions
  if(collision(s2,e4)){
    fill(255,0,0,100);
    rect(0,0,width,height);
    lifecounter=lifecounter-1;
  }
  if(collision(s2,e5)){
    fill(255,0,0,100);
    rect(0,0,width,height);
    lifecounter=lifecounter-1;
  }
  //lava collision
  if(collision(s2,e6)){
    fill(255,0,0,100);
    rect(0,0,width,height);
    lifecounter=lifecounter-1;
  }
  if(collision(s2,e7)||collision(s2,e8)||collision(s2,e9)){
    fill(255,0,0,100);
    rect(0,0,width,height);
    lifecounter=lifecounter-1;
  }
    if(collision(s2,e10)){
    fill(255,0,0,100);
    rect(0,0,width,height);
    lifecounter=lifecounter-1;
  }
  //respawn after die
   if(lifecounter<=0){
    s2.respawn2();
   }
   if(k.disappear==false){
     if(collision(s2,k)){
       k.disappear = true;
       keycounter=keycounter+1;
     }
   }
   if(k2.disappear==false){
     if(collision(s2,k2)){
       k2.disappear = true;
       keycounter=keycounter+1;
     }
   }
}
void level_three(){
  stroke(0);
  background(135,206,250);
  if(t3.fly==false){
    s3.display();
  }
  s3.update();
  s3.boundary();
  t3.display3();
  t3.move3();
  t3.finish();
  e6.display();
  e12.display();
  e12.move10();
  e13.display();
  e13.move10();
  e14.display();
  e14.move11();
  e15.display();
  e15.move11();
  platforms3[8].move3();
  
  image(lava,-100,548,950,80);//lava picture
  fill(255);
  textSize(20);
  text("Deaths: "+deathcounter,20,30);
  text("level 3/3",700,30);
  //rocket collision
  if(collision(s3,t3)){
    t3.fly = true;
  }
  //display platforms
  for(int i = 0; i<platforms3.length; i++){
    platforms3[i].display();
  }
  //Platform collisions
  for(int i = 0;i<platforms3.length; i++){
    if(collision(s3,platforms3[i])){
      s3.land(platforms3[i].y);
      break;
    }else{
      s3.connected = false;
    }
}
   //enemy collisions
   if(collision(s3,e6)){//lava collision
     fill(255,0,0,100);
     rect(0,0,width,height);
     lifecounter=lifecounter-1;
  }
  if(collision(s3,e12)){
     fill(255,0,0,100);
     rect(0,0,width,height);
     lifecounter=lifecounter-1;
  }
  if(collision(s3,e13)){
     fill(255,0,0,100);
     rect(0,0,width,height);
     lifecounter=lifecounter-1;
  }
  if(collision(s3,e14)){
     fill(255,0,0,100);
     rect(0,0,width,height);
     lifecounter=lifecounter-1;
  }
  if(collision(s3,e15)){
     fill(255,0,0,100);
     rect(0,0,width,height);
     lifecounter=lifecounter-1;
  }
  if(t3.rectmove==true){
    t3.transition_level_three();
  }
  if(lifecounter<=0){//minus one life
    s3.respawn3();
  }

}

boolean collision(Sprite c1, Enemy c2){
  //x distance apart 
  float distancex = (c1.x + c1.w/2) - (c2.x + c2.w/2);
  //y distance apart 
  float distancey = (c1.y + c1.h/2) - (c2.y + c2.h/2);
  //combined half widths
  float halfwidth = c1.w/2 +c2.w/2;
  //combined half heights
  float halfheight = c1.h/2 + c2.h/2;
  //check x collisions
  if(abs(distancex)<halfwidth){
    if(abs(distancey) < halfheight){
      return true;
    }
  }
  return false;
}
boolean collision(Sprite c1, Key c2){
  //x distance apart 
  float distancex = (c1.x + c1.w/2) - (c2.x + c2.w/2);
  //y distance apart 
  float distancey = (c1.y + c1.h/2) - (c2.y + c2.h/2);
  //combined half widths
  float halfwidth = c1.w/2 +c2.w/2;
  //combined half heights
  float halfheight = c1.h/2 + c2.h/2;
  //check x collisions
  if(abs(distancex)<halfwidth){
    if(abs(distancey) < halfheight){
      return true;
    }
  }
  return false;
}
boolean collision(Sprite c1, Platform c2){
  //x distance apart 
  float distancex = (c1.x + c1.w/2) - (c2.x + c2.w/2);
  //y distance apart 
  float distancey = (c1.y + c1.h/2) - (c2.y + c2.h/2);
  //combined half widths
  float halfwidth = c1.w/2 +c2.w/2;
  //combined half heights
  float halfheight = c1.h/2 + c2.h/2;
  //check x collisions
  if(abs(distancex)<halfwidth){
    if(abs(distancey) < halfheight){
      return true;
    }
  }
  return false;
}
boolean collision(Sprite c1, Portal c2){
  //x distance apart 
  float distancex = (c1.x + c1.w/2) - (c2.x + c2.w/2);
  //y distance apart 
  float distancey = (c1.y + c1.h/2) - (c2.y + c2.h/2);
  //combined half widths
  float halfwidth = c1.w/2 +c2.w/2;
  //combined half heights
  float halfheight = c1.h/2 + c2.h/2;
  //check x collisions
  if(abs(distancex)<halfwidth){
    if(abs(distancey) < halfheight){
      return true;
    }
  }
  return false;
}
void instructions(){
  background(102,102,255);
  textAlign(CENTER);
  stroke(0);
  fill(255);
  textSize(40);
  text("Instructions",width/2+10,height/2-200);
  textSize(20);
  text("Use the arrow keys to move left, right and jump to avoid the donuts and reach",width/2,170);
  text("the rocket ship at the end of the level. To complete the level and get to the",width/2-18,210);
  text("rocket ship, all of the yellow coins must be collected. Your score is based on",width/2-10,250);
  text("the amount of times you die. Good luck!",width/2-186,290); 
  image(rocket,width/2-60,320,140,140);
 
  fill(51,153,255);//menu button
  rect(370,475,80,40);
  fill(0);
  text("Menu",width/2+10,height/2+200);
  
  if(mousePressed&&((mouseX>= 370) && (mouseX<=450)&&(mouseY>=475)&&(mouseY<=515))){
        gamestate=0;
  }
  if((mouseX>= 370) && (mouseX<=450)&&(mouseY>=475)&&(mouseY<=515)){
     stroke(0);
     fill(102,255,178);
     rect(370,475,80,40);
     fill(0);
     text("Menu",width/2+10,height/2+200);
     textAlign(LEFT);
  }
  
}
  
void menu(){
  background(138,43,226);
  fill(255);
  textSize(55);
  text("Strawberry Jump",width/2-210,100);
  textSize(35);
  fill(255);
  text("Created by B.C Productions",width/2-220,200);
  stroke(255);
  fill(255,0,255); 
  rect(225,415,75,40);
  stroke(0);
  fill(255);
  textSize(30);
  text("Play",235,445);
    
  stroke(255);
  fill(255,0,255);
  rect(425,415,195,40);
  stroke(0);
  fill(255);
  text("High Scores",437,445);
 
  stroke(255);
  fill(255,0,255);
  rect(320,515.5,190.5,40);
  stroke(110, 180, 212);
  fill(255);
  text("Instructions",330,545);
  
  image(menu,430,235,190,150);
  image(menustrawberry,180,235,150,150);
  
  
  if(mousePressed&&((mouseX>= 225) && (mouseX<=300)&&(mouseY>=415)&&(mouseY<=455))){
        gamestate =1;
  }
  if((mouseX>= 225) && (mouseX<=300)&&(mouseY>=415)&&(mouseY<=455)){
     stroke(255);
     fill(255,0,127);
     rect(225,415,75,40);
     fill(255);
     text("Play",235,445);
  }
  if(mousePressed&&((mouseX>=425)&&(mouseX<=620)&&(mouseY>=415)&&(mouseY<=455))){
        gamestate = 5;
  }
   if((mouseX>=425)&&(mouseX<=620)&&(mouseY>=415)&&(mouseY<=455)){
     stroke(255);
     fill(255,0,127);
     rect(425,415,195,40);
     fill(255);
     text("High Scores",437,445);
  }
  if(mousePressed&&((mouseX>=320)&&(mouseX<=510.5)&&(mouseY>=515.5)&&(mouseY<=555.5))){
    gamestate = -1; 
  }
  if((mouseX>=320)&&(mouseX<=510.5)&&(mouseY>=515.5)&&(mouseY<=555.5)){
     stroke(255);
     fill(255,0,127);
     rect(320,515.5,190.5,40);
     fill(255);
     text("Instructions",330,545);
  }
}

void gameover(){
  background(0);
  textSize(65);
  fill(250,0,0,200);
  textAlign(CENTER);
  text("Game Over",width/2,height/2);
}
void highscores(){
  background(102,102,255);
  textAlign(CENTER);
  textSize(40);
  text("High Scores",width/2,height/2-230);
  textAlign(LEFT);
  String[] lines = loadStrings("highscores.txt");
  textSize(30);
  text(lines[0]+" deaths",60,150);
  text(lines[1]+" deaths",60,250);
  text(lines[2]+" deaths",60,350);
  text(lines[3]+" deaths",60,450);
  text(lines[4]+" deaths",60,550);
  fill(102,200,178);
  rect(580,515,110,40);
  fill(255);
  text("Menu",595,545);
  if(mousePressed&&((mouseX>=580)&&(mouseX<=690)&&(mouseY>=515)&&(mouseY<=555))){
        gamestate = 0;
  }
  if((mouseX>=580)&&(mouseX<=690)&&(mouseY>=515)&&(mouseY<=555)){
     stroke(255);
     fill(102,0,204);
     rect(580,515,110,40);
     fill(255);
     text("Menu",595,545);
  }
}
void winscreen(){
  background(102,102,255);
  textAlign(CENTER);
  textSize(80);
  fill(255);
  text("You Win!",width/2,height/2-50);
  textAlign(LEFT);
  textSize(20);
  fill(51,153,255);//menu button
  rect(370,475,80,40);
  fill(0);
  text("Menu",width/2-15,height/2+200);
  if(mousePressed&&((mouseX>= 370) && (mouseX<=450)&&(mouseY>=475)&&(mouseY<=515))){
        gamestate=0;
  }
  if((mouseX>= 370) && (mouseX<=450)&&(mouseY>=475)&&(mouseY<=515)){
     stroke(0);
     fill(102,0,204);
     rect(370,475,80,40);
     fill(255);
     text("Menu",width/2-15,height/2+200);
     textAlign(LEFT);
  }
}
  
void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      left = false;
    }
    if (keyCode == RIGHT)
    {
      right = false;
    }
    if (keyCode == UP)
    {
      up = false;
    }
    if (keyCode == DOWN)
    {
      down = false;
    }
 }
}
void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      left = true;
    }
    if (keyCode == RIGHT)
    {
      right = true;
    }
    if(keyCode == UP){
      up = true;
    }
    //if(keyCode == DOWN){
      //down = 0;
    //}
  }
}
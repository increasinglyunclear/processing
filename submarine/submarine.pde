// Simple sub simulation
// created for installation
// Kevin Walker 15 Mar 2012


float x, y, r, ballastr;
int ballast = 1;
int direction = 0;
PImage bg;
PImage sub;
PImage depthgauge;
PImage depthdial;
PImage planedial;
PImage ballastdial;

void setup() 
{
  size(1280, 800);
  //frameRate(30);
  bg = loadImage("panel.png");
  sub = loadImage("sub.png");
  depthgauge = loadImage("depthgauge.png");
  depthdial = loadImage("depthdial.png");
  planedial = loadImage("plane-dial.png");
  ballastdial = loadImage("ballastdial.png");
  x=120;
  r=0.0;
  ballastr=0.0;
}

void draw() 
{
  background(102);
  image(bg, 0, 0);

  //SUB
  if (direction == 1) {
    if (x < 775) { 
      x = x + 0.8;
    }
  } 
  else {
    if (x > 120) {
      x = x - 0.8;
    }
  }
  pushMatrix();
  translate(x, 545);
  translate(19, 70);
  rotate(radians(r));
  translate(-19, -70);
  image(sub, 0, 0);
  popMatrix();

  //DEPTH GAUGE
  pushMatrix();
  translate(185, 262);
  translate(150, 11);
  float dialr = map(x, 120, 775, 45, 360);
  rotate(radians(dialr));
  translate(-150, -11);
  image(depthdial, 0, 0);
  popMatrix();

  //AFT PLANE
  pushMatrix();
  translate(642, 123);
  translate(13, 50);
  //float dialr = map(x, 100, 600, -45, 45);
  rotate(radians(r));
  translate(-13, -50);
  image(planedial, 0, 0);
  popMatrix();

  //FWD PLANE
  pushMatrix();
  translate(642, 315);
  //translate(21, 278);
  //float dialr = map(y, 100, 600, 45, 360);
  //rotate(radians(dialr));
  //translate(-21, -278);
  image(planedial, 0, 0);
  popMatrix();

  //BALLAST
  pushMatrix();
  translate(845, 263);
  translate(80, 6);
  if (direction == 0) {
    if (ballastr < 45) {
      rotate(radians(ballastr));
      ballastr = ballastr+1;
    } 
    else {
      rotate(radians(45));
    }
  }
  else {
    if (ballastr > -45) {
      rotate(radians(ballastr));
      ballastr = ballastr-1;
    } 
    else {
      rotate(radians(-45));
    }
  }
  translate(-80, -6);
  image(ballastdial, 0, 0);
  popMatrix();
}


void keyPressed() {
  if (key == 'd') {
    direction = 1;
  } 
  if (key == 'u') {
    direction = 0;
  }
  if (key == 'r') {
    r=r+1;
  }
  if (key == 'l') {
    r=r-1;
  }
}

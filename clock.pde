// A big clock, made for projecting at an event at the V&A Museum 
// Kevin Walker 25 Aug 2017

PFont myFont;
PImage photo;

void setup() {
  size(1440, 900);
  myFont = createFont("Helvetica", 200); // substitute your font here
  textFont(myFont);
  photo = loadImage("sky.png");
}

void draw() {
  strokeWeight(1);
  background(0);
  //image(photo, 0, 0);

  float h, m, s;
  h = hour();
  m = minute();
  s = second();
  textSize(200);
  fill(255);

  String sec;
  if ((int)s < 10) {
    sec = ("0" + (int)s);
  } else {
    sec = str((int)s);
  }

  String min;
  if ((int)m < 10) {
    min = ("0" + (int)m);
  } else {
    min = str((int)m);
  }


  text((int)h + ":" + min + ":" + sec, 300, 500);
}

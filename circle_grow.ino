// a circle grows.
// created for Parts of Speech https://youtu.be/Ib9mLd6Pi2E
// Kevin Walker 05 May 2021

int cw=0;

void setup() {
  size(1280, 720);
  background(0);
}

void draw() {
  translate(width/2, height/2);
  fill(255);
  ellipse(0, 0, cw, cw);
  cw=cw+3;
}

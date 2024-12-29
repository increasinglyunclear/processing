/**
 * random abstract 
 * This version optimized for projection
 * Kevin Walker 14 Dec 09
 */

  int width=1024;
  int height=768;

void setup()
{
  size(width, height);
  smooth(); 
  background(0);
  noStroke();
}


void draw(){

    background(0);

  int i=0;
  while (i < 8) {
    fill(random(255),random(255));  	  
    float x = random(600);
    float y = random(600);
    float w = (random(600-x));
    float h = (random(600-y));
    rect(x, y, w, h);
    i = i + 1;
  }
  save("random.jpg");
  
  //delay(5000);
}

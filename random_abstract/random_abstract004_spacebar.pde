/**
 * random abstract 
 * Spacebar to redraw in this version
 * Kevin Walker 07 Apr 10
 */

void setup()
{
  size(1024, 768);
  smooth(); 
  background(255);
  noStroke();
}


void draw(){

  if (keyPressed == true) {
    if (key == 'b' || key == ' ') {

      background(255);

      int i=0;
      while (i < 8) {
        fill(random(255),random(255),random(255),random(255));  	  
        float x = random(width);
        float y = random(height);
        float w = (random(width-x));
        float h = (random(height-y));
        rect(x, y, w, h);
        i = i + 1;
      }
      save("random.jpg");

    }
  }






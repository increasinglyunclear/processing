/**
 * random abstract
 * This version pulls in a random academic abstract from a location you provide
 * Kevin Walker 08 Sept 2010
 */

void setup()
{
  size(1024, 768);
  smooth();
  background(255);
  noStroke();
}


void draw() {

  if (keyPressed == true) {
    if (key == ' ') {

      background(255);

      int i=0;
      while (i < 2) {
        fill(random(255));  	
        float x = random(width-200);
        float y = random(height-200);
        float w = (random(width-x)+100);
        float h = (random(height-y)+100);
        rect(x, y, w, h);
        i = i + 1;
      }

      //      String[] words = {
      //        "apple", "bear", "cat", "dog"
      //      };
      //      int n = int(random(words.length));
      //      //char c1 = str.charAt(n);
      //      String sr = (words[n]);

      //HTML PARSING
      String lines[] = loadStrings("your_location_ or_ URL");
      int n = int(random(lines.length));
      String shorty = trim(lines[n]);


      fill(255);  	
      PFont font;
      font = loadFont("Helvetica-Bold-200.vlw");
      textFont(font);
      text(shorty, random(height), random(width));

      save("random.jpg");
    }
}

/**
 * First rewrite of my NYU ITP thesis project Random Abstract 
 * Kevin Walker 10 Dec 09
 */
 
 size(200, 200);
smooth(); 
background(255);
noStroke();


int i=0;
while (i < 8) {
  fill(random(255),random(255));  	  
float x = random(200);
float y = random(200);
float w = (random(200-x));
float h = (random(200-y));
rect(x, y, w, h);
i = i + 1;
    }
 save("random.jpg");

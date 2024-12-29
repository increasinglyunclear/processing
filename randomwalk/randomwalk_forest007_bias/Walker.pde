// ADAPTED FROM
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// A random walker object!

class Walker {
  int x, y;
  int log;

  Walker() {
    x = width/2;
    y = height/2;
  }

  void render() {
    stroke(255, 50, 50);
    if (random(1)>0.5) { // MORE NATURALISTIC/DISCONTINUOUS IMAGE
      point(x, y);
      //log=log+1;
      //println(log);
    }
  }

  void step() {
    int stepx = int(random(3))-1; // KEY RANDOM MOVEMENT ALGORITHM
    int stepy = int(random(3))-1;
    x += stepx;
    y += stepy;

    float d = dist(x, y, width/2, height/2);
    if (d > height/2-50) { // the point is outside the circle
      x += -(stepx);
      y += -(stepy);
    }
  }
}

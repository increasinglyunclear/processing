// ADAPTED FROM
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// A random walker object!

class Walker {
  int x, y;

  Walker() {
    x = width/2;
    y = height/2;
  }

  void render() {
    stroke(0);
    if (random(1)>0.5) { // MORE NATURALISTIC/DISCONTINUOUS IMAGE
      point(x, y);
    }
  }

  // Randomly move up, down, left, right, or stay in one place
  void step() {
    int stepx = int(random(3))-1; // KEY RANDOM MOVEMENT ALGORITHM
    int stepy = int(random(3))-1;
    x += stepx;
    y += stepy;
    if (dist(x, y, width/2, height/2) > height/2-100) { // the point is outside the circle
      x += -(stepx);
      y += -(stepy);
    }
  }
}
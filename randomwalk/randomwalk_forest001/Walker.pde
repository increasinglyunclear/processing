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
    if (dist(x, y, width/2, height/2) < 350) { //The point is inside the circle
      point(x, y);
    }
  }

  // Randomly move up, down, left, right, or stay in one place
  void step() {
    int stepx = int(random(3))-1;
    int stepy = int(random(3))-1;
    x += stepx;
    y += stepy;
  }
}

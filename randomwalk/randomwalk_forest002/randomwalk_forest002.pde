// adapted from Dan Shiffman's random walker
// Kevin Walker 20 Mar 2021
// requires Walker.pde

Walker w;

void setup() {
  size(640,360);
  // Create a walker object
  w = new Walker();
  background(255);
}

void draw() {
  // Run the walker object
  w.step();
  w.render();
}

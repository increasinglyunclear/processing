// See changes in Walker.pde which is required
// This version with multiple walkers
// Kevin Walker 03 Apr 2021

Walker w;

void setup() {
  size(800, 800);
  // Create a walker object
  w = new Walker();
  background(255);
}

void draw() {
  // Run the walker object
  w.step();
  w.render();
}

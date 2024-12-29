// see changes in Walker.pde
// Kevin Walker 01 Apr 2021

Walker w;

void setup() {
  size(800,800);
  // Create a walker object
  w = new Walker();
  background(255);
}

void draw() {
  // Run the walker object
  w.step();
  w.render();
}

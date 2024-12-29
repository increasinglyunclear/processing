// see changes in Walker.pde which is required
// Kevin Walker 27 Mar 2021

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

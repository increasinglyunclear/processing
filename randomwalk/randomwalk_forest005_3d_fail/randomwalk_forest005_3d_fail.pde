// Failed experiment but interesting output
// Kevin Walker 31 Mar 2021
// requires Walker.pde

Walker w;
float[] distribution = new float[360];

void setup() {
  size(640, 640, P3D);
  // Create a walker object
  w = new Walker();
  background(255);
  // branches increment
  for (int i = 0; i < distribution.length; i++) {
    distribution[i] = int(randomGaussian() * 120);
  }
}

void draw() {
  // Run the walker object
  w.step();
  w.render();

translate(width/2, width/2);

  for (int i = 0; i < distribution.length; i++) {
    rotate(TWO_PI/distribution.length);
    stroke(0);
    float dist = abs(distribution[i]);
    smooth();
    line(0, 0, dist, 0);
  }
  
  //if (dist(xloc, yloc, width/2, height/2) < height/2-100) { // the point is inside the circle
    
  //}
}

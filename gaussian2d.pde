// Creates randomised composition using gaussian noise
// Kevin Walker 27 Mar 2021
// ADAPTED FROM
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

void setup() {
  size(640, 640);
  background(255);
}

void draw() {

  // Get a gaussian random number w/ mean of 0 and standard deviation of 1.0
  float xloc = randomGaussian();
  float yloc = randomGaussian();

  float sd = 70;                // Define a standard deviation
  float mean = width/2;         // Define a mean value (middle of the screen along the x-axis)
  xloc = ( xloc * sd ) + mean;  // Scale the gaussian random number by standard deviation and mean
  yloc = ( yloc * sd ) + mean;

  fill(0, 10);
  noStroke();
  ellipse(xloc, yloc, 3, 3);   // Draw an ellipse at our "normal" random position
}

// Simplest analysis using brightness to get coordinates
// and/or image transformations
// Kevin Walker 24 Feb 21

PImage img; 

void setup() {
  size(600, 600);
  smooth();
  stroke(255);
  strokeWeight(5);
  background(0);
  img = loadImage("stars.png");
}

void draw() {
  loadPixels();
  img.loadPixels();
  float bright;
  int[] numbers = new int[0];
  for (int i = 0; i < img.pixels.length; i++) {
    bright = brightness(img.pixels[i]);
    if (bright > 100) {
      append(numbers, i); 
      pixels[i] = color(255);
    }
  }

  //int loc = numbers[int(random(numbers.length))];
  //pixels[loc] = color(255);
  updatePixels();
}

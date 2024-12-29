// 'Success' is relative here - an interesting outcome
// Kevin Walker 10 Apr 2021
// requires Walker.pde

float[] distribution = new float[20];

void setup() {
  size(640, 640);
  background(255);

  for (int i = 0; i < distribution.length; i++) {
    distribution[i] = int(randomGaussian() * 120);
  }
}

void draw() {

  translate(width/2, width/2);
  for (int i = 0; i < distribution.length; i++) {
    rotate(TWO_PI/distribution.length);
    stroke(0, 1);
    float dist = abs(distribution[i]);
    smooth();
    //line(0, 0, dist, 0);

    float sd = 20;
    for (int j = 0; j <= 100; j++) {
      float x = lerp(0, dist, j/100.0);
      float y = lerp(0, 0, j/100.0);
      x = (x * sd) + x;
      y = (y * sd) + y;
      point(x, y);
    }
  }
}

size(640, 360);
background(0);
stroke(255);
float[] exes = new float[14];
float[] whys = new float[14];

for (int i = 0; i < 14; i++) {
  float h = random(width);
  float v = random(height);
  point(h, v);
  exes[i] = h;
  whys[i] = v;
}

for (int j = 0; j < 14; j++) {
  for (int i = 0; i < 14; i++) {
    line(exes[j], whys[j], exes[i], whys[i]);
  }
}

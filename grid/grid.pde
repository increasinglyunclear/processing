// I used this to create the drawing shown here: https://www.instagram.com/p/CUK0A1kA7he/?img_index=1
// by drawing an identical grid on the paper in pencil, 
// then drawing each square in ink, using the output image as a guide.
// Kevin Walker 14 Apr 2021

PImage img;
img = loadImage("forest.png");
size(1589, 1589);
image(img, 0, 0);
blendMode(DIFFERENCE);
stroke(255);
for (int i = 0; i < 16; i++) {
  line(0, i*height/16, width, i*height/16);
  line(i*width/16, 0, i*width/16, height);
}
save("outputImage.jpg");

//PImage newImage = createImage(img.width, img.height, RGB);
//newImage = img.get();
//newImage.filter(THRESHOLD, 0.7);
//newImage.save("outputImage.jpg");

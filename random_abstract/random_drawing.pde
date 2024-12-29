// Creates randomized composition from dataset of images and text
// I then draw the output image
// This is based on my NYU ITP thesis project Random Abstract
// You need to add your own images and txt file
// This version optimised for large display and A3 paper
// Kevin Walker 22 Feb 2024

// IMAGE RULES FOR MYSELF:
// crop tightly - composition is done here
// no more than 1000px on longest side
// b/w if possible, else lowest number of colours whilst still retaining interest
// under 50k if possible

String[] filenames;

void setup() {
  //size(1280, 720);
  size(2560, 1440);
  background(255);
  filenames = listFileNames(sketchPath("data")); // list files in directory
  processFiles();
}

void draw() {
}

void processFiles() {

  // MAKE IMAGELIST
  StringList imagelist;
  imagelist = new StringList();
  int i = 0;

  // MAKE LIST FOR FILES USED
  StringList story;
  story = new StringList();

  for (i = 0; i < filenames.length; i++) {
    if (filenames[i].endsWith("gif")) {
      imagelist.append(filenames[i]);
    }
    if (filenames[i].endsWith("jpg")) {
      imagelist.append(filenames[i]);
    }
    if (filenames[i].endsWith("JPG")) {
      imagelist.append(filenames[i]);
    }
    if (filenames[i].endsWith("png")) {
      imagelist.append(filenames[i]);
    }
    if (filenames[i].endsWith("jpeg")) {
      imagelist.append(filenames[i]);
    }
  }

  PImage img;
  PImage imgPortion;

  for (int j = 0; j < 8; j++) {

    // SELECT AN IMAGE
    i = int(random(imagelist.size()));
    img = loadImage(imagelist.get(i));
    story.append(imagelist.get(i)); // add to files used

    // SELECT RANDOM PORTION OF IMAGE
    int ix = int(random(img.width));
    int iy = int(random(img.height));
    int iw = int(img.width-ix);
    int ih = int(img.height-iy);
    imgPortion = img.get(ix, iy, iw, ih);

    // SET RANDOM LOCATION
    float rx = random(width);
    float ry = random(height);
    image(imgPortion, rx, ry);

    // BLACK STROKE AROUND IMAGE
    noFill();
    stroke(0);
    rect(rx, ry, imgPortion.width, imgPortion.height);

    // WHITE SPACE AROUND IMAGE
    fill(255);
    noStroke();
    rect(rx-30, ry-30, 30, imgPortion.height+60); // l
    rect(rx+imgPortion.width, ry-30, 30, imgPortion.height+60); // r
    rect(rx-30, ry+imgPortion.height, imgPortion.width+60, 30); // b
    rect(rx-30, ry-30, imgPortion.width+60, 30); // t
  }

  println(story); // list files used

  //WHITE SPACE AROUND SCREEN
  fill(255);
  noStroke();
  rect(0, 0, width, 100);
  rect(0, height-100, width, 100);
  rect(0, 0, 100, height);
  rect(width-100, 0, 100, height);
}

String[] listFileNames(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    String names[] = file.list();
    return names;
  } else {
    // If it's not a directory
    return null;
  }
}

void keyPressed() {
  if (key == ' ') {
    background(255);
    processFiles();
  }
}

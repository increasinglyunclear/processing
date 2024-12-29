// Simple visualisation of time-series data
// from text file hosted online
// For VeSeL project https://increasinglyunclear.github.io/vesel/
// Kevin Walker 27 Jun 2008

int increment = 48;
String lines[] = loadStrings("http://www.lkl.ac.uk/projects/vesel/files/photocell.txt"); // read existing text file 
String last[] = split(lines[lines.length-1], " ");
String first[] = split(lines[lines.length-increment], " ");

void setup() {
  size(470, 150); // set window size
  background(102); // set bg colour
  noLoop();

  PFont font;
  font = loadFont("helv.vlw"); 
  textFont(font, 18); 
  text("light sensor: last " + increment/6 + " hours                                                        " + last[0], 10, 30);

  String firstTime[] = split(first[1], ":");
  String firstMin[] = split(firstTime[1], ":");
  int firstMins = int(firstMin[0]);
  if (firstMins < 10) {
    text(firstTime[0] + ":" + "0" + firstMins, 10,140);
  } 
  else {
    text(firstTime[0] + ":" + firstMins, 10,140);
  }

  String lastTime[] = split(last[1], ":");
  String lastMin[] = split(lastTime[1], ":");
  int lastMins = int(lastMin[0]);
  if (lastMins < 10) {
    text(lastTime[0] + ":" + "0" + lastMins, 400,140);
  } 
  else {
    text(lastTime[0] + ":" + lastMins, 400,140);
  }

}

void draw() {

  // DRAW BOXES
  stroke(255);  // white border
  for (int i=lines.length-increment; i < lines.length; i++) { // for ea. datapt
    String list[] = split(lines[i], " "); // get data
    int g = int(list[2]);
    fill(g/4); // fill box accordingly
    int boxOffset = (i - lines.length + increment); // calculate box offset
    rect(10 + boxOffset * 9, 50, 9, 60); // draw box
  }

  saveFrame("photocell.jpg"); // export jpeg

}

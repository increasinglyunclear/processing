// FOR TAKING IN DATA FROM ARDUINO TO PROCESSING, 
// READ/WRITE FROM LOCAL TEXT FILE
// VISUALISE WITH SIMPLE GREYSCALE DISPLAY ON-SCREEN
// Created for VeSeL project https://increasinglyunclear.github.io/vesel/
// Kevin Walker 2008, updated 27 Feb 2023

import processing.serial.*;
import cc.arduino.*;

Arduino arduino; // Firmata arduino init
PrintWriter output; // for writing to external text file
int timer = millis(); // create timer

int increment = 48; // number of readings to show

void setup() {

  size(470, 150); // set window size
  background(102); // set bg colour
  arduino = new Arduino(this, Arduino.list()[2], 57600); // [2] is port number
  arduino.pinMode(0, Arduino.INPUT); // look for input on pin 0
  PFont font;
  font = loadFont("helv.vlw"); 
  textFont(font, 18); 

  // EXTERNAL READ/WRITE
  String lines[] = loadStrings("photocell.txt"); // read existing text file 
  output = createWriter("photocell.txt");  // create new text file
  for (int i=0; i < lines.length; i++) { // go through each saved line and
    output.println(lines[i]); // write that into the new file
    println(lines[i]);
  }

  timer = millis(); // start timer

}

void draw() {

  if (millis() > timer + 600000) { //data logging frequency 

    // LOGGING
    String time = year() +"/" + month() + "/" + day() + " " + hour() + ":" + minute();
    output.println(time + " " + arduino.analogRead(0)); // print data w/ timestamp
    output.flush(); // Writes the remaining data to the file
    output.close(); // Finishes the file

      // DRAWING
    String lines[] = loadStrings("photocell.txt"); // read existing text file
    String first[] = split(lines[lines.length-increment], " "); // get 1st line
    String last[] = split(lines[lines.length-1], " "); // get last line
    String firstTime[] = split(first[1], ":"); // get 1st time
    String firstMin[] = split(firstTime[1], ":"); // add 0 to minutes if needed
    int firstMins = int(firstMin[0]);
    if (firstMins < 10) {
      text(firstTime[0] + ":" + "0" + firstMins, 10,140);
    } 
    else {
      text(firstTime[0] + ":" + firstMins, 10,140);
    }

    String lastTime[] = split(last[1], ":"); // add 0 to minutes if needed
    String lastMin[] = split(lastTime[1], ":");
    int lastMins = int(lastMin[0]);
    if (lastMins < 10) {
      text(lastTime[0] + ":" + "0" + lastMins, 400,140);
    } 
    else {
      text(lastTime[0] + ":" + lastMins, 400,140);
    }
    text("light sensor: last " + increment/6 + " hours                                                        " + last[0], 10, 30);

    // DRAW BOXES 
    stroke(255);
    for (int i=lines.length-increment; i < lines.length; i++) { // for ea. datapt
      String list[] = split(lines[i], " "); // get data
      int g = int(list[2]);
      fill(g/4); // fill box accordingly
      int boxOffset = (i - lines.length + increment); // calculate box offset
      rect(10 + boxOffset * 9, 50, 9, 60); // draw box
    }

    saveFrame("photocell.jpg"); // export jpeg

    // CREATE NEW TEXT FILE AND START AGAIN
    output = createWriter("photocell.txt");  // create new text file
    for (int i=0; i < lines.length; i++) { // go through each saved line and
      output.println(lines[i]); // write that into the new file
    }

    timer = millis(); // reset timer
    //}
  }
}

void keyPressed() {
  output.flush(); // Writes the remaining data to the file
  output.close(); // Finishes the file
  exit(); // Stops the program
}

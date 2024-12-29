// takes input from Maxbotics EZ1 ultrasonic rangefinder
// Kevin Walker 08 Jun 2012

import processing.serial.*;
Serial myPort;
int lf = 10;  // ASCII linefeed

void setup() {
  //println(Serial.list());
  myPort = new Serial(this, Serial.list()[0], 9600); 
  myPort.bufferUntil(lf);
  size(512, 200);
}

void draw() {
  while (myPort.available () > 0) {
    String inBuffer = myPort.readString();  
    println(inBuffer);
    delay(500);
  }
}

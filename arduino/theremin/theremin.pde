// Trying to get better sound than tiny piezo speaker on the ardino
// Kevin Walker 06 Jun 2012

import processing.serial.*;
Serial myPort;

import pitaru.sonia_v2_9.*; 
Sample mySample;
String inBuffer;
float incoming;

void setup() {
  //println(Serial.list());
  myPort = new Serial(this, Serial.list()[0], 9600); 
  myPort.bufferUntil(46);
  size(512, 200);
  Sonia.start(this); 
  mySample = new Sample("sine.aiff");
}

void draw() {
  while (myPort.available () > 0) {
    inBuffer = myPort.readString();   
    if (float(inBuffer) > 1) {
      incoming = float(inBuffer);
      setRate();
      println(incoming);
      mySample.repeat();
    }
  }
}


void setRate() {
  // set the speed (sampling rate) of the sample.
  // Values:
  // 0 -> very low pitch (slow playback).
  // 88200 -> very high pitch (fast playback).
  //float rate = (height - mouseY)*88200/(height);
  float rate = map(incoming, 0, 100, 40000, 88200);
  mySample.setRate(rate);
}


public void stop() {
  mySample.stop(1);
  Sonia.stop();
  super.stop();
}

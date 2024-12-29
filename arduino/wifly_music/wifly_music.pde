// Creates music from data input via RN-XV WiFly
// Kevin Walker 17 Mar 2013
// Based on Example by Tom Igoe

import processing.net.*; 
Client myClient; 

int timer = millis(); // create timer
String lines[];

PrintWriter output; // for writing to external text file
ArrayList readings;

import pitaru.sonia_v2_9.*;
Sample mySample;

void setup() { 
  myClient = new Client(this, "192.168.1.75", 2000); 
  Sonia.start(this); // Start Sonia engine. 
  mySample = new Sample("piano_c.aif");  
  readings = new ArrayList();
  timer = millis(); // start timer
} 

void draw() { 

  frameRate(int(random(30+10)));
  if (myClient.available() > 0) { 
    String inString = myClient.readString(); 
    float rate = map(float(inString), -100, 200, 22500, 88200);
    //println(inString);
    mySample.setRate(rate);
    mySample.repeat();
    //readings.add(inString);
  }

  //  if (millis() > timer + 10000) { //data logging frequency
  //    String lines[] = loadStrings("tilty.txt"); // read existing text file 
  //    println(lines.length);
  //    output = createWriter("tilty.txt");  // create new text file
  //    for (int i=0; i < lines.length; i++) { // go through each saved line and
  //      output.println(lines[i]); // write that into the new file
  //    }
  //    for (int i=0; i < readings.size(); i++) { // go through each saved line and
  //      output.println(readings.get(i)); // write that into the new file
  //    }
  //    output.flush(); // Writes the remaining data to the file
  //    output.close(); // Finishes the file
  //    timer = millis(); // start timer
  //    readings = new ArrayList();
  //  }
}

// Takes data in from RN-XV WiFly 
// Kevin Walker 20 Feb 2015
// Based on Example by Tom Igoe

import processing.net.*; 
Client myClient; 
String inString;
//byte interesting = 10;
int a = 0;

void setup() { 
  size (300, 100);
  myClient = new Client(this, "172.20.10.7", 2000);
  //myClient.write("$$$");
  background(255); 
  stroke(0);
} 

void draw() { 

  //GET THE DATA
  if (myClient.available() > 0) { 
    inString = myClient.readString(); 
   // if (Float.isNaN(inString)) {
      //println(float(inString));
      println(inString);
   // }

    //DRAW GRAPH
    a = a + 1;
    //    if (a > width) { 
    //      a = 0; 
    //      background(0);
    //    }
    //    point(a, float(inString));
  }

  //SAVE A DRAWING - UNCOMMMENT THESE
  //saveFrame();
}

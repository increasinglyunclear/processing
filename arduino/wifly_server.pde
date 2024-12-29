// Simple web server using RN-XV WiFly
// Kevin Walker 29 Mar 2013

import processing.net.*; 
Client myClient; 
String inString;

void setup() { 
  size (300, 100);
  myClient = new Client(this, "192.168.1.87", 2000);
} 

void draw() { 

  if (keyPressed) {
    if (key == 'x') {
      myClient.write("x");
    }
    if (key == 'z') {
      myClient.write("z");
    }
  }
  
}

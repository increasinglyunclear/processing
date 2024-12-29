// Logs data from RN-XV WiFly to local txt file
// Kevin Walker 17 Mar 2013
// Based on Example by Tom Igoe

import processing.net.*; 
Client myClient; 
PrintWriter output; // for writing to external text file
int timer = millis(); // create timer
String lines[];
ArrayList readings;

void setup() { 
  myClient = new Client(this, "192.168.1.75", 2000);  
  readings = new ArrayList();
  timer = millis(); // start timer
} 

void draw() { 

  if (myClient.available() > 0) { 
    String inString = myClient.readString(); 
     //println(inString);
    readings.add(inString);
  }

  if (millis() > timer + 10000) { //data logging frequency
    String lines[] = loadStrings("tilty.txt"); // read existing text file, same directory as sketch
    println(lines.length);
    output = createWriter("tilty.txt");  // create new text file
    for (int i=0; i < lines.length; i++) { // go through each saved line and
      output.println(lines[i]); // write that into the new file
    }
    for (int i=0; i < readings.size(); i++) { // go through each saved line and
      output.println(readings.get(i)); // write that into the new file
    }
    output.flush(); // Writes the remaining data to the file
    output.close(); // Finishes the file
     timer = millis(); // start timer
 readings = new ArrayList();
  }
}

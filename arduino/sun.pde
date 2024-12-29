// Gets realtime sun position online, sends to arduino
// for my sun clock installation
// Kevin Walker 26 Jun 2010

import processing.serial.*;
Serial myPort; 

String inBuffer;
int sunrisemin=0;
int sunsetmin=0;
String sunrise;
String sunset;

void setup() {
  println(Serial.list());
  myPort = new Serial(this, Serial.list()[11], 115200);
}


void draw() {

  //HTML PARSING

  String lines[] = loadStrings("http://uk.weather.yahoo.com/england/greater-london/london-44418");

  for (int i=0; i < lines.length; i++) {
    String[] m1 = match(lines[i], "Sunrise");
    if (m1 != null) {
      String shorty = trim(lines[i]);
      String sunrise = shorty.substring(21, 25);
      sunrisemin = int(shorty.substring(21, 22))*60 + int(shorty.substring(23, 25));
    }
  }

  for (int i=0; i < lines.length; i++) {
    String[] m1 = match(lines[i], "Sunset");
    if (m1 != null) {
      String shorty = trim(lines[i]);
      sunset = shorty.substring(20, 24);
      int sunsethour = int(shorty.substring(20, 21))+12;
      sunsetmin = sunsethour*60 + int(shorty.substring(22, 24));
    }
  }

  //SET SUN POSITION
  int time = (hour()*60) + minute();
  if (time > sunrisemin) {
    if (time < sunsetmin) {
      float totalminutes =  (sunsetmin - sunrisemin);
      float relativeposition = (time - sunrisemin) / totalminutes;
      int absposition = int(180 * relativeposition);
      int reversi = abs(180 - absposition);      
      myPort.write(reversi); 
      myPort.clear();
      delay(60000);
    }
    else
    {
      myPort.write(180); 
    }
  }

  while (myPort.available() > 0) {
    String inBuffer = myPort.readString(); 
    if (inBuffer != null) {
      String myString = new String(inBuffer);
      println(myString);
    }
    else {
      println("port not available");
    }
  }
}

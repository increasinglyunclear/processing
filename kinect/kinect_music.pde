// Convert kinect input to music
// Kevin Walker 21 May 2012

import SimpleOpenNI.*;
SimpleOpenNI  context;
import pitaru.sonia_v2_9.*; // automatically created when importing sonia using the processing menu.
Sample mySample;
//Sample mySample2;

void setup()
{
  // INITIALISE KINECT
  context = new SimpleOpenNI(this);
  if (context.enableDepth() == false) // enable depthMap generation 
  {
    println("Can't open the depthMap, maybe the camera is not connected!"); 
    exit();
    return;
  }
  context.enableScene();
  background(200, 0, 0);
  size(context.sceneWidth(), context.sceneHeight());

  Sonia.start(this); // Start Sonia audio engine.
  mySample = new Sample("pianoc.aif");
  //mySample2 = new Sample("pianoc.aif");
}

void draw() {

  context.update(); // update the cam
  image(context.sceneImage(), 0, 0); // draw irImageMap

  // // gives you a label map, 0 = no person, 0+n = person n
  int[] map = context.sceneMap();
  // set foundPerson to false at beginning of each frame
  boolean foundPerson = false;
  for (int i=0; i<map.length; i++) { // go through all values in the array
    if (map[i] > 0) {  // if person has been identified
      foundPerson = true;  // change the flag to true
    }
  }

  if (foundPerson) {
    if (mySample.isPlaying()) { 
      //mySample2.setRate(30000+random(30000));
      //mySample2.play();
    }
    else {
      mySample.setRate(30000+random(30000));
      mySample.play();
    }
  }
}

void stop()
{
  Sonia.stop(); 
  super.stop();
}

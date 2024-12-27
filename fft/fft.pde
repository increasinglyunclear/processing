// Simple eq-style FFT on an audio file
// Kevin Walker Mar 2013

import ddf.minim.analysis.*;
import ddf.minim.*;
Minim       minim;
AudioPlayer jingle;
FFT         fft;

void setup()
{
  size(1366, 768);

  minim = new Minim(this);

  // Add error handling for file loading
  try {
    jingle = minim.loadFile("piano.mp3", 1024);
  } catch (Exception e) {
    println("Error loading audio file: Make sure piano.mp3 exists in the data folder");
    exit();
    return;
  }

  // Only proceed if file was loaded successfully
  if (jingle != null) {
    jingle.loop();
    fft = new FFT(jingle.bufferSize(), jingle.sampleRate());
  }
}

void draw()
{
  background(0);
  fill(128);
  stroke(128);

  // perform a forward FFT on the samples in jingle's mix buffer,
  // which contains the mix of both the left and right channels of the file
  fft.forward( jingle.mix );

  for (int i = 0; i < fft.specSize(); i++)
  {
    float x = fft.getBand(i)*8;
    //if (x > 10) {
    //if ((height-x) > 300) {
      //println(x);
      //line( i*50, height, i*50, height - x );
      rect( (i*50)-25, height - x, 50, height );
      //ellipse( i*50, height - x, 50, 50 );
    //}
    //}
  }
}

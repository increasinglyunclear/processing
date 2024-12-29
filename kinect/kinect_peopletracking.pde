/* --------------------------------------------------------------------------
 * Kinect people tracking 
 * --------------------------------------------------------------------------
 * Based on SimpleOpenNI SceneDepth Test
 * --------------------------------------------------------------------------
 * Created by Kevin Walker / Happenstance project / Spike Island
 * 16 Apr 2012
 * ----------------------------------------------------------------------------
 */

import SimpleOpenNI.*;
SimpleOpenNI  context;
PrintWriter output; // for writing to external text file
int timer = 0;


void setup()
{
  context = new SimpleOpenNI(this);
  // enable depthMap generation 
  if (context.enableDepth() == false)
  {
    println("Can't open the depthMap, maybe the camera is not connected!"); 
    exit();
    return;
  }

  context.enableScene();
  background(200, 0, 0);
  size(context.sceneWidth(), context.sceneHeight());

  String lines[] = loadStrings("kinect.txt"); // read existing text file 
  output = createWriter("kinect.txt");  // create new text file
  for (int i=0; i < lines.length; i++) { // go through each saved line and
    output.println(lines[i]); // write that into the new file
    println(lines[i]);
  }
}

void draw() {

  //TIMESTAMP - ADDED BY K
  String yr = str(year());
  String m = str(month());
  String d = str(day());
  String h = str(hour());
  String n = str(minute());
  String s = str(second());
  if (m.length() == 1) {
    m = "0" + m;
  }
  if (d.length() == 1) {
    d = "0" + d;
  }
  if (h.length() == 1) {
    h = "0" + h;
  }
  if (n.length() == 1) {
    n = "0" + n;
  }
  if (s.length() == 1) {
    s = "0" + s;
  }


  // update the cam
  context.update();

  // draw irImageMap
  image(context.sceneImage(), 0, 0);

  // // gives you a label map, 0 = no person, 0+n = person n
  int[] map = context.sceneMap();
  // set foundPerson to false at beginning of each frame
  boolean foundPerson = false;

  // go through all values in the array
  for (int i=0; i<map.length; i++) {
    // if something in the foreground has been identified
    if (map[i] > 0) {
      // change the flag to true
      foundPerson = true;
    }
  }
  if (foundPerson) {
    println(yr+m+d+h+n+s);
    output.println(yr+m+d+h+n+s);
    output.flush();
    if ((timer > 5) && (timer < 10)) {
      saveFrame();
    }
    timer = timer+1;
  }
  else {
    timer = 0;
  }

  if (second() == 00) {
    // Declare a new FTPClient
    FTPClient ftp;

    try
    {

      // set up a new ftp client
      ftp = new FTPClient();
      ftp.setRemoteHost("ftp3.ftptoyoursite.com"); 

      // connect to the ftp client
      println ("Connecting");
      ftp.connect();

      // login to the ftp client
      println ("Logging in");
      ftp.login("snapwalker", "fLYBp3P4y76R");

      // set passive mode
      println ("Setting passive mode");
      ftp.setConnectMode(FTPConnectMode.PASV);
      ftp.setType(FTPTransferType.BINARY);

      // change directory
      //println("changing directory");
      ftp.chdir("www.walkerred.com/web/content/");

      // copy file to server and overwrite the existing file
      println ("Putting file");
      ftp.put("/Users/kevin/Documents/Processing/ftp/test.txt", "test.txt", false);

      // Shut down client
      println ("Quitting FTP");
      ftp.quit();
    }
    catch (Exception e)
    {
      //Print out the type of error
      println("Error "+e);
    }
  }
}

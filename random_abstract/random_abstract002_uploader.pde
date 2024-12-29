/**
 * random abstract 
 * This version uploades randomized composition via FTP
 * Kevin Walker 14 Dec 09
 */

void setup()
{
  size(200, 200);
  smooth(); 
  background(255);
  noStroke();
}


void draw(){

  int i=0;
  while (i < 8) {
    fill(random(255),random(255));  	  
    float x = random(200);
    float y = random(200);
    float w = (random(200-x));
    float h = (random(200-y));
    rect(x, y, w, h);
    i = i + 1;
  }
  save("random.jpg");

  //delay(5000);

  // Declare a new FTPClient
  FTPClient ftp;

  try
  {

    // set up a new ftp client
    ftp = new FTPClient();
    ftp.setRemoteHost("your_server_here"); 

    // set up listener
    //FTPMessageCollector listener = new FTPMessageCollector();
    //ftp.setMessageListener(listener);

    // connect to the ftp client
    println ("Connecting");
    ftp.connect();

    // login to the ftp client
    println ("Logging in");
    ftp.login("your_login", "your_password");

    // set passive mode
    println ("Setting passive mode");
    ftp.setConnectMode(FTPConnectMode.PASV);
    ftp.setType(FTPTransferType.BINARY);

    // change directory
    println("changing directory");
    ftp.chdir("/httpdocs/"); // your directory

    // delete file from server
    //println ("Deleting file");
    //ftp.delete("random.jpg");

    // copy file to server  and overwrite the existing file
    println ("Putting file");
    ftp.put("/Users/kevin/Desktop/random/random002_uploader/application.macosx/random.jpg", "random.jpg", false); // put here the path to the file to upload

    // Print out the listener messages
    //String messages = listener.getLog();
    //println ("Listener log:");

    // Shut down client
    println ("Quitting client");
    ftp.quit();

    // End message - if you get to here it must have worked
    //println(messages);
    //println ("Test complete");

  }
    catch (Exception e)
    {
  //Print out the type of error
      println("Error "+e);
   }

  exit();
}

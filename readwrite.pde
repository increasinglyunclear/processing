// Read/write from/to a text file
// Kevin Walker 21 Oct 2015

//  READ FROM AN EXTERNAL TEXT FILE
String lines[] = loadStrings("recordings.txt"); 
// Reads existing text file into an array
// Create this file first if it doesn't exist, in TextEdit as a plain text file.
// This file lives in a folder called Data in the sketch folder.

// WRITE TO AN EXTERNAL TEXT TILE
output = createWriter("recordings.txt");  
// creates a new text file in the sketch's Data folder
for (int i=0; i < lines.length; i++) { // go through each saved line and
  output.println(lines[i]); // write that into the new file
}

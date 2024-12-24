// Creates simple candlestick chart from  CSV file
// Kevin Walker 25 Jun 2024

//String lines[] = loadStrings("http://download.finance.yahoo.com/q?s=aapl");
// NASD listings: http://www.nasdaqtrader.com/dynamic/SymDir/nasdaqlisted.txt

size(960, 640);
background(255);
noLoop();

// FORMAT DATE & TIME
int d = day();    // Values from 1 - 31
int m = month();  // Values from 1 - 12
int yr = year();   // 2003, 2004, 2005, etc.
int s = second();  // Values from 0 - 59
int mn = minute();  // Values from 0 - 59
int h = hour();    // Values from 0 - 23
if (d<10) {
  String ss = '0' + str(s);
  println(ss);
}

// Pull your own .csv file from the 'history' tab of an asset at https://finance.yahoo.com
// I used to build a URL dynamically - here is an outdated one from Yahoo Finance:
// String url = "http://ichart.finance.yahoo.com/table.csv?s=" + symbol + "&a=" + (month()-1) + "&b=" + (day()-5) + "&c=" + year() + "&d=" + (month()-1) + "&e=" + day() + "&f=" + year() + "&g=d&ignore=.csv";

String[] lines = loadStrings("amc.csv"); // the built URL or CSV file goes in there
int[] lines_int = new int[lines.length];
//println(lines); // for debug

// FIND HIGHEST, LOWEST - check why I did this
float highest = 0;
float lowest = 999999999;
for (int i=1; i < lines.length; i++) { // Note: start with line 1 not 0
  String shorty = trim(lines[i]);
  String[] tokin = splitTokens(shorty, ",");
  float closing = float(tokin[4]);
  if (closing > highest) {
    highest = closing;
  }
  if (closing < lowest) {
    lowest = closing;
  }
}

//DRAW CANDLES
float xstart = 0;
float ystart = 0;
for (int i=1; i < lines.length; i++) { 
  String shorty = trim(lines[i]);
  String[] tokin = splitTokens(shorty, ",");
  float opening = abs(590-(map(float(tokin[1]), lowest, highest, 0, 590)))+10;  
  float high = abs(590-(map(float(tokin[2]), lowest, highest, 0, 590)))+10;
  float low = abs(590-(map(float(tokin[3]), lowest, highest, 0, 590)))+10;
  float closing = float(tokin[4]);
  float x = abs(890-(map(i, 1, lines.length, 10, 890)))+20;
  float y = abs(590-(map(closing, lowest, highest, 0, 590)))+10;  
  if (closing > float(tokin[1])) {
    fill(0, 200, 0);
  } else {
    fill(255, 50, 50);
  }
  stroke(0);
  line(x, high, x, low);
  noStroke();
  rect(x-5, opening, 10, y-opening);
  xstart=x;
  ystart=y;

  // MOVING AVG - WIP, NOT WORKING YET
  if (i > 8) {
    float avg = 0;
    for (int j=1; i < i; j++) { 
      avg = avg + closing;
    }
    avg = closing / 8;
    float avgy = abs(590-(map(avg, lowest, highest, 0, 590)))+10; 
    //ellipse(x, opening, 50, 50);
  }
}

// Save the chart as an image, if you want
// save("be.png");

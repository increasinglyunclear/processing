// Simple HTML parsing
// Kevin Walker 15 Oct 2015

String lines[] = loadStrings("https://news.google.com/home?hl=en-GB&gl=GB&ceid=GB%3Aen"); // put your URL here

for (int i=0; i < lines.length; i++) {
  String[] m1 = match(lines[i], "jeju"); // put your keyword here
  if (m1 != null) {
    String shorty = trim(lines[i]);
    println(shorty);
  }
}

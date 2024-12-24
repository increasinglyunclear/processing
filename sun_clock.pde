// Shows the current position of the sun in a given location.
// Kevin Walker 2010, updated Dec 2024

int cx, cy;
int radius;
int absposition;
float latitude = 51.5074;  // London
float longitude = -0.1278;
float zenith = 90.83333; // Official sunrise/sunset zenith
int day, month, year;
float timeZoneOffset = 1;  // Use 1 for BST (March-October), 0 for GMT (October-March)

void setup() {
  size(800, 100);
  smooth();
  
  radius = min(width, height) / 2;
  cx = width / 2;
  cy = height;

  // Get current date
  day = day();
  month = month();
  year = year();
  
  float[] sunriseSunset = calculateSunriseSunset(day, month, year, latitude, longitude, zenith);
  float sunrise = sunriseSunset[0];
  float sunset = sunriseSunset[1];
  
  float currentHour = hour() + minute()/60.0;
  
  println("Date: " + day + "/" + month + "/" + year);
  println("Location: " + latitude + "°N, " + longitude + "°W");
  println("Timezone offset: " + timeZoneOffset);
  println("Sunrise: " + formatTime(sunrise));
  println("Sunset: " + formatTime(sunset));
  println("Current time: " + formatTime(currentHour));
  println("Day length: " + formatTime(sunset - sunrise));
  
  // Calculate position
  float totalHours = sunset - sunrise;
  float elapsedHours = currentHour - sunrise;
  float relativeposition = elapsedHours / totalHours;
  absposition = int(180 + (180 * relativeposition)); // Map to 180-360 degree arc
}

void draw() {
  background(255);
  stroke(200);
  
  // Get current time
  float currentHour = hour() + minute()/60.0;
  
  // Recalculate sunrise/sunset times
  float[] sunriseSunset = calculateSunriseSunset(day, month, year, latitude, longitude, zenith);
  float sunrise = sunriseSunset[0];
  float sunset = sunriseSunset[1];
  
  // Only draw the sun if it's between sunrise and sunset
  if (currentHour >= sunrise && currentHour <= sunset) {
    int a = absposition;
    float x = cx + cos(radians(a)) * radius * 5;
    float y = cy + sin(radians(a)) * radius * 2;
    ellipse(x, y, 100, 100);
  }
}

float[] calculateSunriseSunset(int day, int month, int year, float lat, float lng, float zenith) {
  // Get day of year
  int N = dayOfYear(day, month, year);
  
  // Convert to radians
  float latRad = radians(lat);
  
  // Solar declination
  float decl = radians(23.45 * sin(radians(360.0/365.0 * (N - 81))));
  
  // Hour angle
  float hourAngle = degrees(acos(cos(radians(zenith)) / (cos(latRad) * cos(decl)) - 
                                tan(latRad) * tan(decl)));
  
  // Convert to hours
  hourAngle = hourAngle / 15.0;
  
  // Calculate sunrise and sunset
  float noon = 12.0 - (lng / 15.0);  // Solar noon
  float sunrise = noon - hourAngle;
  float sunset = noon + hourAngle;
  
  // Add timezone offset
  sunrise += timeZoneOffset;
  sunset += timeZoneOffset;
  
  // Ensure times are between 0-24
  sunrise = (sunrise + 24) % 24;
  sunset = (sunset + 24) % 24;
  
  return new float[] {sunrise, sunset};
}

int dayOfYear(int day, int month, int year) {
  int N1 = floor(275 * month / 9);
  int N2 = floor((month + 9) / 12);
  int N3 = (1 + floor((year - 4 * floor(year / 4) + 2) / 3));
  return N1 - (N2 * N3) + day - 30;
}

float normalizeDegrees(float degree) {
  while (degree >= 360.0) degree -= 360.0;
  while (degree < 0.0) degree += 360.0;
  return degree;
}

// Helper function to format decimal hours as HH:MM
String formatTime(float decimalHours) {
  int hours = floor(decimalHours);
  int minutes = floor((decimalHours - hours) * 60);
  return nf(hours, 2) + ":" + nf(minutes, 2);
}





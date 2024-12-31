// ADAPTED FROM
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// A random walker object!

class Walker {
  float x, y, z;
  float prevX, prevY, prevZ;
  ArrayList<PVector> trail;
  
  Walker() {
    // Start from center
    x = 0;
    y = 0;
    z = 0;
    prevX = x;
    prevY = y;
    prevZ = z;
    trail = new ArrayList<PVector>();
    trail.add(new PVector(x, y, z));
  }
  
  void step() {
    // Save previous position
    prevX = x;
    prevY = y;
    prevZ = z;
    
    // Random movement in 3D space
    x += random(-2, 2);
    y += random(-2, 2);
    z += random(-2, 2);
    
    // Keep within bounds - increased vertical range
    x = constrain(x, -200, 200);
    y = constrain(y, -200, 200);
    z = constrain(z, -200, 200);
    
    // Add new position to trail
    trail.add(new PVector(x, y, z));
  }
  
  void render() {
    stroke(255, 35);
    strokeWeight(1);
    
    // Draw trail as individual line segments
    for (int i = 1; i < trail.size(); i++) {
      PVector p1 = trail.get(i-1);
      PVector p2 = trail.get(i);
      line(p1.x, p1.y, p1.z, p2.x, p2.y, p2.z);
    }
    
    // Draw current position
    pushMatrix();
    translate(x, y, z);
    noStroke();
    fill(255, 35);
    sphere(1);
    popMatrix();
  }
}

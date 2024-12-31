// 3D version of Random Walk
// Kevin Walker 31 Dec 2024
// requires Walker.pde

Walker w;
Walker u;
Walker t;
Walker s;
Walker r;
Walker q;
Walker p;
Walker o;

float rotationY = 0;
float rotationX = 0;
float lastMouseX = 0;
float lastMouseY = 0;
boolean isDragging = false;
float zoomLevel = 6;
float targetZoom = 6;
float zoomSpeed = 0.15;
float zoomStep = 0.8;
boolean zoomingIn = false;
boolean zoomingOut = false;
boolean showGrid = false;

void setup() {
  size(800, 800, P3D);
  // Create walker objects
  w = new Walker();
  u = new Walker();
  t = new Walker();
  s = new Walker();
  r = new Walker();
  q = new Walker();
  p = new Walker();
  o = new Walker();
  
  // Black background - only once at start
  background(0);
  
  updateCamera();  // New function to handle camera position
}

void draw() {
  // Clear the background each frame
  background(0);
  
  // Handle continuous zooming
  if (zoomingIn) {
    targetZoom = targetZoom - zoomStep;
  }
  if (zoomingOut) {
    targetZoom = min(10, targetZoom + zoomStep);
  }
  
  // Smooth zoom interpolation
  zoomLevel = lerp(zoomLevel, targetZoom, zoomSpeed);
  
  // Update camera position before any other transformations
  updateCamera();
  
  // Add some basic lighting
  lights();
  
  // Center and rotate based on mouse position (not drag)
  translate(width/2, height/2, 0);
  rotationY = map(mouseX, 0, width, PI, -PI);
  rotationX = map(mouseY, 0, height, -PI, PI);
  rotateY(rotationY);
  rotateX(rotationX);
  
  // Draw grid only if enabled
  if (showGrid) {
    drawGrid();
  }
  
  // Run the walker objects continuously
  w.step();
  u.step();
  t.step();
  s.step();
  r.step();
  q.step();
  p.step();
  o.step();
  
  // Render the trails
  w.render();
  u.render();
  t.render();
  s.render();
  r.render();
  q.render();
  p.render();
  o.render();
}

void drawGrid() {
  // Draw reference grid with solid appearance
  stroke(50); // Dim gray
  strokeWeight(1);
  
  // Draw horizontal grid lines - half the previous size
  for (int x = -200; x <= 200; x += 25) {
    line(x, 0, -200, x, 0, 200);
  }
  
  // Draw depth grid lines - half the previous size
  for (int z = -200; z <= 200; z += 25) {
    line(-200, 0, z, 200, 0, z);
  }
}

void keyPressed() {
  if (keyCode == UP) {
    zoomingIn = true;
  } else if (keyCode == DOWN) {
    zoomingOut = true;
  } else if (key == 'g' || key == 'G') {
    showGrid = !showGrid;  // Toggle grid visibility
  }
}

void keyReleased() {
  if (keyCode == UP) {
    zoomingIn = false;
  } else if (keyCode == DOWN) {
    zoomingOut = false;
  }
}

void updateCamera() {
  // Convert zoom level to actual distance using a more extreme exponential function
  float distance = pow(1.5, zoomLevel);
  
  // Calculate camera position based on spherical coordinates
  float camX = width/2 + sin(rotationY) * cos(rotationX) * distance;
  float camY = height/2 + sin(rotationX) * distance;
  float camZ = height/2 + cos(rotationY) * cos(rotationX) * distance;
  
  // Look at exact center of walker space
  camera(camX, camY, camZ,
         width/2, height/2, 0,
         0, 1, 0);
         
  // Adjust perspective for extreme close-ups
  perspective(PI/3, float(width)/float(height), 0.00001, 1000000);
}

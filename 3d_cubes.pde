// Draws randomized 3D cubes when the spacebar is pressed
// Kevin Walker 08 Oct 2010

void setup() 
{ 
  size(640, 360, P3D); 
  background(0);
  lights();
}

void draw() 
{ 

  if (keyPressed == true) {
    if (key == ' ') {

      background(0);
      stroke(255);
      fill(128, 128);
      
      pushMatrix();
      translate(random(width), random(height), 0);
      rotateY(10); 
      rotateX(0); 
      box(random(height));
      popMatrix();

      pushMatrix();
      translate(random(width), random(height), 0);
      rotateY(10);
      rotateX(0);
      box(random(height));
      popMatrix();

      //noFill();
      //stroke(255);
      //pushMatrix();
      //translate(500, height*0.35, -200);
      //sphere(280);
      //popMatrix();
    }
  }
  
  
}

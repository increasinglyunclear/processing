// Starting to steer the walkers
// Kevin Walker 09 Apr 2021
// Walker.pde is required

Walker w;
Walker u;
Walker t;
Walker s;
Walker r;
Walker q;
Walker p;
Walker o;

void setup() {
  size(800, 800);
  // Create a walker object
  w = new Walker();
  u = new Walker();
  t = new Walker();
  s = new Walker();
  r = new Walker();
  q = new Walker();
  p = new Walker();
  o = new Walker();
  background(0);
  translate(width/2, height/2);
  fill(0);
  ellipse(0, 0, height-50, height-50);
}

void draw() {
  // Run the walker object
  w.step();
  w.render();
  u.step();
  u.render();
  t.step();
  t.render();
  s.step();
  s.render();
  r.step();
  r.render();
  q.step();
  q.render();
  p.step();
  p.render();
  o.step();
  o.render();
}

int number;
int radius = 7;
float stepSize = 0.5;
int opacity = 200;
boolean animate = true;
float time = 0;

void setup() {
  size(500, 500);                       
  noStroke();                     
}

void draw() {
  background(54,131,141);
  fill(97,209,246,opacity);
  translate(width / 2, height / 2);
  if (animate == true){
    number = frameCount;
  }
  float goldenAngle = PI * (3.0 - sqrt(5));
  
  rotate(time);
  
  for (int i = 0; i < number; i++) {
    translate(0, i * stepSize);
    rotate(goldenAngle);

    // draw ellipse
    ellipse(0, 0, radius, radius);

  }
  time += 0.01;                                
}

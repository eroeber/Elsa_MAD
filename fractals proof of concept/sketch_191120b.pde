//var slider;

int number;
int radius = 10;
float stepSize = 0.5;
int opacity = 200;
boolean animate = true;
int time = 0;

void setup(){
  size(500, 500);                       
  noStroke();      
  
  //slider = createSlider(2, 25, 10);
  //slider.position(width/2, 10);

}

void draw(){
  background(0);
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
    //int val = slider.value();
    ellipse(0, 0, radius, radius);

  }
  time += 0.01;                                
}

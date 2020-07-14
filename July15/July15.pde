PImage sky;//background

int xrect=80;//paddle width
int yrect=20;//paddle height

float xellipse, yellipse;//starting positions
float xspeed=1;//speed in x
float yspeed=2;//speed in y
float gravity=0.1;//gravity

int xdirection = 1;//left to right direction
int ydirection = 1;//top to bottom direction

int radius=10;//ellipse radius

void setup() {
  sky=loadImage("C:/Users/veror/OneDrive/Documents/Summer2020/DESINV23/July15/blue-sky.jpg");//background image of a sky
  size(500, 500);
  xellipse = width/2;//starting position x
  yellipse = height/2;//starting position y
}

void draw() {
  image(sky, 0, -400);
  fill(#336D9A);
  stroke(#285272);
  drawEllipse();
  EllipseMovement();
  EllipseBounce();
  drawPaddle();
}
void drawEllipse() {
  fill (#FFFFFF);
  stroke(1);
  ellipse(xellipse, yellipse, radius*2, radius*2);
}
void EllipseMovement() {//speed and gravity
  yellipse=yellipse+yspeed;
  xellipse=xellipse+xspeed;
  yspeed=yspeed+gravity;
}
void EllipseBounce() {
  if (xellipse > width-radius) {//off right side
    xspeed=-xspeed;
  }
  if (xellipse < radius) {//off left side
    xspeed=-xspeed;
  }
  if (yellipse+radius>height-yrect&&yellipse+radius<height+yrect&&xellipse+radius<mouseX+xrect&&xellipse+radius>mouseX-xrect) {//off paddle
    yspeed=-yspeed;
  }
}
void drawPaddle() {
  stroke(#285272);
  fill(#4685B6);
  rect(mouseX, height-yrect, xrect, yrect);
}

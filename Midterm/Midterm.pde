import processing.video.*;
Capture cam;//game over, loser

import processing.sound.*;
SoundFile ding;//collision
SoundFile aww;//miss

PImage sky;//background

int xrect=80;//paddle width
int yrect=20;//paddle height

float xellipse, yellipse;//starting positions
float xspeed, yspeed;//ellipse speed
float gravity=0.1;//gravity

int radius=10;//ellipse radius

//score board
int score=0;
int topscore=0;
PFont f;

int missCounter=0;//aww sound counter

void setup() {
  sky=loadImage("C:/Users/veror/OneDrive/Documents/Summer2020/DESINV23/July15/blue-sky.jpg");//background image of a sky
  size(500, 500);
  ding = new SoundFile(this, "ding.mp3");//sound for collision
  aww = new SoundFile(this, "aww.mp3");//sound for collision

  String[] cameras = Capture.list();//camera setup

  if (cameras == null) {
    println("Failed to retrieve the list of available cameras, will try the default...");
    cam = new Capture(this, 640, 480);
  } 
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    printArray(cameras);
  }
  cam = new Capture(this, cameras[0]);

  reset();
}

void reset() {
  xellipse = width/2;
  yellipse = height/2;
  xspeed=random(3, 4);
  yspeed=random(3, 5);
  score=0;
  missCounter=0;
  cam.stop();
}

void draw() {
  image(sky, 0, -400);
  fill(#336D9A);
  stroke(#285272);
  drawEllipse();
  EllipseMovement();
  EllipseBounce();
  drawPaddle();
  score();
  miss();
}

void drawEllipse() {//circular ball
  fill (#FFFFFF);
  stroke(1);
  ellipse(xellipse, yellipse, radius*2, radius*2);
}

void EllipseMovement() {//speed and gravity
  yellipse=yellipse+yspeed;
  xellipse=xellipse+xspeed;
  yspeed=yspeed+gravity;
}

void EllipseBounce() {//bouncing off
  if (xellipse > width-radius) {//the right side
    xspeed=-xspeed;
  }
  if (xellipse < radius) {//the left side
    xspeed=-xspeed;
  }
  if (yellipse < radius) {//the top
    yspeed=-yspeed;
  }
  //the paddle
  if (xellipse+radius > mouseX && xellipse-radius < mouseX + xrect && yellipse+radius > height-yrect && yellipse+radius < height) {
    yspeed=-yspeed;
    score=score+1;
    ding.play();
  }
}

void drawPaddle() {//rectangular paddle
  stroke(#285272);
  fill(#4685B6);
  rect(mouseX, height-yrect, xrect, yrect);
}

void score() {//update the score
  f=createFont("mono", 30);
  textFont(f);
  fill(255);
  text("Score:"+ score, 200, height/2);
}

void miss() {
  if (yellipse>height) {//don't bounce off bottom
    aww.play();
    cam.start();
    if (cam.available() == true) {//show player's face
      cam.read();
    }
    image(cam, 0, 0, width, height);

    missCounter=missCounter+1;//timer for aww sound
    f=createFont("mono", 50);
    textFont(f);
    fill(255);
    text("You LOSE", 130, 100);

    f=createFont("mono", 20);//top score
    textFont(f);
    fill(255);
    text("Top Score:"+ topscore, width/2-70, height/2-120);

    if (topscore<=score) {//new top score
      topscore=score;
      f=createFont("mono", 20);
      textFont(f);
      fill(255);
      text("New Top Score!", width/2-80, height/2-200);
    }
    if (missCounter>=10) {//seconds until aww sound stops
      aww.stop();
    }
  }
}
void mousePressed() {//restart game
  reset();
}

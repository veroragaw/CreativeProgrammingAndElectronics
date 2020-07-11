int x1=100; //<>// //<>//
int x2=202;
int x3=303;
int x4=404;
float weight1=.5;
float weight2=.5;
float weight3=.5;
float weight4=.5;

void setup() {
  size(900, 900);
  background(0);//black background
}

void draw() {
  while (x1<500) {//red lines
    stroke(#E53737);
    strokeWeight(weight1);
    weight1=weight1+0.1;
    line(x1, 200, x1, 600);
    x1=x1+10;
  }
  while (x2<600) {//green lines
    stroke(#41B63D);
    strokeWeight(weight2);
    weight2=weight2+0.1;
    line(x2, 100, x2, 500);
    x2=x2+10;
  }
  while (x3<700) {//yellow lines
    stroke(#FFFF3F);
    strokeWeight(weight3);
    weight3=weight3+0.1;
    line(x3, 400, x3, 800);
    x3=x3+10;
  }
  while (x4<800) {//blue lines
    stroke(#4735E5);
    strokeWeight(weight4);
    weight4=weight4+0.1;
    line(x4, 300, x4, 700);
    x4=x4+10;
  }
}

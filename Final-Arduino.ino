#include <Servo.h>

Servo myservo;

int pos = 90;//original position
int on = 180; //turn light on
int off = 45; //turn light off

int switch1 = 2;
int switch2 = 3;
int soundSensor = 4;
int lightSensor = A0;
int LED = 12;
int servo = 9;

boolean LEDStatus = false;

void setup() {
  Serial.begin(9600);
  myservo.attach(servo);
  pinMode(soundSensor, INPUT);
  pinMode(switch1, INPUT);
  pinMode(LED, OUTPUT);
}

void loop() {

  int sensorData = digitalRead(soundSensor);
  int switchState1 = digitalRead(switch1);
  int switchState2 = digitalRead(switch2);
  int lightData = analogRead(lightSensor);

  Serial.print("Sound=");
  Serial.println(sensorData); //print the sound value to serial
  Serial.print("Switch1=");
  Serial.println(switchState1); //print the sound value to serial
  Serial.print("Light=");
  Serial.println(lightData); //print the sound value to serial
  Serial.print("Switch2=");
  Serial.println(switchState2); //print the sound value to serial*/


  if (sensorData == HIGH) {//if noise is sensed
    delay(15);
    if (lightData <= 200) { // if lights are off, turn them on
      LEDStatus = true;
      digitalWrite(LED, HIGH);
      myservo.write(on);
    }
    if(lightData>=200) { // if lights are on, turn them off
      LEDStatus = false;
      digitalWrite(LED, LOW);
      myservo.write(off);
    }
  }
  
  if (switchState1 == HIGH) {//if switch 1 is pressed, turn on lights
    LEDStatus = true;
    digitalWrite(LED, HIGH);
    myservo.write(on);
  }
  if (switchState2 == HIGH) {//if switch 2 is pressed, turn off lights
    LEDStatus = false;
    digitalWrite(LED, LOW);
    myservo.write(off);
  }
  
 //myservo.write(pos);//
}

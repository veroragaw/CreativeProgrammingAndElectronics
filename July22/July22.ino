void setup() {
  // put your setup code here, to run once:
  pinMode(LED_BUILTIN, OUTPUT);//Builtin LED
  pinMode(5, OUTPUT);//LED connecte to 5
  Serial.begin(9600);// initialize serial communication at 9600 bits per second
}

void loop() {
  // put your main code here, to run repeatedly:

  int switchPosition = digitalRead(A0);// switch connected to A0
  int sensorValue = analogRead(A3);// analog sensor connected to A3

  if (switchPosition == HIGH) {
    digitalWrite(LED_BUILTIN, HIGH);   // turn the LED on (HIGH is the voltage level)
    delay(100);                       // wait for a second
    digitalWrite(LED_BUILTIN, LOW);    // turn the LED off by making the voltage LOW
    delay(100);                       // wait for a second
  }
  if (sensorValue < 450) {
    digitalWrite(5, HIGH);   // turn the LED on (HIGH is the voltage level)
    delay(1000);                       // wait for a second
    digitalWrite(5, LOW);    // turn the LED off by making the voltage LOW
    delay(1000);                       // wait for a second
  }
  Serial.println(sensorValue);// print out the value
}

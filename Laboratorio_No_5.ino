#include <Ultrasonic.h>
#include <Pitches.h>

Ultrasonic ultrasonic(6, 7); //Trigger, Echo
int sonido = NOTE_E5;
int sonar;

void setup() {
  Serial.begin(9600);
}

void loop() {
  sonar = ultrasonic.Ranging(CM);
  while (sonar < 60) {
    noTone(8);
    delay(sonar * 10);
    tone(8, sonido);
    delay(100);
    noTone(8);  
    Serial.write(sonar);
    while (sonar < 10) {
      tone(8, sonido);
      sonar = ultrasonic.Ranging(CM);
      Serial.write(sonar);
    }
    sonar = ultrasonic.Ranging(CM);
  }
  Serial.write(sonar);
}

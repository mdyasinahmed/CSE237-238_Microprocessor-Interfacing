#define LED_PIN D4
#define BUZZER_PIN 14

bool isRunning = false;

void setup() {
  pinMode(LED_PIN, OUTPUT);
  pinMode(BUZZER_PIN, OUTPUT);
}

void loop() {
  if (isRunning) {
    digitalWrite(LED_PIN, HIGH);
    delay(500);
    digitalWrite(LED_PIN, LOW);
    delay(500);

    tone(BUZZER_PIN, 780, 180);
    delay(200);
  } else {
    digitalWrite(LED_PIN, LOW);
    noTone(BUZZER_PIN);
    while (true) {
    }
  }
}

void stopExecution() {
  isRunning = false;
}

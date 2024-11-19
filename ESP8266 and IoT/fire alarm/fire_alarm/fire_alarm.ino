#define FIRE_SENSOR_PIN A0  // Analog pin connected to the flame sensor
#define LED_PIN D4          // GPIO pin connected to the LED

int threshold = 300;        // Threshold value to detect fire

void setup() {
  pinMode(FIRE_SENSOR_PIN, INPUT);  // Set fire sensor pin as input
  pinMode(LED_PIN, OUTPUT);         // Set LED pin as output
  digitalWrite(LED_PIN, LOW);       // Ensure LED is OFF initially

  Serial.begin(9600);               // Initialize Serial Monitor for debugging
}

void loop() {
  int fireValue = analogRead(FIRE_SENSOR_PIN); // Read flame sensor value
  Serial.print("Flame Sensor Value: ");
  Serial.println(fireValue);       // Print value to Serial Monitor

  // Check fire sensor value
  if (fireValue < threshold) {
    // Blink LED rapidly
    for (int i = 0; i < 5; i++) {
      digitalWrite(LED_PIN, HIGH); // Turn ON LED
      delay(100);                  // ON duration
      digitalWrite(LED_PIN, LOW);  // Turn OFF LED
      delay(100);                  // OFF duration
    }
  } else {
    // Ensure LED stays off if no fire
    digitalWrite(LED_PIN, LOW);
  }

  delay(100); // Small delay for stability
}

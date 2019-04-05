int sensorValue;
int wiperPosition;
float x;

void setup()
{
  Serial.begin(9600);
}

void loop()
{
  sensorValue = analogRead(A0);
  wiperPosition = map(sensorValue,0, 1023, 0, 270);
  Serial.println(sensorValue);
  delay(10);
}


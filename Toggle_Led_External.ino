int newState=HIGH,oldState=HIGH,ledState=LOW;

void setup()
{
  pinMode(3, OUTPUT);
  pinMode(2, INPUT);
}

void loop()
{
  newState = digitalRead(2);

  if((oldState == HIGH)&&(newState==LOW))
  {
    delay(20);

    if(ledState==HIGH)
    {
      digitalWrite(3, LOW);
      ledState=LOW;
    }
    else
    {
      digitalWrite(3, HIGH);
      ledState=HIGH;
    }
  }
  oldState=newState;
}


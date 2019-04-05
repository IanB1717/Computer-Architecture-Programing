#include <LiquidCrystal.h> 
int sensorValue;
int wiperPosition;
LiquidCrystal lcd(7, 10, 8, 11, 9, 12); // Reset,Enable,D4,D5,D6,D7

void setup()
{
  lcd.begin(16, 2); 
}

void loop()
{
   lcd.setCursor(0, 0);
   sensorValue = analogRead(A0);
   wiperPosition = map(sensorValue, 0, 1023, 0, 270);
   lcd.print("Pos: ");
   lcd.print(wiperPosition);
   lcd.print("  "); 
   delay(10); 

}


/*
 *  This sketch demonstrates how to scan WiFi networks. 
 *  The API is almost the same as with the WiFi Shield library, 
 *  the most obvious difference being the different file you need to include:
 */
#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <ESP8266HTTPClient.h>

#include <DHT.h>
#define DHT11_PIN 2
DHT DHT(DHT11_PIN,DHT11);
const int sensor_pin = 17;  /* Connect Soil moisture analog sensor pin to A0 of NodeMCU */
int buzzPin =  4;    //Connect Buzzer on Digital Pin3

char ssid[] = "TECNO POVA Neo *103#"; // your network SSID (name)
char pass[] = "*738*Moi#2"; // your network password
int status = WL_IDLE_STATUS; // the Wifi radio's status

float temperature;
float humidite;
float moisture_percentage;

String serverName = "http://192.168.14.224/insert_temp.php";

/* FONCTION DE CONNEXION WIFI ET D'ENVOIE DE DONNEES */
void setup(){
  pinMode(LED_BUILTIN, OUTPUT);
  pinMode(14, OUTPUT); // Led verte
  pinMode(0, OUTPUT); // Led rouge
  pinMode(buzzPin, OUTPUT); 
  Serial.begin(115200);
  DHT.begin();
  temperature = DHT.readTemperature();
  humidite = DHT.readHumidity();
  moisture_percentage = ( 100.00 - ( (analogRead(sensor_pin)/1023.00) * 100.00 ) );


  // Set WiFi to station mode and disconnect from an AP if it was previously connected
  WiFi.mode(WIFI_STA);
  WiFi.disconnect();
  delay(100);

  Serial.println("Setup done");
  Serial.println("scan start");

  // WiFi.scanNetworks will return the number of networks found
  int n = WiFi.scanNetworks();
  Serial.println("scan done");

  if (n == 0)
    Serial.println("no networks found");
  else
  {
    Serial.print(n);
    Serial.println(" networks found");
    for (int i = 0; i < n; ++i)
    {
      // Print SSID and RSSI for each network found
      Serial.print(i + 1);
      Serial.print(": ");
      Serial.print(WiFi.SSID(i));
      Serial.print(" (");
      Serial.print(WiFi.RSSI(i));
      Serial.print(")");
      Serial.println((WiFi.encryptionType(i) == ENC_TYPE_NONE)?" ":"*");
//      delay(10);
    }

    do
    {
      Serial.print("Tentative de connexion au reseau SSID : ");
      Serial.println(ssid);
      status = WiFi.begin(ssid, pass); // tentative de connexion au réseau WPA/WPA2
      delay(5000); // attente de 7 secondes pour la connexion
      if(status != WL_CONNECTED){
        digitalWrite(0, HIGH);   // turn the LED on (HIGH is the voltage level)
        delay(1000);                       // wait for a second
        digitalWrite(0, LOW);    // turn the LED off by making the voltage LOW
        delay(1000); 
      }
    }
    while ( status != WL_CONNECTED); // boucle tant que pas connecté
    Serial.println("Connexion reussie");
    
    if( status = WL_CONNECTED)
    {
       digitalWrite(buzzPin, HIGH);
       delay(1000);
       digitalWrite(buzzPin, LOW); 
       
       digitalWrite(0, HIGH);   // turn the LED on (HIGH is the voltage level)
       Serial.print("Signal: ");
       Serial.print(WiFi.RSSI()); // affichage de la puissance de la réception en dBm
       Serial.println(" dBm");
       Serial.println(); //Passer une ligne
       Serial.print("ESP connecter au WiFi avec l'adresse IP: ");
       Serial.println(WiFi.localIP());
       Serial.println();
  
       WiFiClient client;
       HTTPClient http;
  
//       String serverPath = serverName + "?temperature="+ temperature;
        String serverPath = serverName + "?temp="+ temperature +"&hamb="+ humidite + "&hsol="+ moisture_percentage;
       // Your Domain name with URL path or IP address with path
        http.begin(client, serverPath.c_str());
        
        // Send HTTP GET request
        int httpResponseCode = http.GET();
        
        if (httpResponseCode>0)
        {
          Serial.print("HTTP Response code: ");
          Serial.println(httpResponseCode);
          String payload = http.getString();
          Serial.println(payload);
        }
        else
        {
          Serial.print("Error code: ");
          Serial.println(httpResponseCode);
        }
        // Free resources
        http.end();
       //WiFi.disconnect(); // déconnexion 
    }

  }

}

void loop() {
  if( status = WL_CONNECTED){

    
    digitalWrite(14, HIGH);   // turn the LED on (HIGH is the voltage level)
    delay(1000);                       // wait for a second
    digitalWrite(14, LOW);    // turn the LED off by making the voltage LOW
    delay(1000); 

    temperature = DHT.readTemperature();
    humidite = DHT.readHumidity();
    moisture_percentage = ( 100.00 - ( (analogRead(sensor_pin)/1023.00) * 100.00 ) );

    String serverPath = serverName + "?temp="+ temperature +"&hamb="+ humidite + "&hsol="+ moisture_percentage;

    Serial.print("Temperature ambiante = ");
    Serial.print(temperature);
    Serial.println(" C");
    
    Serial.print("Humidite ambiante = ");
    Serial.print(humidite);
    Serial.println(" %");
    
    Serial.print("Humidite du sol = ");
    Serial.print(moisture_percentage);
    Serial.println(" %");

    Serial.println("");
    delay(2000);
    
  }
}

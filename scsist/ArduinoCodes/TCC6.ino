#include<Ethernet.h>
#include<SPI.h>
#include<String.h>

byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED };  //endereco mac 
IPAddress ip( 10, 1, 1, 18 ) ;    //enderecoo IP
EthernetServer server(90);  //criando um objeto do tipo servidor, onde 90 e a porta de comunicacao
int frente = 5; //Define a saida digital 9
int meio = 6;
int atras = 7;

//Portas a Scanear
int frenteScan = analogRead(A0);
int meioScan = analogRead(A1);
int atrasScan = analogRead(A2);

void setup()
{

	Serial.begin(9600);
	Ethernet.begin(mac, ip);    //setando o ip e o mac para o arduino ser reconhecido na rede
	server.begin();        // levantando o servidor
	Serial.print("server is at\n");
	pinMode(frente, OUTPUT);
	pinMode(meio, OUTPUT);
	pinMode(atras, OUTPUT);
	pinMode(frenteScan, INPUT);
	pinMode(meioScan, INPUT);
	pinMode(atrasScan, INPUT);
        //digitalWrite(frente, HIGH);
        //digitalWrite(meio, HIGH);
        //digitalWrite(atras, HIGH);
}

void loop()
{
	EthernetClient client = server.available();    //servidor esperando uma requisicao, apos a requisicao ser encontrada a funcao retorna um objeto do tipo client 
        String a = "";
	if (client)
	{    //testa se o existe
                
		if(client.connected()) 
		{       
            
                        //testa se o cliente esta conectado
			while (client.available())
			{      
                                  
				char c = client.read();
                                a += c;
                                
				delay(500); // da um tempo para  o cliente receber os caracteres 

			}
                        Serial.println(a);
                        switch(a[0]){
                                
				case '3': //Frente
					Serial.println("Entrei no 10");
                                        if (a[1] == '1')
					{
						digitalWrite(frente, HIGH);
						//Serial.println("Ligando");
						client.println("1");
					}
					else
					{
						digitalWrite(frente, LOW);
						//Serial.println("Apagando");
						client.println("0");
					}
					break;

				case '6': //Meio
					Serial.println("Entrei no 20");
                                        if (a[1] == '1')
					{
						digitalWrite(meio, HIGH);
						//Serial.println("Ligando");
						client.println("1");
					}
					else
					{
						digitalWrite(meio, LOW);
						//Serial.println("Apagando");
						client.println("0");
					}
					break;

				case '9': //Atras
					Serial.println("Entrei no 30");
                                        if (a[1] == '1')
					{
						digitalWrite(atras, HIGH);
						//Serial.println("Ligando");
						client.println("1");
					}
					else
					{
						digitalWrite(atras, LOW);
						//Serial.println("Apagando");
						client.println("0");
					}
					break;
					
				case '12': //Scan
					String estado = scan();
					client.println(estado);
					break;
				}
                        
			//client.flush();
		}
		//client.stop();    //finaliza a conexao
	}
}

String scan()
{
	String estado = "000";
	for (int i = 0; i < 100; i++)
	{
    	// A partir de 300 considera-se ligada
    	if (frenteScan > 300)
    	{
     		estado[0] = '1';
    	}
    	if (meioScan > 300)
    	{
     		estado[1] = '1';
    	}
    	if (atrasScan > 300)
    	{
     		estado[2] = '1';
    	}
  	}
  	
  	return estado;
  	

}
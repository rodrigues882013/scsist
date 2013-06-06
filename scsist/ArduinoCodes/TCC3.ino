#include<Ethernet.h>
#include<SPI.h>

byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED };  //endereco mac 
IPAddress ip( 10, 1, 1, 18 ) ;    //enderecoo IP
EthernetServer server(90);  //criando um objeto do tipo servidor, onde 90 e a porta de comunicacao
int frente = 9; //Define a saida digital 9
int meio = 10;
int atras = 11;

char codigo[2];


void setup()
{

  Serial.begin(9600);
  Ethernet.begin(mac, ip);    //setando o ip e o mac para o arduino ser reconhecido na rede
  server.begin();        // levantando o servidor
  Serial.print("server is at ");
  pinMode(frente, OUTPUT);
  pinMode(meio, OUTPUT);
  pinMode(atras, OUTPUT);  

}

void loop()
{
  EthernetClient client = server.available();    //servidor esperando uma requisicao, apos a requisicao ser encontrada a funcao retorna um objeto do tipo client 
                                          
	if (client)
	{    //testa se o existe

		while (client.connected()) 
		{    //testa se o cliente esta conectado

			if (client.available())
			{    //retorna o numero de bytes no buffer de entrada         
				codigo = client.read();

				switch(codigo[0]){
            
					case '0': //Frente
						if (codigo[1] == '0')
						{
							digitalWrite(frente, HIGH);
							Serial.println("Ligando");
							client.println("1");
						}
						else
						{
							digitalWrite(frente, LOW);
							Serial.println("Apagando");
							client.println("0");
						}
						break;
                   
					case '1': //Meio
						if (codigo[1] == '0')
						{
							digitalWrite(meio, HIGH);
							Serial.println("Ligando");
							client.println("1");
						}
						else
						{
							digitalWrite(meio, LOW);
							Serial.println("Apagando");
							client.println("0");
						}
						break;
                   
					case '2': //Atras
						if (codigo[1] == '0')
						{
							digitalWrite(atras, HIGH);
							Serial.println("Ligando");
							client.println("1");
						}
						else
						{
							digitalWrite(atras, LOW);
							Serial.println("Apagando");
							client.println("0");
						}
						break;
				}
				delay(1); // dá um tempo para  o cliente receber os caracteres 
			}
		}
		client.stop();    //finaliza a conexao
	}
}


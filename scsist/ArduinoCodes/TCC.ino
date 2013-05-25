#include <Ethernet.h>
#include <SPI.h>

byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED };  //endereco mac 
IPAddress ip( 10, 1, 1, 18 ) ;    //endereço IP
EthernetServer server(90);  //criando um objeto do tipo servidor, onde 90 e a porta de comunicacao
int led = 9; //Define a saida digital 9


void setup()
{

  Serial.begin(9600);
  Ethernet.begin(mac, ip);    //setando o ip e o mac para o arduino ser reconhecido na rede
  server.begin();        // levantando o servidor
  Serial.print("server is at ");
  pinMode(led, OUTPUT);   

}

void loop()
{
  EthernetClient client = server.available();    //servidor esperando uma requisicao, apos a requisicao ser encontrada a funcao retorna um objeto do tipo client 
                                          
  if (client) {    //testa se o existe

    while (client.connected()) {    //testa se o cliente esta conectado
        
        if (client.available()) {    //retorna o numero de bytes no buffer de entrada
         
            char c = client.read();
            if (c == '1')
            {
                digitalWrite(led, HIGH);
                Serial.println("Ligando");
                client.println("1");
            }
            else
            {
                digitalWrite(led, LOW);
                Serial.println("Apagando");
                client.println("0");
            }
        }
        delay(1); // dá um tempo para  o cliente receber os caracteres 
    }
    client.stop();    //finaliza a conexao
  }
}


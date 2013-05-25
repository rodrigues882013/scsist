#include <Ethernet.h>
#include <SPI.h>

//Definindo scopos
void SetRoom();
void setPinsInRoom();

//Definindo uma estrutura para as salas disponiveis
struct room{
  int devices[5]; 
};
typedef struct room Room;

//Definindo variaveis
byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED };  //endereco mac 
IPAddress ip( 10, 1, 1, 18 ) ;    //endereco IP
EthernetServer server(90);  //criando um objeto do tipo servidor, onde 90 e a porta de comunicacao
int numDip = 5;
Room s
int led = 9; //Define a saida digital 9


//Inicia o vetor de salas
void SetRoom()
{
  int pin[] = {9, 10, 11, 12, 13};
  
  for(i=0; i<numDip; i++)
  {
    s[i].devices[i] = pin[i];
  }
}

void setPinsInRoom()
{
  int i;
  for(i=0; i<numDip; i++)
  {
      pinMode(s[i].devices[j], OUTPUT);
  }

}

void setup()
{

  Serial.begin(9600);
  Ethernet.begin(mac, ip);    //setando o ip e o mac para o arduino ser reconhecido na rede
  server.begin();        // levantando o servidor
  Serial.print("server is at ");
  pinMode(led, OUTPUT);   
  SetRoom(); //Inicializando a estrutura de salas
  setPinsInRoom();

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
        delay(1); // dÃ¡ um tempo para  o cliente receber os caracteres 
    }
    client.stop();    //finaliza a conexao
  }
}


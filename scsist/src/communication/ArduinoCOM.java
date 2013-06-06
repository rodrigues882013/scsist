package communication;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.Socket;

public class ArduinoCOM {
	private Socket client;
	private BufferedReader  in;
	private DataOutputStream out;
	private static ArduinoCOM instance;

	//Estabelece comunicacao entre o cliente em java e o servidor (arduino)
	private ArduinoCOM(String Ip) throws Exception{
		this.client = new Socket(Ip, 90);
		this.out = new DataOutputStream(client.getOutputStream());
		this.in = new BufferedReader(new InputStreamReader(client.getInputStream()));//

	}
	
	public static ArduinoCOM getClient(String Ip) throws Exception {
		if (instance == null){
			instance = new ArduinoCOM(Ip);
		}
		return instance;
		
	}

	//Fecha o cliente de comunicacao bem como os canais estabelecidos
	public boolean closeClient(){
		try{
			this.in.close();
			this.out.close();
			this.client.close();
			return true;
		}
		catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
	
	/****************************************************
	 * Altera o estado de um determinado elemento sendo:*
	 * 	0 - Desligado									*
	 *  1 - Ligado										*
	 * -1 - Falha         								
	 * @throws Exception *
	 ***************************************************/
	public int changeState(String estado, String grupo) throws Exception{
		try {
			String state = "";
			if (estado.compareTo("1") == 0)state = "1";
			if (estado.compareTo("0") == 0)state = "0";
			if (estado.compareTo("-1") == 0)state = "-1";
			String codigo = grupo + state;
			this.out.writeBytes(codigo); 
			int situation = Integer.parseInt(this.in.readLine());
			System.out.println(situation);
			if(situation == 0){ 
				//Desligado
				return 0;
			}
			
			//Ligado
			return 1;
			
		}
		catch (Exception e) {
			//Falha
			e.printStackTrace();
			throw e;
		}
	}
}

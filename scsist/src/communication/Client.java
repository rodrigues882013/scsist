package communication;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.Socket;

public class Client {
	private Socket client;
	private BufferedReader  in;
	private DataOutputStream out;
	private static Client instance;

	//Estabelece comunicacao entre o cliente em java e o servidor (arduino)
	private Client() throws Exception{
		this.client = new Socket("10.1.1.18", 90);
		this.out = new DataOutputStream(client.getOutputStream());
		this.in = new BufferedReader(new InputStreamReader(client.getInputStream()));//

	}
	
	public static Client getClient() throws Exception {
		if (instance == null){
			instance = new Client();
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
	 * -1 - Falha         								*
	 ***************************************************/
	public Integer changeState(String estado){
		try {
			String state = "";
			if (estado.compareTo("LIGADO") == 0)state = "1";
			if (estado.compareTo("DESLIGADO") == 0)state = "0";
			if (estado.compareTo("FALHA") == 0)state = "-1";
			
			this.out.writeBytes(state); 
			Integer situation = Integer.parseInt(this.in.readLine());
			System.out.println(situation);
			if(situation == 0){ 
				//Desligado
				return 0;
			}
			else{
				//Ligado
				return 1;
			}
		}
		catch (Exception e) {
			//Falha
			e.printStackTrace();
			return -1;
		}
	}
}

package model.dao;

import java.sql.DriverManager;
import com.mysql.jdbc.Connection;

public class Conexao{
	private Connection conn;
	private static Conexao Instancia;
	private String database;
	private String usuario;
	private String senha;
	
	//Contrutor privado
	private Conexao(){
		database = "jdbc:mysql://127.0.0.1:3306/scsist";
		usuario = "root";
		senha = "300588";
	}
	
	//Retorna a Instancia, aqui estou usando padrao Singleton, veja que sempre so existira uma instancia do objeto ConexeaoBD
	public static Conexao getInstancia(){
		if(Instancia == null){
			Instancia = new Conexao();
		}
		return Instancia;
	}
	
	public void iniciaBD(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = (Connection) DriverManager.getConnection( database, usuario, senha );
		}
		catch(Exception e){
			e.printStackTrace();
		}

	}
	
	public void fechaBd()
	{	
		try{	
			conn.close();
		}
		catch ( Exception e ) {
         e.printStackTrace();
		}
	}	

	public Connection getConexao()
	{	
		return conn;		
	}
}

package model.dao;

import java.sql.ResultSet;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;



public class DemonstrativoDAO {
	public synchronized static ResultSet gerarDemonstrativo(){
		Conexao con = null;

		try{
			con = Conexao.getInstancia();
			con.iniciaBD();
			Connection c = con.getConexao();
			PreparedStatement ps = (PreparedStatement) c.prepareStatement("SELECT*FROM relatorio_um"); //Usa uma view criada no banco
			ResultSet res = (ResultSet)ps.executeQuery();
			return res;
		}
		catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
}

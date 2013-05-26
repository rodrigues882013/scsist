package model.dao;

import java.sql.ResultSet;

import model.objects.Demonstrativo;

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
	public synchronized static boolean insert(Demonstrativo d){
		try{
			return true;
		}
		catch (Exception e){
			throw e;
		}
	}
	public synchronized static boolean update(Demonstrativo d){return true;}
	public synchronized static ResultSet gerarControleDeUsuariosPorSala(){
		Conexao con = null;

		try{
			con = Conexao.getInstancia();
			con.iniciaBD();
			Connection c = con.getConexao();
			PreparedStatement ps = (PreparedStatement) c.prepareStatement("SELECT*FROM relatorio_dois"); //Usa uma view criada no banco
			ResultSet res = (ResultSet)ps.executeQuery();
			return res;
		}
		catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
}

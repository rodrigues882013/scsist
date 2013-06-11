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
	public synchronized static boolean insert(Demonstrativo d) throws Exception{
		Conexao con = Conexao.getInstancia();
		Connection c = null;
		try{
			con.iniciaBD();	
			c = con.getConexao();
			c.setAutoCommit(false); 
			PreparedStatement ps = (PreparedStatement) c.prepareStatement("INSERT INTO demonstrativo (tempoInicio,  id_dispositivo, id_sala) VALUE (?, ?, ?)");
			ps.setString(1, d.getTempoInicio());
			int idDispos = DispositivoDAO.getId(d.getDipositivo().getNumero(), d.getSala().getNumero());
			ps.setInt(2, idDispos);
			int sala = SalaDAO.getID(d.getSala().getNumero());
			ps.setInt(3, sala);
			
			ps.executeUpdate();
			c.commit();
			ps.close();
			c.close();
			
			return true;
		}
		catch (Exception e){
			c.rollback();
			throw e;
		}
	}
	public synchronized static boolean update(Demonstrativo d) throws Exception{
		Conexao con = Conexao.getInstancia();
		Connection c = null;
		try{
			con.iniciaBD();	
			c = con.getConexao();
			c.setAutoCommit(false); 
			PreparedStatement ps = (PreparedStatement) c.prepareStatement("UPDATE demonstrativo SET tempoFim=? WHERE id_sala=?");
			ps.setString(1, d.getTempoFim());
			int sala = SalaDAO.getID(d.getSala().getNumero());
			ps.setInt(2, sala);
			
			ps.executeUpdate();
			c.commit();
			ps.close();
			c.close();
			
			return true;
		}
		catch (Exception e){
			c.rollback();
			throw e;
		}
	}
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

package model.dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import model.objects.Nivel;
import model.objects.Sala;
import model.objects.Usuario;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;



public class SalaDAO {
	public synchronized  static boolean insert(Sala S){return true;}
	public synchronized  static boolean delete(Sala S){return true;}
	public synchronized  static boolean update(Sala S) throws Exception{
		Conexao con = null;
		Usuario u;
		try{
			con = Conexao.getInstancia();
			con.iniciaBD();
			Connection c = con.getConexao();
			PreparedStatement ps = (PreparedStatement) c.prepareStatement("UPDATE sala SET numero=?, ip=?, mac=?, id_usuario=? WHERE numero=?"); 
			ps.setInt(1, S.getNumero());
			ps.setString(2, S.getIp());
			ps.setString(3, S.getMac());
			//<-----------------------------------------------Recuperando dados do usuario --------------------------------------->
			PreparedStatement ps2 = (PreparedStatement) c.prepareStatement("SELECT*FROM usuario WHERE login=?"); 
			ps2.setString(1, S.getUsuario().getLogin());
			ResultSet res = (ResultSet) ps2.executeQuery();
			res.next();
			u = new Usuario();
			u.setLogin((String)res.getString("login"));
			u.setNome((String)res.getString("nome"));
			//<------Define os niveis de permissao--------->
			int numNivel = (int)res.getInt("nivel");
			if(numNivel == 1)u.setNivel(Nivel.GESTOR);
			if(numNivel == 2)u.setNivel(Nivel.SUPERVISOR);
			if(numNivel == 3)u.setNivel(Nivel.PROFESSOR);
			//<------------------------------------------->
			u.setSenha((String)res.getString("senha"));
			//<------------------------------------------------------------------------------------------------------------------->
			ps.setString(4, S.getUsuario().getLogin());
			ps.setInt(5, S.getNumero());
			ps.executeUpdate();
			ps.close();
			c.close();

			return true;
		}
		catch(Exception e){
			e.printStackTrace();
			throw e;
			//return false;
		}
		finally{
			con.fechaBd();
		}
	}
	public synchronized static ArrayList<Sala> selectAll() throws Exception {
		Conexao con = null;
		Sala s;
		ArrayList<Sala> salas = new ArrayList<Sala>();
		try{
			con = Conexao.getInstancia();
			con.iniciaBD();
			Connection c = con.getConexao();
			PreparedStatement ps = (PreparedStatement) c.prepareStatement("SELECT*FROM sala");
			ResultSet res = (ResultSet)ps.executeQuery();
			while(res.next()){
				s = new Sala();
				s.setNumero(res.getInt("numero"));
				s.setIp(res.getString("ip"));
				s.setMac(res.getString("mac"));
				//s.setUsuario(UsuarioDAO.selectById(res.getString("id_usuario")));
				s.setDispositivos(DispositivoDAO.selectBySala(s.getNumero()));
				salas.add(s);
			}
			ps.close();
			c.close();
			con.fechaBd();
			return salas;
		}
		catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	public synchronized static Sala selectByID(int sala) throws Exception{
		Conexao con = null;
		Sala s;
		try{
			con = Conexao.getInstancia();
			con.iniciaBD();
			Connection c = con.getConexao();
			PreparedStatement ps = (PreparedStatement) c.prepareStatement("SELECT*FROM sala WHERE id=?");
			ps.setInt(1, sala);
			ResultSet res = (ResultSet)ps.executeQuery();
			res.next();
			s = new Sala();
			s.setNumero(res.getInt("numero"));
			s.setIp(res.getString("ip"));
			s.setMac(res.getString("mac"));
			s.setUsuario(UsuarioDAO.selectById(res.getString("id_usuario")));
			s.setDispositivos(DispositivoDAO.selectBySala(sala));
			return s;
		}
		catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
}

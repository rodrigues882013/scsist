package model.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import model.objects.Nivel;
import model.objects.Usuario;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;


public class UsuarioDAO {
	public synchronized static boolean insert(Usuario u){
		Conexao con = null;
		
		try{
			con = Conexao.getInstancia();
			con.iniciaBD();
			Connection c = con.getConexao();
			PreparedStatement ps = (PreparedStatement) c.prepareStatement("INSERT INTO usuario (login, senha, nome, tipo) VALUES " + "(?,?,?,?)"); 
			ps.setString(1, u.getLogin());
			ps.setString(2, u.getSenha());
			ps.setString(2, u.getNome());
			ps.setString(4, u.getNivel());
			ps.executeUpdate();
			ps.close();
			c.close();
			
			return true;
		}
		catch(Exception e){
			e.printStackTrace();
			return false;
		}
		finally{
			con.fechaBd();
		}
	}
	public synchronized static boolean delete(Usuario u){
		Conexao con = null;
		try{
			con = Conexao.getInstancia();
			con.iniciaBD();
			Connection c = con.getConexao();
			PreparedStatement ps = (PreparedStatement) c.prepareStatement("DELETE usuario WHERE login= " + "(?)"); 
			ps.setString(1, u.getLogin());
			ps.close();
			c.close();
			
			return true;
		}
		catch(Exception e){
			e.printStackTrace();
			return false;
		}
		finally{
			con.fechaBd();
		}
		
	}
	public synchronized static boolean update(Usuario u, String login){
		Conexao con = null;
		try{
			con = Conexao.getInstancia();
			con.iniciaBD();
			Connection c = con.getConexao();
			PreparedStatement ps = (PreparedStatement) c.prepareStatement("UPDATE usuario SET (senha=?, nome=?, tipo=?) WHERE login=?"); 
			ps.setString(1, u.getSenha());
			ps.setString(2, u.getNome());
			if(u.getNivel().toString().compareTo("GESTOR")==0)ps.setInt(3, 1);
			if(u.getNivel().toString().compareTo("SUPERVISOR")==0)ps.setInt(3, 2);
			if(u.getNivel().toString().compareTo("PROFESSOR")==0)ps.setInt(3, 3);
			ps.setString(4, u.getLogin());
			ps.executeUpdate();
			ps.close();
			c.close();

			return true;
		}
		catch(Exception e){
			e.printStackTrace();
			return false;
		}
		finally{
			con.fechaBd();
		}
	}
	public synchronized static ArrayList<Usuario> selectAll(){
		Conexao con = null;
		ArrayList<Usuario> usuarios = null;
		try{
			usuarios = new ArrayList<Usuario>();
			con = Conexao.getInstancia();
			con.iniciaBD();
			Connection c = con.getConexao();
			PreparedStatement ps = (PreparedStatement) c.prepareStatement("SELECT*FROM usuario");
			ResultSet res = (ResultSet) ps.executeQuery();
			while (res.next()){
				Usuario u = new Usuario();
				u.setLogin((String)res.getString("login"));
				u.setNome((String)res.getString("nome"));
				//<------Define os nivel de permissao--------->
				int numNivel = (int)res.getInt("nivel");
				if(numNivel == 1)u.setNivel(Nivel.GESTOR);
				if(numNivel == 2)u.setNivel(Nivel.SUPERVISOR);
				if(numNivel == 3)u.setNivel(Nivel.PROFESSOR);
				//<------------------------------------------->
				u.setSenha((String)res.getString("senha"));
				usuarios.add(u);
			}
			ps.close();
			c.close();
			return usuarios;
			
		}
		catch(Exception e){
			e.printStackTrace();
			return usuarios;
		}
		finally{
			con.fechaBd();
		}
	}
	public synchronized static Usuario validarLogin(String login, String senha){
		Conexao con = null;
		Usuario u;
		
		try{
			con = Conexao.getInstancia();
			con.iniciaBD();
			Connection c = con.getConexao();
			PreparedStatement ps = (PreparedStatement) c.prepareStatement("SELECT*FROM usuario where login=? AND senha=?");
			ps.setString(1, login);
			ps.setString(2, senha);
			ResultSet res = (ResultSet) ps.executeQuery();
			res.next();
			u = new Usuario();
			u.setLogin((String)res.getString("login"));
			u.setNome((String)res.getString("nome"));
			//<------Define os nivel de permissao--------->
			int numNivel = (int)res.getInt("nivel");
			if(numNivel == 1)u.setNivel(Nivel.GESTOR);
			if(numNivel == 2)u.setNivel(Nivel.SUPERVISOR);
			if(numNivel == 3)u.setNivel(Nivel.PROFESSOR);
			//<------------------------------------------->
			u.setSenha((String)res.getString("senha"));
			ps.close();
			c.close();
			
			return u;
			
		}
		catch(Exception e){
			e.printStackTrace();
			return null;
		}
		finally{
			con.fechaBd();
		}
	}
}

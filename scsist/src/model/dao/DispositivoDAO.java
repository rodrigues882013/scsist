package model.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import model.objects.Dispositivo;
import model.objects.Estado;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class DispositivoDAO {
	public synchronized static ArrayList<Dispositivo> selectBySala (int num) throws Exception{
		Conexao con = null;
		ArrayList<Dispositivo> d;
		try{
			con = Conexao.getInstancia();
			con.iniciaBD();
			Connection c = con.getConexao();
			PreparedStatement ps = (PreparedStatement) c.prepareStatement("SELECT*FROM demonstrativo WHERE id_sala=? GROUP BY id_dispositivo");
			ps.setInt(1, num);
			ResultSet res = (ResultSet) ps.executeQuery();
			d = new ArrayList<Dispositivo>();
			//res.next();
			while(res.next()){
				d.add(DispositivoDAO.selectById((res.getInt("id_dispositivo"))));
			}
			ps.close();
			c.close();

			return d;
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
	public synchronized static boolean updateGroup (ArrayList<String> identificador, ArrayList<String> estado) throws Exception{
		Conexao con = null;

		try{
			con = Conexao.getInstancia();
			con.iniciaBD();
			Connection c = con.getConexao();
			Iterator<String> itId = identificador.iterator();
			Iterator<String> itEst = estado.iterator();
			PreparedStatement ps = null;
			
			//Percorre ambos juntos
			while(itId.hasNext() && itEst.hasNext()){
				String id = (String)itId.next();
				String est = (String)itEst.next();
				ps = (PreparedStatement) c.prepareStatement("UPDATE dispositivo SET (estado=?) WHERE identificador=?"); 
				ps.setInt(1, Integer.parseInt(est));
				ps.setInt(2, Integer.parseInt(id));
				ps.executeUpdate();
			}
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
	public synchronized static ArrayList<Dispositivo> selectAll (){return null;}
	public synchronized static boolean update (String identificador, String estado) throws Exception{
		Conexao con = null;

		try{
			con = Conexao.getInstancia();
			con.iniciaBD();
			Connection c = con.getConexao();
			PreparedStatement ps = (PreparedStatement) c.prepareStatement("UPDATE dispositivo SET estado=? WHERE indentificador=?"); 
			ps.setInt(1, Integer.parseInt(identificador));
			if (estado.compareTo("DESLIGADO") == 0) ps.setInt(2, 1);
			if (estado.compareTo("LIGADO") == 0) ps.setInt(2, 0);
			
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
	public synchronized static Dispositivo selectById(int id) throws Exception{
		Conexao con = null;
		Dispositivo d;
		try{
			con = Conexao.getInstancia();
			con.iniciaBD();
			Connection c = con.getConexao();
			PreparedStatement ps = (PreparedStatement) c.prepareStatement("SELECT*FROM dispositivo WHERE id=?");
			ps.setInt(1, id);
			ResultSet res = (ResultSet) ps.executeQuery();
			d = new Dispositivo();
			res.next();
			int aux = (int)res.getInt("estado");
			if (aux == 1)d.setEstado(Estado.LIGADO);
			if (aux == 0)d.setEstado(Estado.DESLIGADO);
			if (aux == -1)d.setEstado(Estado.INATIVO);
			d.setNumero(res.getInt("indentificador"));
			d.setPotencia(res.getFloat("potencia"));
			ps.close();
			c.close();
			return d;			
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
	public synchronized static HashMap<Integer, String> listaTipos() throws Exception{
		Conexao con = null;
		HashMap<Integer, String> m = new HashMap<Integer, String>();
		try{
			con = Conexao.getInstancia();
			con.iniciaBD();
			Connection c = con.getConexao();
			PreparedStatement ps = (PreparedStatement)  c.prepareStatement("SELECT*FROM tipos"); 
			ResultSet res = (ResultSet)ps.executeQuery();
			
			
			while(res.next()){
				int id = res.getInt("id");
				String tipo = res.getString("tipo");
				m.put(id, tipo);
			}
			ps.close();
			c.close();

			return m;
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

	
}

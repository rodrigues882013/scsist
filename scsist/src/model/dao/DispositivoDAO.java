package model.dao;

import java.util.ArrayList;
import java.util.Iterator;

import model.objects.Dispositivo;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class DispositivoDAO {
	public synchronized static ArrayList<Dispositivo> selectBySala (int num){return null;}
	public synchronized static boolean updateGroup (ArrayList<String> identificador, ArrayList<String> estado){
		Conexao con = null;

		try{
			con = Conexao.getInstancia();
			con.iniciaBD();
			Connection c = con.getConexao();
			Iterator itId = identificador.iterator();
			Iterator itEst = estado.iterator();
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
			return false;
		}
		finally{
			con.fechaBd();
		}
	}

	public synchronized static ArrayList<Dispositivo> selectAll (){return null;}
	public synchronized static boolean update (String identificador, String estado){
		Conexao con = null;

		try{
			con = Conexao.getInstancia();
			con.iniciaBD();
			Connection c = con.getConexao();
			PreparedStatement ps = (PreparedStatement) c.prepareStatement("UPDATE dispositivo SET (estado=?) WHERE identificador=?"); 
			ps.setInt(1, Integer.parseInt(identificador));
			ps.setInt(2, Integer.parseInt(estado));
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

}

package model.dao;

import java.util.ArrayList;

import model.objects.Sala;



public class SalaDAO {
	public synchronized  static boolean insert(Sala S){return true;}
	public synchronized  static boolean delete(Sala S){return true;}
	public synchronized  static boolean update(Sala S){return true;}
	public synchronized static ArrayList<Sala> selectAll() {return null;}
	public synchronized static Sala selectByID(int sala){return null;}
}

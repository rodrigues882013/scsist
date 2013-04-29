package model.objects;

import java.util.ArrayList;

public class Sala {
	private Integer numero;
	private String ip;
	private ArrayList<Dispositivo> dispositivos;
	private ArrayList<Usuario> usuarios;
	
	
	
	public Sala() {
		
	}
	public ArrayList<Usuario> getUsuarios() {
		return usuarios;
	}
	public void setUsuarios(ArrayList<Usuario> usuarios) {
		this.usuarios = usuarios;
	}
	public Integer getNumero() {
		return numero;
	}
	public void setNumero(Integer numero) {
		this.numero = numero;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public ArrayList<Dispositivo> getDispositivos() {
		return dispositivos;
	}
	public void setDispositivos(ArrayList<Dispositivo> dispositivos) {
		this.dispositivos = dispositivos;
	}
	
	
}

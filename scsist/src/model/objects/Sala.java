package model.objects;

import java.util.ArrayList;

public class Sala {
	private Integer numero;
	private String ip;
	private ArrayList<Dispositivo> dispositivos;
	private Usuario usuario;
	private String imagem; //String representando o caminho do arquivo de image
	
	
	public String getImagem() {
		return imagem;
	}
	public void setImagem(String imagem) {
		this.imagem = imagem;
	}
	public Sala() {
		
	}
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
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

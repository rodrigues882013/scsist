package model.objects;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;


public class Demonstrativo {
	private Sala sala;
	private Dispositivo dipositivo;
	private Date tempoDeUso;
	private Usuario usuario;
	private HashMap<Sala, ArrayList<Dispositivo>> salas; //Armazena a sala e os dispositivos da mesma
	
	public HashMap<Sala, ArrayList<Dispositivo>> getSalas() {
		return salas;
	}
	public void setSalas(HashMap<Sala, ArrayList<Dispositivo>> salas) {
		this.salas = salas;
	}
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	public Demonstrativo(){
	
	}
	public Sala getSala() {
		return sala;
	}
	public void setSala(Sala sala) {
		this.sala = sala;
	}
	public Dispositivo getDipositivo() {
		return dipositivo;
	}
	public void setDipositivo(Dispositivo dipositivo) {
		this.dipositivo = dipositivo;
	}
	public Date getTempoDeUso() {
		return tempoDeUso;
	}
	public void setTempoDeUso(Date tempoDeUso) {
		this.tempoDeUso = tempoDeUso;
	}
	
	
	
}

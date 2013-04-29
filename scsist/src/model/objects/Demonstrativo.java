package model.objects;

import java.util.Date;


public class Demonstrativo {
	private Sala sala;
	private Dispositivo dipositivo;
	private Date tempoDeUso;
	
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

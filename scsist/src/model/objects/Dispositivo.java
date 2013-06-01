package model.objects;

public class Dispositivo {
	private Estado estado;
	private Integer numero;
	private Sala sala;
	private double potencia;
	
	public double getPotencia() {
		return potencia;
	}
	public void setPotencia(double potencia) {
		this.potencia = potencia;
	}
	public Dispositivo() {
		
	}
	public Sala getSala() {
		return sala;
	}
	public void setSala(Sala sala) {
		this.sala = sala;
	}
	public Estado getEstado() {
		return estado;
	}
	public void setEstado(){
		if (this.estado.compareTo(Estado.DESLIGADO)==0){
			this.estado = Estado.LIGADO;
		}
		else{
			this.estado = Estado.DESLIGADO;
		}
	}
	public void setEstado(Estado estado) {
		this.estado = estado;
	}
	public Integer getNumero() {
		return numero;
	}
	public void setNumero(Integer numero) {
		this.numero = numero;
	}
	
	
	
}

package model.objects;

public class Demonstrativo {
	private Sala sala;
	private Dispositivo dipositivo;
	private String tempoFim;
	private String tempoInicio;
	private Usuario usuario;
	
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
	public String getTempoFim() {
		return tempoFim;
	}
	public void setTempoFim(String tempoFim) {
		this.tempoFim = tempoFim;
	}
	public String getTempoInicio() {
		return tempoInicio;
	}
	public void setTempoInicio(String tempoInicio) {
		this.tempoInicio = tempoInicio;
	}
}

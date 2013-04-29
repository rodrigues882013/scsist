package model.objects;

import java.util.ArrayList;

public class Usuario {
	private Nivel nivel;
	private String nome;
	private String matricula;
	private String email;
	private Sala sala;
	private ArrayList<Demonstrativo> demonstrativos;
	
	public Usuario() {
	
	}
	public ArrayList<Demonstrativo> getDemonstrativos() {
		return demonstrativos;
	}
	public void setDemonstrativos(ArrayList<Demonstrativo> demonstrativos) {
		this.demonstrativos = demonstrativos;
	}
	public Sala getSala() {
		return sala;
	}
	public void setSala(Sala sala) {
		this.sala = sala;
	}
	public Nivel getNivel() {
		return nivel;
	}
	public void setNivel(Nivel nivel) {
		this.nivel = nivel;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getMatricula() {
		return matricula;
	}
	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
}

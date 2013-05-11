package model.objects;

import java.util.ArrayList;


public class Usuario {
	private Nivel nivel;
	private String nome;
	private String login;
	private String senha;
	private ArrayList<Sala> salas;
	private ArrayList<Demonstrativo> demonstrativos;

	public ArrayList<Sala> getSalas() {
		return salas;
	}
	public void setSalas(ArrayList<Sala> salas) {
		this.salas = salas;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public ArrayList<Demonstrativo> getDemonstrativos() {
		return demonstrativos;
	}
	public void setDemonstrativos(ArrayList<Demonstrativo> demonstrativos) {
		this.demonstrativos = demonstrativos;
	}
	private Usuario usuario;
	
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	public Usuario() {
	
	}
	public String getNivel() {
		return nivel.toString();
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
	public String getEmail() {
		return login;
	}
	public void setEmail(String email) {
		this.login = email;
	}
	
	
	
}

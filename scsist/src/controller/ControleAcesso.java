package controller;

import java.io.IOException;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.DispositivoDAO;
import model.dao.SalaDAO;
import model.dao.UsuarioDAO;
import model.objects.Sala;
import model.objects.Usuario;

/**
 * Servlet implementation class ControleAcesso
 */
public class ControleAcesso extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControleAcesso() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		try{			
			String login = (String)request.getParameter("login");
			String senha = (String)request.getParameter("passwd");
			
			//<----------------A senha original nao pode trafegar pelos servidores, apenas os hash's--------------------->
			MessageDigest algorithm = MessageDigest.getInstance("SHA-256");
			byte messageDigest[] = algorithm.digest(senha.getBytes("UTF-8"));
			StringBuilder hexString = new StringBuilder();
			for (byte b : messageDigest) {
			  hexString.append(String.format("%02X", 0xFF & b));
			}
			String senhaEncriptada = hexString.toString();
			//<----------------A senha original nao pode trafegar pelos servidores, apenas os hash's--------------------->
			System.out.println(senhaEncriptada);
			Usuario usuario = UsuarioDAO.validarLogin(login, senhaEncriptada);
			if( usuario!= null){
				usuario.setSenha(senha);
				switch (usuario.getNivel()){

					case "GESTOR":
						ArrayList<Usuario> usuarios = new ArrayList<Usuario>();
						ArrayList<Sala> salas = new ArrayList<Sala>();
						usuarios = UsuarioDAO.selectAll();
						salas = SalaDAO.selectAll();
						HashMap<Integer, String> dispositivos = DispositivoDAO.listaTipos();
						session.setAttribute("dispositivos", dispositivos);
						session.setAttribute("usuarios", usuarios);
						session.setAttribute("salas", salas);
						session.setAttribute("usuario", usuario);
						response.sendRedirect("pages/gestor/index2.jsp");
						break;

					case "SUPERVISOR":
						session.setAttribute("usuario", usuario);
						response.sendRedirect("pages/supervisor/index.jsp");
						break;

					default:
						String num = (String)request.getParameter("sala");
						Sala sala = SalaDAO.selectByID(Integer.parseInt(num));
						session.setAttribute("usuario", usuario);
						session.setAttribute("sala", sala);
						response.sendRedirect("pages/professor/");
						break;
					}
			}
		}
		catch (java.sql.SQLException e){
			session.setAttribute("erro", "Usuario não cadastrado ou senha incorreta, contacte o suporte/gestor");
			response.sendRedirect("index.jsp");
			e.printStackTrace();
		}
		catch (Exception e){
			session.setAttribute("erro", "Usuario");
			response.sendRedirect("index.jsp");
			e.printStackTrace();
		}
	}

}

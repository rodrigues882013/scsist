package controller;

import java.io.IOException;
import java.security.MessageDigest;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.UsuarioDAO;
import model.objects.Nivel;
import model.objects.Usuario;

/**
 * Servlet implementation class CadastraUsuario
 */
public class CadastraUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CadastraUsuario() {
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
		try{
			HttpSession session = request.getSession();
			
			//Recuperando as paginas passadas via request
			String nome = (String)request.getParameter("nome");
			String login = (String)request.getParameter("login");
			String senha = (String)request.getParameter("senha");
			
			//<----------Encriptando a senha que sera guardada no banco de dados-------------------->
			MessageDigest algorithm = MessageDigest.getInstance("SHA-256");
			byte messageDigest[] = algorithm.digest(senha.getBytes("UTF-8"));
			StringBuilder hexString = new StringBuilder();
			for (byte b : messageDigest) {
			  hexString.append(String.format("%02X", 0xFF & b));
			}
			String senhaEncriptada = hexString.toString();
			//<----------------------------------------------------------------------------------------------------------->
			String nivel = (String)request.getParameter("nivel");
			
			//Instanciando o usuario a ser inserido
			Usuario usuario = new Usuario();
			usuario.setNome(nome);
			usuario.setEmail(login);
			usuario.setSenha(senhaEncriptada);
			usuario.setDemonstrativos(null);
			usuario.setSalas(null);
			
			switch (nivel){
				case "1":
					usuario.setNivel(Nivel.GESTOR);
					break;
				
				case "2":
					usuario.setNivel(Nivel.SUPERVISOR);
					break;
				
				default:
					usuario.setNivel(Nivel.PROFESSOR);
					break;
			}
			if(UsuarioDAO.insert(usuario)){
				
				//Apos inserir, consulta novamente e envia para a pagina.
				ArrayList<Usuario> usuarios = new ArrayList<Usuario>();
				usuarios = UsuarioDAO.selectAll();
				session.setAttribute("usuarios", usuarios);
				response.sendRedirect("pages/gestor/usuarios.jsp");
			}
			else{
				
				//Insercao falhou
				session.setAttribute("resultado", "Usuario nao inserido, tente novamente");
				response.sendRedirect("/pages/gestor/");
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

}

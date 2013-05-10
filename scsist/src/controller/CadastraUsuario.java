package controller;

import java.io.IOException;
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
			String nivel = (String)request.getParameter("nivel");
			//Instanciando o usuario a ser inserido
			Usuario usuario = new Usuario();
			usuario.setNome(nome);
			usuario.setEmail(login);
			usuario.setSenha(senha);
			
			switch (nivel){
				case "GESTOR":
					usuario.setNivel(Nivel.GESTOR);
					break;
				
				case "SUPERVISOR":
					usuario.setNivel(Nivel.SUPERVISOR);
					break;
				
				default:
					usuario.setNivel(Nivel.PROFESSOR);
					break;
			}
			if(UsuarioDAO.insert(usuario)){
				//Após inserir, consulta novamente e envia para a pagina.
				ArrayList<Usuario> listaDeUsuarios = UsuarioDAO.selectAll();
				session.setAttribute("resultado", listaDeUsuarios);
				response.sendRedirect("/pages/gestor.jsp");
			}
			else{
				//Inserção falhou
				session.setAttribute("resultado", "Usuário não inserido, tente novamente");
				response.sendRedirect("/pages/gestor.jsp");
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

}

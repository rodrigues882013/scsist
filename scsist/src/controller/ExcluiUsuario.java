package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.UsuarioDAO;
import model.objects.Usuario;

/**
 * Servlet implementation class ExcluiUsuario
 */
public class ExcluiUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExcluiUsuario() {
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
			
			String login = (String)request.getParameter("login"); //Login e a chave primaria a nivel de sistema
			
			//Instanciando o usuario a ser excluido
			Usuario usuario = UsuarioDAO.selectById(login);
			if(UsuarioDAO.delete(usuario)){	
				//Apos excluir, consulta novamente e envia para a pagina.
				ArrayList<Usuario> usuarios = UsuarioDAO.selectAll();
				session.setAttribute("usuarios", usuarios);
				response.sendRedirect("pages/gestor/usuarios.jsp");
			}
			else{
			
				//Exclusao falhou
				System.out.println("Falhei");
				session.setAttribute("resultado", "Usuario nao excluido, tente novamente");
				response.sendRedirect("/pages/gestor.jsp");
			}
		}
		catch (Exception e){
			e.printStackTrace();
		}
	}

}

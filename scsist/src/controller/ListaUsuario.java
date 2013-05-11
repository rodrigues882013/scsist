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
 * Servlet implementation class ListaUsuario
 */
public class ListaUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListaUsuario() {
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
			ArrayList<Usuario> listaDeUsuarios = UsuarioDAO.selectAll();
			if(listaDeUsuarios != null){
				session.setAttribute("resultado", listaDeUsuarios);
				response.sendRedirect("/pages/gestor.jsp");
			}
			else{
				session.setAttribute("resultado", "Falha ao buscar registros, atualize e tente novamente");
				response.sendRedirect("/pages/gestor.jsp");
			}
		}
		catch (Exception e){
			e.printStackTrace();
		}
	}

}

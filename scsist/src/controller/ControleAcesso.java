package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		try{
			HttpSession session = request.getSession();
			String login = (String)request.getParameter("login");
			String senha = (String)request.getParameter("passwd");
			System.out.println("Testando commit");
			Usuario usuario = UsuarioDAO.validarLogin(login, senha);
			if( usuario!= null){
				switch (usuario.getNivel()){

					case "GESTOR":
						session.setAttribute("usuario", usuario);
						response.sendRedirect("/pages/gestor.jsp");
						break;

					case "SUPERVISOR":
						session.setAttribute("usuario", usuario);
						response.sendRedirect("/pages/supervisor.jsp");
						break;

					default:
						String num = (String)request.getParameter("sala");
						Sala sala = SalaDAO.selectByID(Integer.parseInt(num));
						session.setAttribute("usuario", usuario);
						session.setAttribute("sala", sala);
						response.sendRedirect("/pages/professor.jsp");
						break;
					}
			}
		}
		catch (Exception e){
			e.printStackTrace();
		}
	}

}

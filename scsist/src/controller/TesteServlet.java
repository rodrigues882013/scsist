package controller;

import java.io.IOException;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

/**
 * Servlet implementation class TesteServlet
 */
public class TesteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TesteServlet() {
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
		// TODO Auto-generated method stub
				HttpSession session = request.getSession();
				Random r = new Random();
				Integer i = r.nextInt(2);
				String estado = i.toString();
				System.out.println(estado);
				try{
					
					String numSala = (String) request.getParameter("id"); //Numero da Sala
					//String estado= (String) request.getParameter("estado"); //
					//String idUsuario = (String) request.getParameter("usuario"); //Login
					String grupo = (String) request.getParameter("grupo"); //Frente, atras e meio
					String json = new Gson().toJson(estado);
					response.setContentType("application/json"); 
					response.setCharacterEncoding("utf-8"); 
					response.getWriter().write(json);
					
				}
				catch(Exception e){
					e.printStackTrace();
				}
	}

}

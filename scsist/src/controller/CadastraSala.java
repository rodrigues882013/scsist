package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CadastraSala
 */
public class CadastraSala extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CadastraSala() {
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
			String ip = (String) request.getParameter("ip");
			String mac = (String) request.getParameter("mac");
			int numero = Integer.parseInt((String) request.getParameter("numero"));
			int ilumincao = Integer.parseInt((String)request.getParameter("qtdIlum"));
			int ar = Integer.parseInt((String)request.getParameter("qtdAr"));
			int datashow = Integer.parseInt((String)request.getParameter("DATASHOW"));
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

}

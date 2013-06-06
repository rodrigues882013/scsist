package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.DispositivoDAO;

import communication.Client;

/**
 * Servlet implementation class ChangeState
 */
public class ChangeState extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeState() {
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
			String a = (String) request.getParameter("id");
			String b = (String) request.getParameter("state");
			
			//ArrayList<String> estados = new ArrayList<String>();
			//ArrayList<String> id = new ArrayList<String>();
			
			if (DispositivoDAO.update(a,b)){
				Client client = Client.getClient();
				//Integer state = client.changeState(b);
				//client.closeClient();
				//System.out.println(state);
				//session.setAttribute("state", state);
				response.sendRedirect("index.jsp");
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

}

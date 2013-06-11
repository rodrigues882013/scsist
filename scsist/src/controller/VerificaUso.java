package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.SalaDAO;

import com.google.gson.Gson;

/**
 * Servlet implementation class ChecarUso
 */
public class VerificaUso extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerificaUso() {
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
		String sala = request.getParameter("sala");
		try{
			if (SalaDAO.getUso(Integer.parseInt(sala))){
				//Envia a resposta via json para a pagina que requisitou
				String json = new Gson().toJson("BLOQUEADO");
				response.setContentType("application/json"); 
				response.setCharacterEncoding("utf-8"); 
				response.getWriter().write(json);			
			}
			else{
				String json = new Gson().toJson("LIBERADO");
				response.setContentType("application/json"); 
				response.setCharacterEncoding("utf-8"); 
				response.getWriter().write(json);	
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

}

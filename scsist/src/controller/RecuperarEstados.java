/**********************************************************************************************************
* Esse modulo sera um modulo de configuracao que devera ser rodado na primeira execucao do sistem         *
* que será explicado no diagrama de implantacao que visa passar o estado inicial de todos os equipamentos *
* 																										  *
***********************************************************************************************************/

package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import communication.ArduinoCOM;

import model.dao.SalaDAO;
import model.objects.Sala;

/**
 * Servlet implementation class RecuperarEstados
 */
public class RecuperarEstados extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecuperarEstados() {
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
			ArrayList<Sala> salas = SalaDAO.selectAll();
			for (int i=0; i < salas.size(); i++){
				ArduinoCOM client = ArduinoCOM.getClient(salas.get(i).getIp());
				
			}
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

}

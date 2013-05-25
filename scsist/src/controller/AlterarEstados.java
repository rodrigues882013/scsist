package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.DispositivoDAO;
import model.dao.SalaDAO;
import model.objects.Sala;
import model.objects.Usuario;

import communication.Client;

/**
 * Servlet implementation class AlterarEstados
 */
public class AlterarEstados extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlterarEstados() {
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
		try{
			HttpSession session = request.getSession();
			String numSala = (String) request.getParameter("id"); //Numero da Sala
			String estado= (String) request.getParameter("estado");
			String NomeUsuario = (String) request.getParameter("usuario");
			String grupo = (String) request.getParameter("grupo"); //Frente, atras e meio
			
			Sala sala = SalaDAO.selectByID(Integer.parseInt(numSala));
			//Usuario u = UsuarioDAO.selectByName();
			
			sala.setUsuario(new Usuario());
			
			if (grupo.compareTo("Frente") == 0){
				for (int i=0; i<2; i++){
					sala.getDispositivos().get(i).setEstado();
					if (DispositivoDAO.update(sala.getDispositivos().get(i).getNumero().toString(), sala.getDispositivos().get(i).getEstado().toString())){
						Client client = Client.getClient();
						Integer state = client.changeState(estado);
						//client.closeClient();
						//System.out.println(state);
						session.setAttribute("state", state);
						response.sendRedirect("index.jsp");
					}
				}
			}
			else{
				if (grupo.compareTo("Meio") == 0){
					for (int i=2; i<5; i++){
						sala.getDispositivos().get(i).setEstado();
						if (DispositivoDAO.update(sala.getDispositivos().get(i).getNumero().toString(), sala.getDispositivos().get(i).getEstado().toString())){
							Client client = Client.getClient();
							Integer state = client.changeState(estado);
							//client.closeClient();
							//System.out.println(state);
							session.setAttribute("state", state);
							response.sendRedirect("index.jsp");
						}
					}
				}
				else{
					for (int i=5; i<7; i++){
						sala.getDispositivos().get(i).setEstado();
						if (DispositivoDAO.update(sala.getDispositivos().get(i).getNumero().toString(), sala.getDispositivos().get(i).getEstado().toString())){
							Client client = Client.getClient();
							Integer state = client.changeState(estado);
							//client.closeClient();
							//System.out.println(state);
							session.setAttribute("state", state);
							response.sendRedirect("index.jsp");
						}
					}
				}
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

}

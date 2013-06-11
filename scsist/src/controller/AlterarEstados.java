package controller;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.DemonstrativoDAO;
import model.dao.DispositivoDAO;
import model.dao.SalaDAO;
import model.dao.UsuarioDAO;
import model.objects.Demonstrativo;
import model.objects.Sala;
import model.objects.Usuario;

import com.google.gson.Gson;
import communication.Client;
import communication.ArduinoCOM;

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
		HttpSession session = request.getSession();
		try{
			
			String numSala = (String) request.getParameter("sala"); //Numero da Sala
			String estado = (String) request.getParameter("estado"); //
			String idUsuario = (String) request.getParameter("login"); //Login
			String grupo = (String) request.getParameter("grupo"); //Frente, atras e meio
			
			//Recupera a sala, bem como o ultimo usuario que a controlou
			Sala sala = SalaDAO.selectByID(Integer.parseInt(numSala));
			//Recupera o usuario que controlara a sala nesse momento e o define no banco
			Usuario u = UsuarioDAO.selectById(idUsuario);
			sala.setUsuario(u);
			SalaDAO.update(sala);
			boolean condicao = true;
			
			if (grupo.compareTo("3") == 0){ //Parte da frente da iluminação
				ArduinoCOM client = ArduinoCOM.getClient(sala.getIp());
				for (int i=0; i<3; i++){
					if (i < sala.getDispositivos().size()){ //Checa se ha pelo menos um dispositivo
						sala.getDispositivos().get(i).setEstado(); //Altera o estado na aplicação
						Demonstrativo d = new Demonstrativo();
						d.setSala(sala);
						d.setDipositivo(sala.getDispositivos().get(i));
						d.setUsuario(u);
						if(sala.getDispositivos().get(i).getEstado().toString().compareTo("LIGADO") == 0){
							d.setTempoInicio(new Timestamp(System.currentTimeMillis()).toString());
							condicao = DemonstrativoDAO.insert(d);
						}
						else{
							if(sala.getDispositivos().get(i).getEstado().toString().compareTo("DESLIGADO") == 0){
								d.setTempoFim(new Timestamp(System.currentTimeMillis()).toString());
								condicao = DemonstrativoDAO.update(d);
							}
						} //------------------------Testes---------------------------------------------------
						DispositivoDAO.update(sala.getDispositivos().get(i).getNumero().toString(), sala.getDispositivos().get(i).getEstado().toString());
					}
				}
				
				//Vai passar o estao do grupo
				Integer state = client.changeState(estado, grupo); //Passa o estado para o o communication.Client alterar o estado
				//System.out.println(state);
				if (state == 1)estado = "LIGADO";
				if (state == 0)estado = "DESLIGADO";
				if (state == -1)estado = "FALHA";
				
				client.close();
						//Envia a resposta via json para a pagina que requisitou
				String json = new Gson().toJson(estado);
				response.setContentType("application/json"); 
				response.setCharacterEncoding("utf-8"); 
				response.getWriter().write(json);
							//session.setAttribute("state", estado);
							//response.sendRedirect("index.jsp");				
			}
			else{
				if (grupo.compareTo("6") == 0){ //Parte do Meio
					ArduinoCOM client = ArduinoCOM.getClient(sala.getIp());
					for (int i=3; i<6; i++){
						if (i < sala.getDispositivos().size()){ //Checa se ha pelo menos um dispositivo
							sala.getDispositivos().get(i).setEstado(); //Altera o estado na aplicação
							Demonstrativo d = new Demonstrativo();
							d.setSala(sala);
							d.setDipositivo(sala.getDispositivos().get(i));
							d.setUsuario(u);
							if(sala.getDispositivos().get(i).getEstado().toString().compareTo("LIGADO") == 0){
								d.setTempoInicio(new Timestamp(System.currentTimeMillis()).toString());
								condicao = DemonstrativoDAO.insert(d);
							}
							else{
								if(sala.getDispositivos().get(i).getEstado().toString().compareTo("DESLIGADO") == 0){
									d.setTempoFim(new Timestamp(System.currentTimeMillis()).toString());
									condicao = DemonstrativoDAO.update(d);
								}
							}
							DispositivoDAO.update(sala.getDispositivos().get(i).getNumero().toString(), sala.getDispositivos().get(i).getEstado().toString());
						}	
					}
					//Vai passar o estao do grupo
					Integer state = client.changeState(estado, grupo); //Passa o estado para o o communication.Client alterar o estado
					//System.out.println(state);
					if (state == 1)estado = "LIGADO";
					if (state == 0)estado = "DESLIGADO";
					if (state == -1)estado = "FALHA";
								
					client.close();

							//Envia a resposta via json para a pagina que requisitou
					String json = new Gson().toJson(estado);
					response.setContentType("application/json"); 
					response.setCharacterEncoding("utf-8"); 
					response.getWriter().write(json);
								//session.setAttribute("state", estado);
								//response.sendRedirect("index.jsp");
							
						
					
				}
				else{ //Parte de traz
					ArduinoCOM client = ArduinoCOM.getClient(sala.getIp());
					for (int i=6; i<9; i++){
						if (i < sala.getDispositivos().size()){ //Checa se ha pelo menos um dispositivo
							sala.getDispositivos().get(i).setEstado(); //Altera o estado na aplicação
							Demonstrativo d = new Demonstrativo();
							d.setSala(sala);
							d.setDipositivo(sala.getDispositivos().get(i));
							d.setUsuario(u);
							if(sala.getDispositivos().get(i).getEstado().toString().compareTo("LIGADO") == 0){
								d.setTempoInicio(new Timestamp(System.currentTimeMillis()).toString());
								condicao = DemonstrativoDAO.insert(d);
							}
							else{
								if(sala.getDispositivos().get(i).getEstado().toString().compareTo("DESLIGADO") == 0){
									d.setTempoFim(new Timestamp(System.currentTimeMillis()).toString());
									condicao = DemonstrativoDAO.update(d);
								}
							}
							DispositivoDAO.update(sala.getDispositivos().get(i).getNumero().toString(), sala.getDispositivos().get(i).getEstado().toString());
						}
					}
					//Vai passar o estao do grupo
					Integer state = client.changeState(estado, grupo); //Passa o estado para o o communication.Client alterar o estado
					//System.out.println(state);
					if (state == 1)estado = "LIGADO";
					if (state == 0)estado = "DESLIGADO";
					if (state == -1)estado = "FALHA";
								
					client.close();

							//Envia a resposta via json para a pagina que requisitou
					String json = new Gson().toJson(estado);
					response.setContentType("application/json"); 
					response.setCharacterEncoding("utf-8"); 
					response.getWriter().write(json);
								//session.setAttribute("state", estado);
								//response.sendRedirect("index.jsp");
							
						
					
				}
			}
		}
		catch(Exception e){
			e.printStackTrace();
			session.setAttribute("state", "Erro, tente de novo ou contacte a administração");
			response.sendRedirect("index.jsp");
		}
	}

}

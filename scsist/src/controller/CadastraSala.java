package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.SalaDAO;
import model.objects.Dispositivo;
import model.objects.Estado;
import model.objects.Sala;
import model.objects.Tipo;

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
			Integer numero = Integer.parseInt((String) request.getParameter("numero"));
			Integer iluminacao = ((String)request.getParameter("qtdIlum")).compareTo("") == 0 ? 0 : Integer.parseInt((String)request.getParameter("qtdIlum")) ;
			Integer ar = ((String)request.getParameter("qtdAr")).compareTo("") == 0 ? 0 : Integer.parseInt((String)request.getParameter("qtdAr"));
			Integer datashow = ((String)request.getParameter("DATASHOW")) == null ? 0 : 1;
			Double potenciaLuz = (request.getParameter("potenciaLamp")).compareTo("") == 0 ? 0.0 : Double.parseDouble(request.getParameter("potenciaLamp"));
			Double potenciaAr = (request.getParameter("potenciaCond")).compareTo("") == 0 ? 0.0 : Double.parseDouble(request.getParameter("potenciaCond"));
			
			
			int x = iluminacao + ar + datashow;
			Sala sala = new Sala();
			sala.setIp(ip);
			sala.setMac(mac);
			sala.setNumero(numero);
			ArrayList<Dispositivo> ds = new ArrayList<Dispositivo>();
			for(int i=0; i < x; i++){
				//Adicionando dispositivos de ilumicacao
				if (i < iluminacao){
					Dispositivo d = new Dispositivo();
					d.setEstado(Estado.DESLIGADO);
					d.setNumero(i);
					d.setPotencia(potenciaLuz);
					d.setTipo(Tipo.ILUMINACAO);
					ds.add(d);
				}
				else{
					//Adicionando condicionadores de AR
					if(i < (iluminacao+ar)){
						Dispositivo d = new Dispositivo();
						d.setEstado(Estado.DESLIGADO);
						d.setNumero(i);
						d.setPotencia(potenciaAr);
						d.setTipo(Tipo.AR);
						ds.add(d);
					}
					else{
						//Adicionando datashow
						Dispositivo d = new Dispositivo();
						d.setEstado(Estado.DESLIGADO);
						d.setNumero(i);
						d.setTipo(Tipo.DATASHOW);
						d.setPotencia(20.0);
						ds.add(d);
					}
				}
			}
			sala.setDispositivos(ds);
			sala.setImagem("");
			
			if (SalaDAO.insert(sala)){
				ArrayList<Sala> salas = new ArrayList<Sala>();
				salas = SalaDAO.selectAll();
				session.setAttribute("salas", salas);
				response.sendRedirect("pages/gestor/gerenciaSalas.jsp");
			}
			else{
				session.setAttribute("error", "Sala não cadastrada, entre em contato");
				response.sendRedirect("pages/gestor/gerenciaSalas.jsp");
			}
			
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

}

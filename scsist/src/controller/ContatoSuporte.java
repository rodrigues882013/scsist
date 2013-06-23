package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.SimpleEmail;

import com.google.gson.Gson;

/**
 * Servlet implementation class ContatoSuporte
 */
public class ContatoSuporte extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContatoSuporte() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		try{
			String msg = (String) request.getParameter("msg");
			String emails = (String) request.getParameter("email");
			String nome = (String) request.getParameter("nome");
			
			SimpleEmail email = new SimpleEmail();
			//Utilize o hostname do seu provedor de email
			email.setHostName("smtp.gmail.com");
			//Quando a porta utilizada n�o � a padr�o (gmail = 465)
			email.setSmtpPort(465);
			//Adicione os destinat�rios
			email.addTo("rodrigues882007@hotmail.com", "Felipe");
			email.addTo("suporte.sasist@gmail.com", "SASIST");
			//Envia copia  para o remetente
			email.addTo(emails, nome);
			//Configure o seu email do qual enviar�
			email.setFrom("suporte.sasist@gmail.com", "SASIST");
			//Adicione um assunto
			email.setSubject("SASIST[TESTE]");
			//Adicione a mensagem do email
			email.setMsg(msg);
			//Para autenticar no servidor � necess�rio chamar os dois m�todos abaixo
			email.setSSL(true);
			email.setAuthentication("suporte.sasist", "istrio2013");
			email.send();
			//session.setAttribute("aviso", "Mensagem enviada com sucesso, em breve nossa equipe responder� seu chamado");
			String resposta = "Mensagem enviada com sucesso, em breve nossa equipe responder� seu chamado";
			String json = new Gson().toJson(resposta);
			response.setContentType("application/json"); 
			response.setCharacterEncoding("utf-8"); 
			response.getWriter().write(json);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

}

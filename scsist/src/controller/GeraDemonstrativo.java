package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.Conexao;
import model.dao.DemonstrativoDAO;
import model.dao.UsuarioDAO;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRResultSetDataSource;
import net.sf.jasperreports.engine.JasperRunManager;

/**
 * Servlet implementation class GeraDemonstrativo
 */
public class GeraDemonstrativo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GeraDemonstrativo() {
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
		ServletContext context = getServletContext(); 
		String tipo = (String)request.getParameter("demo");
		
		switch(tipo){
			case "1":
				try{  
					Conexao con = Conexao.getInstancia();
					con.iniciaBD();
					
					String sala = request.getParameter("sala");
					Map<String, Object> param = new HashMap<String, Object>(); 
				    param.put("SQL", "SELECT*FROM relatorio_um WHERE Sala = " + Integer.parseInt(sala)); 
					String arquivo = context.getRealPath("/WEB-INF/reports/report4.jasper");
					ServletOutputStream servletOutputStream = response.getOutputStream();
					servletOutputStream = response.getOutputStream();
					byte[] bytes = new byte[0]; 
					bytes = JasperRunManager.runReportToPdf(arquivo, param, con.getConexao());
		            response.setContentType("application/pdf");
		            servletOutputStream.write(bytes);
		            servletOutputStream.flush();
		            servletOutputStream.close();
				}
				catch(Exception e){
					e.printStackTrace();
				}
				break;
				
			case "2":
				try{  
					String arquivo = context.getRealPath("/WEB-INF/reports/usuarios_salas.jasper");
					JRDataSource jrRS = new JRResultSetDataSource(DemonstrativoDAO.gerarControleDeUsuariosPorSala());
					ServletOutputStream servletOutputStream = response.getOutputStream();
					servletOutputStream = response.getOutputStream();
		            JasperRunManager.runReportToPdfStream(new FileInputStream(new File(arquivo)), response.getOutputStream(), null, jrRS);
		            response.setContentType("application/pdf");
		            servletOutputStream.flush();
		            servletOutputStream.close();
				}
				catch(Exception e){
					e.printStackTrace();
				}
				break;
				
			case "3":
				try{  
					Conexao con = Conexao.getInstancia();
					con.iniciaBD();
					
					String sala = request.getParameter("sala");
					String data = request.getParameter("data");
					Map<String, Object> param = new HashMap<String, Object>(); 
				    param.put("SQL", "SELECT*FROM relatorio_dois WHERE Sala = " + Integer.parseInt(sala) + "  AND Dia = '" + data + "'"); 
					String arquivo = context.getRealPath("/WEB-INF/reports/Usuarios.jasper");
					ServletOutputStream servletOutputStream = response.getOutputStream();
					servletOutputStream = response.getOutputStream();
					byte[] bytes = new byte[0]; 
					bytes = JasperRunManager.runReportToPdf(arquivo, param, con.getConexao());
		            response.setContentType("application/pdf");
		            servletOutputStream.write(bytes);
		            servletOutputStream.flush();
		            servletOutputStream.close();
				}
				catch(Exception e){
					e.printStackTrace();
				}
				break;
				
			case "4":
				try{  
					Conexao con = Conexao.getInstancia();
					con.iniciaBD();
					
					String sala = request.getParameter("sala");
					Map<String, Object> param = new HashMap<String, Object>(); 
				    param.put("SQL", "SELECT Mes, Consumo, Sala FROM relatorio_tres WHERE Sala = " + Integer.parseInt(sala)); 
					String arquivo = context.getRealPath("/WEB-INF/reports/report5.jasper");
					ServletOutputStream servletOutputStream = response.getOutputStream();
					servletOutputStream = response.getOutputStream();
					byte[] bytes = new byte[0]; 
					bytes = JasperRunManager.runReportToPdf(arquivo, param, con.getConexao());
		            response.setContentType("application/pdf");
		            servletOutputStream.write(bytes);
		            servletOutputStream.flush();
		            servletOutputStream.close();
				}
				catch(Exception e){
					e.printStackTrace();
				}
				break;
				
			case "5":
				try{  
					String arquivo = context.getRealPath("/WEB-INF/reports/UsuariosCadastrados.jasper");
					JRDataSource jrRS = new JRResultSetDataSource(UsuarioDAO.gerarDemonstrativoUsuarios());
					ServletOutputStream servletOutputStream = response.getOutputStream();
					servletOutputStream = response.getOutputStream();
		            JasperRunManager.runReportToPdfStream(new FileInputStream(new File(arquivo)), response.getOutputStream(), null, jrRS);
		            response.setContentType("application/pdf");
		            servletOutputStream.flush();
		            servletOutputStream.close();
				}
				catch(Exception e){
					e.printStackTrace();
				}
				break;
		}
	}
	
}

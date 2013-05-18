package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.DemonstrativoDAO;
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
		String tipo = (String)request.getParameter("tipo");
		
		switch(tipo){
			case "1":
				try{  
					String arquivo = context.getRealPath("/WEB-INF/reports/report4.jasper");
					JRDataSource jrRS = new JRResultSetDataSource(DemonstrativoDAO.gerarDemonstrativo());
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

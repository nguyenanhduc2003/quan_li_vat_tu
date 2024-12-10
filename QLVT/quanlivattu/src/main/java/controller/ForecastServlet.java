package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ForecastDAO;

/**
 * Servlet implementation class ForecastServlet
 */
@WebServlet("/ForecastServlet")
public class ForecastServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ForecastDAO forecastDAO = new ForecastDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForecastServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=UTF-8");
		        
		        try {
		            int materialId = Integer.parseInt(request.getParameter("materialId"));
		            String type = request.getParameter("type");
		
		            int forecastResult = 0;
		            if ("import".equals(type)) {
		                forecastResult = forecastDAO.forecastImport(materialId);
		            } else if ("export".equals(type)) {
		                forecastResult = forecastDAO.forecastExport(materialId);
		            }
		
		            response.getWriter().write("{\"success\": true, \"forecast\": " + forecastResult + "}");
		        } catch (Exception e) {
		            e.printStackTrace();
		            response.getWriter().write("{\"success\": false}");
		        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

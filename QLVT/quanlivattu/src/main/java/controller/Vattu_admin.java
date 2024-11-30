package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.MaterialDAO;
import model.Material;

/**
 * Servlet implementation class TotalMaterialServlet
 */
@WebServlet("/Vattu_admin")
public class Vattu_admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// Tạo đối tượng MaterialDAO
    private MaterialDAO materialDAO = new MaterialDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Vattu_admin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Lấy tổng số vật tư từ DAO
        int totalMaterials = materialDAO.getTotalMaterials();
        List<Material> materials = materialDAO.getAll();

        // Debug log
        //System.out.println("Total materials: " + totalMaterials);

        // Đưa tổng số vật tư vào request
        request.setAttribute("totalMaterials", totalMaterials);
        request.setAttribute("materials", materials);

        // Chuyển hướng đến trang JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("vattu_admin.jsp");
        dispatcher.forward(request, response); 
	    }
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

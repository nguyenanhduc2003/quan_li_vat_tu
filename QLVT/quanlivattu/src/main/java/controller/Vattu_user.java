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
 * Servlet implementation class Vattu_user
 */
@WebServlet("/Vattu_user")
public class Vattu_user extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MaterialDAO materialDAO = new MaterialDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Vattu_user() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int totalMaterials = materialDAO.getTotalMaterials();
		List<Material> materials = materialDAO.getAll();
		
		request.setAttribute("totalMaterials", totalMaterials);
		request.setAttribute("materials", materials);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("vattu_user.jsp");
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

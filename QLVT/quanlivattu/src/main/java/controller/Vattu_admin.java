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
import model.Account;
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
		
		request.setCharacterEncoding("UTF-8");
		
		 // Lấy dữ liệu từ form
       int materialId = Integer.parseInt(request.getParameter("material_id"));
       String materialName = request.getParameter("material_name");
       String materialUnit = request.getParameter("material_unit");
       String materialDescribe = request.getParameter("material_describe");
       String materialDate = request.getParameter("material_date");
       String materialUse = request.getParameter("material_use");
       String materialExpiry = request.getParameter("material_expiry");
       String materialSupplier = request.getParameter("material_supplier");
       String materialCountry = request.getParameter("material_country");
       String materialValue = request.getParameter("material_value");
       String materialImage = request.getParameter("material_image");

       // Tạo đối tượng Account
       Material material = new Material();
       double convertedValue = Double.parseDouble(materialValue);
       material.setMaterial_id(materialId);
       material.setMaterial_name(materialName);
       material.setMaterial_unit(materialUnit);
       material.setMaterial_describe(materialDescribe);
       material.setMaterial_date(materialDate);
       material.setMaterial_use(materialUse);
       material.setMaterial_expiry(materialExpiry);
       material.setMaterial_supplier(materialSupplier);
       material.setMaterial_country(materialCountry);
       material.setMaterial_value(convertedValue);
       material.setMaterial_image(materialImage);
       
       // Thêm tài khoản vào cơ sở dữ liệu
       boolean isAdded = materialDAO.addMaterial(material);
       
    // Xử lý kết quả
       response.setContentType("text/html");
       if (isAdded) {
           response.getWriter().println("<script>alert('Success!'); window.location.href = 'Vattu_admin';</script>");
       } else {
           response.getWriter().println("<script>alert('Failse! Try again!'); history.back();</script>");
       }
		
	}

}

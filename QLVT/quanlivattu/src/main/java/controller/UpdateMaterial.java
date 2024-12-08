package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.MaterialDAO;
import model.Material;

/**
 * Servlet implementation class UpdateMaterial
 */
@WebServlet("/UpdateMaterial")
public class UpdateMaterial extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MaterialDAO materialDAO = new MaterialDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMaterial() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		try {
		 // Lấy dữ liệu từ form
       int materialId = Integer.parseInt(request.getParameter("material_id1"));
       String materialName = request.getParameter("material_name1");
       String materialDescribe = request.getParameter("material_describe1");
       String materialUnit = request.getParameter("material_unit1");
       String materialDate = request.getParameter("material_date1");
       String materialExpiry = request.getParameter("material_expiry1");
       String materialUse = request.getParameter("material_use1");
       String materialSupplier = request.getParameter("material_supplier1");
       String materialCountry = request.getParameter("material_country1");
       String materialValue = request.getParameter("material_value1");
       String materialImage = request.getParameter("material_image1");
       int materialQuantity = Integer.parseInt(request.getParameter("material_quantity1"));
       

       // Tạo đối tượng Account để cập nhật
       Material material = new Material();
       double convertedValue = Double.parseDouble(materialValue);
       material.setMaterial_id(materialId);
       material.setMaterial_name(materialName);
       material.setMaterial_describe(materialDescribe);
       material.setMaterial_unit(materialUnit);
       material.setMaterial_date(materialDate);
       material.setMaterial_expiry(materialExpiry);
       material.setMaterial_use(materialUse);
       material.setMaterial_supplier(materialSupplier);
       material.setMaterial_country(materialCountry);
       material.setMaterial_value(convertedValue);
       material.setMaterial_image(materialImage);
       material.setMaterial_quantity(materialQuantity);


       // Thực hiện cập nhật
       boolean isUpdated = materialDAO.updateMaterial(material);

       // Xử lý kết quả
       response.setContentType("text/html;charset=UTF-8");
       if (isUpdated) {
       	 response.getWriter().println("<script>alert('Cập nhật thành công!'); window.location.href = 'Vattu_admin';</script>");
       } else {
           response.getWriter().println("<script>alert('Cập nhật thất bại, vui lòng thử lại.'); history.back();</script>");
       }
		 } catch (NumberFormatException | IOException e) {
	            e.printStackTrace();
	            response.setContentType("text/html;charset=UTF-8");
	            response.getWriter().println("<script>alert('Có lỗi xảy ra trong quá trình xử lý dữ liệu. Vui lòng thử lại sau.'); history.back();</script>");
	        }
	}

}

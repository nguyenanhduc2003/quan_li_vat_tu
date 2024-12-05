package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.SupplierDAO;

/**
 * Servlet implementation class DeleteSupplier
 */
@WebServlet("/DeleteSupplier")
public class DeleteSupplier extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SupplierDAO supplierDAO = new SupplierDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteSupplier() {
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
		
		String supplierIdStr = request.getParameter("supplierId");
        try {
            int supplierId = Integer.parseInt(supplierIdStr);
            boolean isDeleted = supplierDAO.deleteSupplier(supplierId);

            if (isDeleted) {
                // Xóa thành công, chuyển hướng lại trang danh sách
                request.setAttribute("message", "Xóa thành công!");
            } else {
                // Xóa thất bại
                request.setAttribute("message", "Xóa thất bại. Vui lòng thử lại sau.");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("message", "Dữ liệu không hợp lệ!");
        }

        
        response.sendRedirect("Cungcap_admin"); 
		
	}

}

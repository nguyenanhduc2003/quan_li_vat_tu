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
            response.setContentType("text/html;charset=UTF-8");

            if (isDeleted) {
            	response.getWriter().println("<script>alert('Xóa thành công!'); window.location.href = 'Cungcap_admin';</script>");
            } else {
            	response.getWriter().println("<script>alert('Xóa thất bại, vui lòng thử lại.'); history.back();</script>");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.setContentType("text/html;charset=UTF-8");
	        response.getWriter().println("<script>alert('Có lỗi xảy ra trong quá trình xử lý dữ liệu. Vui lòng thử lại sau.'); history.back();</script>");
        }	
	}

}

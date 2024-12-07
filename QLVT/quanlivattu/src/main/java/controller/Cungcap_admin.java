package controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.SupplierDAO;
import model.Supplier;

/**
 * Servlet implementation class Cungcap_admin
 */
@WebServlet("/Cungcap_admin")
public class Cungcap_admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private SupplierDAO supplierDAO = new SupplierDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Cungcap_admin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 // Lấy danh sách tài khoản từ cơ sở dữ liệu
	    List<Supplier> suppliers = supplierDAO.getAll();
	    
	 // Lấy tổng số tài khoản từ DAO
        int totalSuppliers = supplierDAO.getTotalSuppliers();
        request.setAttribute("totalSuppliers", totalSuppliers);
	    
	    // Đưa danh sách tài khoản vào request để gửi đến JSP
	    request.setAttribute("suppliers", suppliers);
        request.setAttribute("totalSuppliers", totalSuppliers);
	    
	    // Chuyển hướng đến trang JSP
	    RequestDispatcher dispatcher = request.getRequestDispatcher("cungcap_admin.jsp");
	    dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		 try {
	            // Lấy dữ liệu từ form
	            int supplierId = Integer.parseInt(request.getParameter("supplier_id"));
	            String supplierName = request.getParameter("supplier_name");
	            String supplierEmail = request.getParameter("supplier_email");
	            String supplierPhone = request.getParameter("supplier_phone");
	            String supplierAddress = request.getParameter("supplier_address");
	            String supplierWebsite = request.getParameter("supplier_website");
	            String supplierDescribe = request.getParameter("supplier_describe");
	            String supplierDateCreated = request.getParameter("supplier_date_created");

	            // Tạo đối tượng Supplier
	            Supplier supplier = new Supplier();
	            supplier.setSupplier_id(supplierId);
	            supplier.setSupplier_name(supplierName);
	            supplier.setSupplier_email(supplierEmail);
	            supplier.setSupplier_phone(supplierPhone);
	            supplier.setSupplier_address(supplierAddress);
	            supplier.setSupplier_website(supplierWebsite);
	            supplier.setSupplier_describe(supplierDescribe);
	            supplier.setSupplier_date_created(supplierDateCreated);

	            // Thêm nhà cung cấp vào cơ sở dữ liệu
	            boolean isAdded = supplierDAO.addSupplier(supplier);

	            // Xử lý kết quả
	            response.setContentType("text/html;charset=UTF-8");
	            if (isAdded) {
	                response.getWriter().println("<script>alert('Cập nhật thành công!'); window.location.href = 'Cungcap_admin';</script>");
	            } else {
	                response.getWriter().println("<script>alert('Cập nhật thất bại, vui lòng thử lại.'); history.back();</script>");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.getWriter().println("<script>alert('Có lỗi xảy ra trong quá trình xử lý dữ liệu. Vui lòng thử lại sau.'); history.back();</script>");
	        }
		
	}

}

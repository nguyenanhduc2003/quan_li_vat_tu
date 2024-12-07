package controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ExportDAO;
import DAO.ImportDAO;
import DAO.WarehouseDAO;
import model.Export;
import model.Import;
import model.Warehouse;

/**
 * Servlet implementation class Kho_admin
 */
@WebServlet("/Kho_admin")
public class Kho_admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private WarehouseDAO warehouseDAO = new WarehouseDAO();
	private ImportDAO importDAO = new ImportDAO();
	private ExportDAO exportDAO = new ExportDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Kho_admin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 // Lấy danh sách tài khoản từ cơ sở dữ liệu
	    List<Warehouse> warehouses = warehouseDAO.getAll();
	    List<Import> importts = importDAO.getAll();
	    List<Export> exportts = exportDAO.getAll();
	    
	    // Đưa danh sách tài khoản vào request để gửi đến JSP
	    request.setAttribute("warehouses", warehouses);
	    request.setAttribute("importts", importts);
	    request.setAttribute("exportts", exportts);
	    
	    // Chuyển hướng đến trang JSP
	    RequestDispatcher dispatcher = request.getRequestDispatcher("kho_admin.jsp");
	    dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		try {
			
			 // Lấy dữ liệu từ form
		       int warehouse_id = Integer.parseInt(request.getParameter("warehouse_id"));
		       int material_id = Integer.parseInt(request.getParameter("material_id"));
		       String warehouse_name = request.getParameter("warehouse_name");
		       String warehouse_supplier = request.getParameter("warehouse_supplier");
		       int warehouse_quantity = Integer.parseInt(request.getParameter("warehouse_quantity"));
		       

		       // Tạo đối tượng Account
		       Warehouse warehouse = new Warehouse();
		       warehouse.setWarehouse_id(warehouse_id);
		       warehouse.setMaterial_id(material_id);
		       warehouse.setWarehouse_name(warehouse_name);
		       warehouse.setWarehouse_supplier(warehouse_supplier);
		       warehouse.setWarehouse_quantity(warehouse_quantity);
		       

		       // Thêm tài khoản vào cơ sở dữ liệu
		       boolean isAdded = warehouseDAO.addWarehouse(warehouse);
		       
		    // Xử lý kết quả
		       response.setContentType("text/html;charset=UTF-8");
		       if (isAdded) {
		           response.getWriter().println("<script>alert('Cập nhật thành công!'); window.location.href = 'Kho_admin';</script>");
		       } else {
		           response.getWriter().println("<script>alert('Cập nhật thất bại, vui lòng thử lại.'); history.back();</script>");
		       }
			
		} catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<script>alert('Có lỗi xảy ra trong quá trình xử lý dữ liệu. Vui lòng thử lại sau.'); history.back();</script>");
        }
					
	}

}

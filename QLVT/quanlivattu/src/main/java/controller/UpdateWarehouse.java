package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.WarehouseDAO;
import model.Warehouse;

/**
 * Servlet implementation class UpdateWarehouse
 */
@WebServlet("/UpdateWarehouse")
public class UpdateWarehouse extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private WarehouseDAO warehouseDAO = new WarehouseDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateWarehouse() {
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
      int warehouseId = Integer.parseInt(request.getParameter("warehouse_id1"));
      int warehouseQuantity = Integer.parseInt(request.getParameter("warehouse_quantity1"));
      String warehouseName = request.getParameter("warehouse_name1");
      String warehouseSupplier = request.getParameter("warehouse_supplier1");
      
      Warehouse warehouse = new Warehouse();
      warehouse.setWarehouse_id(warehouseId);
      warehouse.setWarehouse_name(warehouseName);
      warehouse.setWarehouse_supplier(warehouseSupplier);
      warehouse.setWarehouse_quantity(warehouseQuantity);
      
      boolean isUpdated = warehouseDAO.updateWarehouse(warehouse);
      
      // Xử lý kết quả
      response.setContentType("text/html;charset=UTF-8");
      if (isUpdated) {
      	 response.getWriter().println("<script>alert('Cập nhật thành công!'); window.location.href = 'Kho_admin';</script>");
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

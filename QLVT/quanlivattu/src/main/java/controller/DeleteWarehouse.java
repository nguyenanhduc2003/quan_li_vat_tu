package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.WarehouseDAO;

/**
 * Servlet implementation class DeleteWarehouse
 */
@WebServlet("/DeleteWarehouse")
public class DeleteWarehouse extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private WarehouseDAO warehouseDAO = new WarehouseDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteWarehouse() {
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
		
		String warehouseIdStr = request.getParameter("warehouseId");
        try {
            int warehouseId = Integer.parseInt(warehouseIdStr);
            boolean isDeleted = warehouseDAO.deleteWarehouse(warehouseId);

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

        
        response.sendRedirect("Kho_admin"); 
		
	}

}

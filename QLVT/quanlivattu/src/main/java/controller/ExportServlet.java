package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MaterialDAO;

/**
 * Servlet implementation class ExportServlet
 */
@WebServlet("/ExportServlet")
public class ExportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExportServlet() {
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

        // Lấy dữ liệu từ form
        String materialName = request.getParameter("material_name");
        String exportName = request.getParameter("export_name");
        String exportDate = request.getParameter("export_date");
        String exportReceiver = request.getParameter("export_receiver");
        String exportPhone = request.getParameter("export_phone");
        String exportDepartment = request.getParameter("export_department");
        int exportQuantity = Integer.parseInt(request.getParameter("export_quantity"));

        // Tạo đối tượng MaterialDAO để tương tác với cơ sở dữ liệu
        MaterialDAO materialDAO = new MaterialDAO();

        // Lấy material_id từ tên vật tư
        int materialId = materialDAO.getMaterialIdByName(materialName);

        if (materialId == -1) {
            response.getWriter().println("<script>alert('Vật tư không tồn tại.'); history.back();</script>");
            return;
        }
        response.setContentType("text/html;charset=UTF-8");
        // Lấy số lượng tồn kho hiện tại
        int currentStock = materialDAO.getStockByMaterialName(materialName);
        

        // Kiểm tra nếu số lượng xuất vượt quá tồn kho
        if (exportQuantity > currentStock) {
        	response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<script>alert('Số lượng xuất vượt quá tồn kho. Số lượng tồn hiện tại là " + currentStock + ".'); history.back();</script>");
            return;
        }

        // Thực hiện xuất kho
        boolean success = materialDAO.exportMaterial(materialId, exportName, exportDate, exportReceiver, exportPhone, exportDepartment, exportQuantity);

        // Cập nhật số lượng tồn kho
        if (success) {
            materialDAO.updateStock(materialName, currentStock - exportQuantity);
        }

        // Kiểm tra kết quả
        response.setContentType("text/html;charset=UTF-8");
        if (success) {
            response.getWriter().println("<script>alert('Xuất khỏi kho thành công!'); window.location.href = 'Kho_admin';</script>");
        } else {
            response.getWriter().println("<script>alert('Có lỗi xảy ra trong quá trình xử lý dữ liệu. Vui lòng thử lại sau.'); history.back();</script>");
        }
	}

}

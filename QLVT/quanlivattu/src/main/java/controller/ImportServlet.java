package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MaterialDAO;
import DAO.TransactionDAO;

/**
 * Servlet implementation class ImportServlet
 */
@WebServlet("/ImportServlet")
public class ImportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImportServlet() {
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
        String importName = request.getParameter("import_name");
        String importDate = request.getParameter("import_date");
        String importReceiver = request.getParameter("import_receiver");
        String importPhone = request.getParameter("import_phone");
        String importDepartment = request.getParameter("import_department");
        int importQuantity = Integer.parseInt(request.getParameter("import_quantity"));
        
        MaterialDAO materialDAO = new MaterialDAO();

        // Lấy material_id từ tên vật tư
        int materialId = materialDAO.getMaterialIdByName(materialName);

        if (materialId == -1) {
            response.getWriter().println("<script>alert('Vật tư không tồn tại.'); history.back();</script>");
            return;
        }

        // Nhập kho
        boolean success = materialDAO.importMaterial(materialId, importName, importDate, importReceiver, importPhone, importDepartment, importQuantity);

        // Thêm giao dịch vào bảng transactions
        TransactionDAO transactionDAO = new TransactionDAO();
        if (transactionDAO.addTransaction("Nhập", importDate, importQuantity, materialId)) {
            System.out.println("Transaction logged successfully.");
        }
        // Kiểm tra kết quả và trả về thông báo
        response.setContentType("text/html;charset=UTF-8");
        if (success) {
            response.getWriter().println("<script>alert('Nhập vào kho thành công!'); window.location.href = 'Kho_admin';</script>");
        } else {
            response.getWriter().println("<script>alert('Có lỗi xảy ra trong quá trình xử lý dữ liệu. Vui lòng thử lại sau.'); history.back();</script>");
        }
	}

}

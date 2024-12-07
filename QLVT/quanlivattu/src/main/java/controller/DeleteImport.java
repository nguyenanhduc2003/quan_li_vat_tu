package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ImportDAO;

/**
 * Servlet implementation class DeleteImport
 */
@WebServlet("/DeleteImport")
public class DeleteImport extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ImportDAO importDAO = new ImportDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteImport() {
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
		String importIdStr = request.getParameter("importId");

        try {
            int importId = Integer.parseInt(importIdStr);  // Lấy importId từ form
            boolean isDeleted = importDAO.deleteImport(importId); // Gọi phương thức deleteImport từ DAO

            response.setContentType("text/html;charset=UTF-8");
            if (isDeleted) {
                response.getWriter().println("<script>alert('Xóa phiếu nhập thành công!'); window.location.href = 'Kho_admin';</script>");
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

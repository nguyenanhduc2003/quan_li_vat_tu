package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.MaterialDAO;

/**
 * Servlet implementation class DeleteMaterial
 */
@WebServlet("/DeleteMaterial")
public class DeleteMaterial extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MaterialDAO materialDAO = new MaterialDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMaterial() {
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
		
		String materialIdStr = request.getParameter("materialId");
        try {
            int materialId = Integer.parseInt(materialIdStr);
            boolean isDeleted = materialDAO.deleteMaterial(materialId);
            response.setContentType("text/html;charset=UTF-8");

            if (isDeleted) {
            	response.getWriter().println("<script>alert('Xóa thành công!'); window.location.href = 'Vattu_admin';</script>");;
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

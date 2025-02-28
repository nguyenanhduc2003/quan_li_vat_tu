package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.RequestDAO;
import model.Request;

/**
 * Servlet implementation class Duyet
 */
@WebServlet("/Duyet")
public class Duyet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RequestDAO requestDAO = new RequestDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Duyet() {
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
       int requestId = Integer.parseInt(request.getParameter("request_id"));
       String requestStatus = request.getParameter("request_status");
       
       Request request1 = new Request();
       request1.setRequest_id(requestId);
       request1.setRequest_status(requestStatus);
       
       // Thực hiện cập nhật
       boolean isUpdated = requestDAO.updateRequest(request1);

       // Xử lý kết quả
       response.setContentType("text/html;charset=UTF-8");
       if (isUpdated) {
       	 response.getWriter().println("<script>alert('Cập nhật thành công!'); window.location.href = 'Duyet_admin';</script>");
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

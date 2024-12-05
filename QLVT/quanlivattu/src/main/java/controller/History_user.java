package controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.RequestDAO;
import model.Request;

/**
 * Servlet implementation class History_user
 */
@WebServlet("/History_user")
public class History_user extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public History_user() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 // Lấy session của người dùng hiện tại
        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("account_email");
        
     

        if (userEmail == null) {
            // Nếu người dùng chưa đăng nhập, chuyển hướng về trang đăng nhập
            response.sendRedirect("dangnhap.jsp");
            return;
        }

        // Gọi DAO để lấy danh sách yêu cầu theo email
        RequestDAO requestDAO = new RequestDAO();
        List<Request> userRequests = requestDAO.getRequestsByEmail(userEmail);
        Map<String, Integer> requestCounts = requestDAO.RequestsByStatus(userEmail);
        int totalRequests = requestDAO.countTotalRequests(userEmail);

        request.setAttribute("Tong", totalRequests);
        request.setAttribute("DaDuyet", requestCounts.get("Đã duyệt"));
        request.setAttribute("DangCho", requestCounts.get("Đang chờ"));
        request.setAttribute("TuChoi", requestCounts.get("Từ chối"));

        // Gán danh sách yêu cầu vào request attribute
        request.setAttribute("requests", userRequests);

        // Chuyển tiếp đến trang JSP để hiển thị bảng
        request.getRequestDispatcher("lichsu_user.jsp").forward(request, response);
    }
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

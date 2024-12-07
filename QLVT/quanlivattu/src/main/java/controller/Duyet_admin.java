package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.RequestDAO;
import model.Request;


/**
 * Servlet implementation class Duyet_admin
 */
@WebServlet("/Duyet_admin")
public class Duyet_admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private RequestDAO requestDAO = new RequestDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Duyet_admin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 // Lấy danh sách tài khoản từ cơ sở dữ liệu
	    List<Request> requests = requestDAO.getAll();
	    int totalDuyet = requestDAO.getApprovedCount();
	    int totalTuchoi = requestDAO.getRejectedCount();
	    int totalCho = requestDAO.getPendingCount();
	    
	    // Đưa danh sách tài khoản vào request để gửi đến JSP
	    request.setAttribute("requests", requests);
	    request.setAttribute("totalDuyet", totalDuyet);
	    request.setAttribute("totalTuchoi", totalTuchoi);
	    request.setAttribute("totalCho", totalCho);
	    
	    // Chuyển hướng đến trang JSP
	    RequestDispatcher dispatcher = request.getRequestDispatcher("duyet_admin.jsp");
	    dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		try {

        // Lấy dữ liệu từ form
        String requestEmail = request.getParameter("request_email");
        String requestName = request.getParameter("request_name");
        String requestPhone = request.getParameter("request_phone");
        String requestDate = request.getParameter("request_date");
        String requestMaterialName = request.getParameter("request_materialname");
        int requestQuantity = Integer.parseInt(request.getParameter("request_quantity"));
        String requestReason = request.getParameter("request_reason");
        String requestNote = request.getParameter("request_note");

        // Tạo đối tượng Request
        Request newRequest = new Request();
        newRequest.setRequest_email(requestEmail);
        newRequest.setRequest_name(requestName);
        newRequest.setRequest_phone(requestPhone);
        newRequest.setRequest_date(requestDate);
        newRequest.setRequest_materialname(requestMaterialName);
        newRequest.setRequest_quantity(requestQuantity);
        newRequest.setRequest_reason(requestReason);
        newRequest.setRequest_note(requestNote);
        newRequest.setRequest_status("Đang chờ");

        // Gọi DAO để thêm yêu cầu vào cơ sở dữ liệu
        RequestDAO requestDAO = new RequestDAO();
        boolean isAdded = requestDAO.addRequest(newRequest);

        // Xử lý kết quả
        response.setContentType("text/html; charset=UTF-8");
        if (isAdded) {
            response.getWriter().println("<script>alert('Yêu cầu đã được gửi thành công!'); window.location.href = 'yeucau_user.jsp';</script>");
        } else {
            response.getWriter().println("<script>alert('Gửi yêu cầu thất bại! Vui lòng thử lại.'); history.back();</script>");
        }
		} catch (NumberFormatException | IOException e) {
            e.printStackTrace();
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<script>alert('Có lỗi xảy ra trong quá trình xử lý dữ liệu. Vui lòng thử lại sau.'); history.back();</script>");
        }	
	}

}

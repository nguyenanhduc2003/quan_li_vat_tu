package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.AccountDAO;
import model.Account;

/**
 * Servlet implementation class UpdateInfoServlet
 */
@WebServlet("/UpdateInfoServlet")
public class UpdateInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateInfoServlet() {
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
        String fullName = request.getParameter("fullName");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
        String birthDate = request.getParameter("birthDate");

        // Lấy ID tài khoản từ session
        HttpSession session = request.getSession();
        int accountId = (int) session.getAttribute("account_id");
        String role = (String) session.getAttribute("account_role");

        // Tạo đối tượng Account
        Account account = new Account();
        account.setAccount_id(accountId);
        account.setAccount_name(fullName);
        
        // Nếu người dùng không nhập số điện thoại, giữ nguyên số điện thoại cũ
        if (phoneNumber != null && !phoneNumber.trim().isEmpty()) {
            account.setAccount_phone(phoneNumber);
        }

        // Nếu người dùng không nhập địa chỉ, giữ nguyên địa chỉ cũ
        if (address != null && !address.trim().isEmpty()) {
            account.setAccount_address(address);
        }

        // Nếu người dùng không nhập ngày sinh, giữ nguyên ngày sinh cũ
        if (birthDate != null && !birthDate.trim().isEmpty()) {
            account.setAccount_birthday(birthDate);
        }

        // Gọi DAO để cập nhật
        AccountDAO accountDAO = new AccountDAO();
        accountDAO.update(account);

     // Sau khi cập nhật thành công, chuyển hướng dựa trên vai trò
        if ("admin".equals(role)) {
        	response.getWriter().println("<script>alert('Success!'); window.location.href = 'trangchu_admin.jsp';</script>");
        } else {
        	response.getWriter().println("<script>alert('Success!'); window.location.href = 'trangchu_user.jsp';</script>");
        }
		
	}

}

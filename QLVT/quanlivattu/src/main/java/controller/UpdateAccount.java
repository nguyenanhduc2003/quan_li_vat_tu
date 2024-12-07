package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.AccountDAO;
import model.Account;

/**
 * Servlet implementation class UpdateAccount
 */
@WebServlet("/UpdateAccount")
public class UpdateAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AccountDAO accountDAO = new AccountDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAccount() {
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
        int accountId = Integer.parseInt(request.getParameter("accountId1"));
        String fullName = request.getParameter("fullName1");
        String email = request.getParameter("email1");
        String pass = request.getParameter("pass1");
        String phoneNumber = request.getParameter("phoneNumber1");
        String address = request.getParameter("address1");
        String birthDate = request.getParameter("birthDate1");
        String role = request.getParameter("role1");

        // Tạo đối tượng Account để cập nhật
        Account account = new Account();
        account.setAccount_id(accountId);
        account.setAccount_name(fullName);
        account.setAccount_email(email);
        account.setAccount_pass(pass);
        account.setAccount_phone(phoneNumber);
        account.setAccount_address(address);
        account.setAccount_birthday(birthDate);
        account.setAccount_role(role);

        // Thực hiện cập nhật
        boolean isUpdated = accountDAO.updateAccount(account);

        // Xử lý kết quả
        response.setContentType("text/html;charset=UTF-8");
        if (isUpdated) {
        	 response.getWriter().println("<script>alert('Cập nhật thành công!'); window.location.href = 'Taikhoan_admin';</script>");
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

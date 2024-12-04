package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AccountDAO;
import model.Account;

@WebServlet("/Taikhoan_admin")
public class Taikhoan_admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private AccountDAO accountDAO = new AccountDAO();
       
    public Taikhoan_admin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 // Lấy danh sách tài khoản từ cơ sở dữ liệu
	    List<Account> accounts = accountDAO.getAll();
	    request.setAttribute("accounts", accounts);
	    
	    
	    // Lấy tổng số tài khoản từ DAO
        int totalAccounts = accountDAO.getTotalAccounts();
        request.setAttribute("totalAccounts", totalAccounts);
        
        int totalAdmins = accountDAO.getTotalByRole("admin");
        int totalUsers = accountDAO.getTotalByRole("user");

        // Gắn giá trị vào request
        request.setAttribute("totalAdmins", totalAdmins);
        request.setAttribute("totalUsers", totalUsers);
		
        // Gửi đến trang chủ
        RequestDispatcher dispatcher = request.getRequestDispatcher("taikhoan_admin.jsp");
	    dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		 // Lấy dữ liệu từ form
        int userId = Integer.parseInt(request.getParameter("user-id"));
        String userName = request.getParameter("user-name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phoneNumber = request.getParameter("phonenumber");
        String birthday = request.getParameter("birthday");
        String address = request.getParameter("address");
        String dateCreate = request.getParameter("date-create");
        String role = request.getParameter("role");

        // Tạo đối tượng Account
        Account account = new Account();
        account.setAccount_id(userId);
        account.setAccount_name(userName);
        account.setAccount_email(email);
        account.setAccount_pass(password);
        account.setAccount_phone(phoneNumber);
        account.setAccount_birthday(birthday);
        account.setAccount_address(address);
        account.setAccount_created_date(dateCreate);
        account.setAccount_role(role);

        // Thêm tài khoản vào cơ sở dữ liệu
        boolean isAdded = accountDAO.addAccount(account);
        
     // Xử lý kết quả
        response.setContentType("text/html");
        if (isAdded) {
            response.getWriter().println("<script>alert('Success!'); window.location.href = 'Taikhoan_admin';</script>");
        } else {
            response.getWriter().println("<script>alert('Failse! Try again!'); history.back();</script>");
        }
		
	}

}

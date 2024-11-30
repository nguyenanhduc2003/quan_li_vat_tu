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
	    
	    // Đưa danh sách tài khoản vào request để gửi đến JSP
	    request.setAttribute("accounts", accounts);
	    
	    // Chuyển hướng đến trang JSP
	    RequestDispatcher dispatcher = request.getRequestDispatcher("taikhoan_admin.jsp");
	    dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

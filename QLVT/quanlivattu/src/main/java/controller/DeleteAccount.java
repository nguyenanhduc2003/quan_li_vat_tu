package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AccountDAO;

/**
 * Servlet implementation class DeleteAccount
 */
@WebServlet("/DeleteAccount")
public class DeleteAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AccountDAO accountDAO = new AccountDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteAccount() {
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
		
		String accountIdStr = request.getParameter("accountId");
        try {
            int accountId = Integer.parseInt(accountIdStr);
            boolean isDeleted = accountDAO.deleteAccount(accountId);
            response.setContentType("text/html;charset=UTF-8");

            if (isDeleted) {
            	response.getWriter().println("<script>alert('Xóa thành công!'); window.location.href = 'Taikhoan_admin';</script>");
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


package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ads.ConnectionPool;
import ads.ConnectionPoolImpl;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		
		 // Lấy dữ liệu từ form
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Tạo kết nối và xử lý xác thực người dùng
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        ConnectionPool connectionPool = ConnectionPoolImpl.getInstance();
        
        try {
            // Lấy kết nối từ ConnectionPool
            conn = connectionPool.getConnection("LoginServlet");

            // Tạo câu lệnh SQL để truy vấn tài khoản
            String sql = "SELECT account_id, account_name, account_pass, account_role FROM tblaccount WHERE account_email = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);

            // Thực thi câu lệnh SQL
            rs = pstmt.executeQuery();

            if (rs.next()) {
                // Kiểm tra mật khẩu
                String storedPassword = rs.getString("account_pass");
                if (storedPassword.equals(password)) {
                    // Đăng nhập thành công, lưu thông tin người dùng vào session
                    HttpSession session = request.getSession();
                    session.setAttribute("account_id", rs.getInt("account_id"));
                    session.setAttribute("account_name", rs.getString("account_name"));
                    session.setAttribute("account_role", rs.getString("account_role"));

                    // Kiểm tra vai trò và chuyển hướng tương ứng
                    String role = rs.getString("account_role");
                    if ("admin".equals(role)) {
                        // Nếu là admin, chuyển hướng đến trang quản trị
                        response.sendRedirect("trangchu_admin.jsp");
                    } else {
                        // Nếu là user, chuyển hướng đến trang người dùng
                        response.sendRedirect("trangchu_user.jsp");
                    }
                } else {
                    // Mật khẩu sai
                    response.sendRedirect("dangnhap.jsp?error=4");
                }
            } else {
                // Email không tồn tại trong cơ sở dữ liệu
                response.sendRedirect("dangnhap.jsp?error=5");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("dangnhap.jsp?error=3"); // Lỗi hệ thống
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) connectionPool.releaseConnection(conn, "LoginServlet");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}


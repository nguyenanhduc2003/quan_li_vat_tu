package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ads.ConnectionPool;
import ads.ConnectionPoolImpl;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        
        // Kiểm tra mật khẩu và xác nhận mật khẩu có khớp không
        if (!password.equals(confirmPassword)) {
            response.sendRedirect("dangnhap.jsp?error=1");  // Mật khẩu không khớp
            return;
        }
        
     // Kết nối cơ sở dữ liệu và kiểm tra email đã tồn tại chưa
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        
        ConnectionPool connectionPool = ConnectionPoolImpl.getInstance();
        
       
        try {
            conn = connectionPool.getConnection("RegisterServlet");
            
            if (conn != null) {
                System.out.println("Kết nối đến cơ sở dữ liệu thành công!");
            } else {
                System.out.println("Không thể kết nối đến cơ sở dữ liệu.");
            }

            // Kiểm tra email đã tồn tại chưa
            String checkEmailSql = "SELECT account_email FROM tblaccount WHERE account_email = ?";
            pstmt = conn.prepareStatement(checkEmailSql);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                // Nếu email đã tồn tại
                response.sendRedirect("dangnhap.jsp?error=2");  // Email đã tồn tại
                return;
            }
            
         // Định dạng ngày giờ tạo tài khoản
            String accountCreatedDate = new SimpleDateFormat("dd-MM-yyyy").format(new Date()); // Sử dụng định dạng 'dd-MM-yyyy'
            

            // Lưu tài khoản mới vào cơ sở dữ liệu
            String sql = "INSERT INTO tblaccount (account_name, account_email, account_pass, account_role, account_created_date) VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, fullname);
            pstmt.setString(2, email);
            pstmt.setString(3, password);
            pstmt.setString(4, "user"); // Vai trò mặc định là 'user'
            pstmt.setString(5, accountCreatedDate);

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                // Đăng ký thành công, chuyển đến trang đăng nhập
                response.sendRedirect("dangnhap.jsp?success=1");
            } else {
                // Lỗi khi thêm tài khoản
                response.sendRedirect("dangnhap.jsp?error=3");  // Lỗi hệ thống
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("dangnhap.jsp?error=3");  // Lỗi hệ thống
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) connectionPool.releaseConnection(conn, "RegisterServlet");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
	
	

		
}

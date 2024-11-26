package TEST;

import java.sql.*;

import ads.ConnectionPool;
import ads.ConnectionPoolImpl;

public class TEST {
    public static void main(String[] args) throws SQLException {
        // Lấy instance của ConnectionPool
        ConnectionPool pool = ConnectionPoolImpl.getInstance();
        
        // Yêu cầu kết nối
        Connection con = pool.getConnection("Main");
        
        try {
            // Tắt autocommit trước khi thực hiện các thao tác commit/rollback
            con.setAutoCommit(false);
            
            // Kiểm tra kết nối bằng một truy vấn SQL đơn giản
            System.out.println("Đang kiểm tra kết nối...");
            
            // Tạo statement để thực hiện truy vấn
            Statement stmt = con.createStatement();
            
            // Truy vấn SELECT để kiểm tra kết nối
            ResultSet rs = stmt.executeQuery("SELECT 1");
            if (rs.next()) {
                System.out.println("Kết nối đến cơ sở dữ liệu thành công.");
            }
            
            // Thực hiện một truy vấn SELECT khác để lấy dữ liệu từ một bảng (thí dụ)
            String query = "SELECT full_name FROM user LIMIT 1";
            rs = stmt.executeQuery(query);
            if (rs.next()) {
                System.out.println("Lấy được full_name: " + rs.getString("full_name"));
            }
            
            // Thực hiện câu lệnh INSERT để thêm dữ liệu
            String insertQuery = "INSERT INTO user (username, password) VALUES (?, ?)";
            PreparedStatement pstmt = con.prepareStatement(insertQuery);
            pstmt.setString(1, "testuser1");
            pstmt.setString(2, "testpassword1");
            int rowsAffected = pstmt.executeUpdate();
            System.out.println("Số dòng bị ảnh hưởng bởi câu lệnh INSERT: " + rowsAffected);
            
            // Commit thay đổi
            con.commit();
            
        } catch (SQLException e) {
            e.printStackTrace();
            con.rollback(); // Nếu có lỗi, rollback lại các thay đổi
        } finally {
            // Trả kết nối về pool
            pool.releaseConnection(con, "Main");
            System.out.println("Đã trả kết nối về pool.");
        }
    }
}

package DAO;

import java.sql.Connection;
import java.sql.SQLException;

import ads.ConnectionPool;
import ads.ConnectionPoolImpl;
import model.Account;

public class BaseDAO {

	  private static ConnectionPool pool = ConnectionPoolImpl.getInstance();

	    // Lấy kết nối đến cơ sở dữ liệu từ pool
	    protected Connection getConnection() throws SQLException {
	        System.out.println("Đang kết nối đến cơ sở dữ liệu...");
	        return pool.getConnection("BaseDAO");
	    }

	    // Đóng tài nguyên
	    protected void closeResources(Connection conn, AutoCloseable... resources) {
	        try {
	            for (AutoCloseable resource : resources) {
	                if (resource != null) {
	                    resource.close();
	                }
	            }
	            if (conn != null) {
	                // Trả lại connection vào pool thay vì đóng
	                pool.releaseConnection(conn, "BaseDAO");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

		public Account getAccountById(String accountId) {
			// TODO Auto-generated method stub
			return null;
		}
}

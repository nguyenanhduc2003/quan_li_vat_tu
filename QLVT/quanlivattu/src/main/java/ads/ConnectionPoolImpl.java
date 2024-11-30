package ads;

import java.sql.*;
import java.sql.SQLException;
import java.util.Stack;

public class ConnectionPoolImpl implements ConnectionPool {
	
	private String driver;
	private String username;
	private String password;
	private String url;
	
	private Stack<Connection> pool;
	
	//
	private static ConnectionPool cp= null;
	
	
	public ConnectionPoolImpl() {
		 this.driver = "com.mysql.cj.jdbc.Driver";
		    this.url = "jdbc:mysql://localhost:3306/quanlivattu?useSSL=false&allowPublicKeyRetrieval=true";
		    this.username = "quanlivattu_ducna";
		    this.password = "@123$%65";

		    try {
		        Class.forName(this.driver);
		    } catch (ClassNotFoundException e) {
		        e.printStackTrace();
		    }

		    this.pool = new Stack<>();
		    initializePool(5);  // Tạo 5 kết nối ban đầu vào pool
		}

		private void initializePool(int initialSize) {
		    for (int i = 0; i < initialSize; i++) {
		        try {
		            this.pool.push(DriverManager.getConnection(this.url, this.username, this.password));
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		    }
		
	}

	@Override
	public Connection getConnection(String objectName) throws SQLException {
		// TODO Auto-generated method stub
		if(this.pool.isEmpty()) {
			//khởi tạo kết nối mới
			return DriverManager.getConnection(this.url,
					this.username, this.password);
		}
		else {
			//lấy kết nối đã được lưu trữ
			System.out.println(objectName + "Have popped the Connection");
			return this.pool.pop();
		}
		

	}

	@Override
	public void releaseConnection(Connection con, String objectName) throws SQLException {
		// TODO Auto-generated method stub
		//thu hồi connection
		System.out.println(objectName+"Have pushed the Connection");
		this.pool.push(con);
	}
	
	public static ConnectionPool getInstance() {
		if(cp==null) {
			
			synchronized (ConnectionPoolImpl.class){
			if(cp == null) {
				
				cp = new ConnectionPoolImpl();

			}
			}
			
		}
		
		
		return cp;
	}

}

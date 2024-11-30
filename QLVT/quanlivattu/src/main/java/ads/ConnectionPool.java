package ads;

import java.sql.*;

public interface ConnectionPool {
	Connection getConnection(String objectName) throws SQLException; // xin kết nối
	void releaseConnection(Connection con, String objectName) throws SQLException;
}
// http://localhost:8081/quanlivattu/DashboardServlet

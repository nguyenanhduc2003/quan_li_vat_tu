package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import model.Request;

public class RequestDAO extends BaseDAO implements Dao<Request>{
	
	public int countTotalRequests(String email) {
	    int count = 0;
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        conn = getConnection();

	        // Truy vấn đếm tổng số phiếu yêu cầu theo email
	        String sql = "SELECT COUNT(*) FROM tblrequest WHERE request_email = ?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, email);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            count = rs.getInt(1); // Đếm tổng số dòng
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        closeResources(conn, pstmt, rs);
	    }

	    return count;
	}

	
	public Map<String, Integer> RequestsByStatus(String email) {
	    Map<String, Integer> counts = new HashMap<>();
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        conn = getConnection();

	        String sql = "SELECT request_status, COUNT(*) AS count FROM tblrequest WHERE request_email = ? GROUP BY request_status";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, email);
	        rs = pstmt.executeQuery();

	        // Lưu kết quả đếm vào map
	        while (rs.next()) {
	            String status = rs.getString("request_status");
	            int count = rs.getInt("count");
	            counts.put(status, count);
	        }

	        // Đảm bảo các trạng thái có giá trị mặc định nếu không có trong kết quả
	        counts.putIfAbsent("Đã duyệt", 0);
	        counts.putIfAbsent("Đang chờ", 0);
	        counts.putIfAbsent("Từ chối", 0);

	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        closeResources(conn, pstmt, rs);
	    }

	    return counts;
	}

	
	 // Phương thức lấy danh sách yêu cầu theo email
    public List<Request> getRequestsByEmail(String email) {
        List<Request> requests = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = getConnection();

            String sql = "SELECT * FROM tblrequest WHERE request_email = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Request request = new Request();
                request.setRequest_email(rs.getString("request_email"));
                request.setRequest_name(rs.getString("request_name"));
                request.setRequest_phone(rs.getString("request_phone"));
                request.setRequest_date(rs.getString("request_date"));
                request.setRequest_materialname(rs.getString("request_materialname"));
                request.setRequest_quantity(rs.getInt("request_quantity"));
                request.setRequest_reason(rs.getString("request_reason"));
                request.setRequest_note(rs.getString("request_note"));
                request.setRequest_status(rs.getString("request_status"));

                requests.add(request);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Error fetching requests by email: " + email);
        } finally {
            closeResources(conn, pstmt, rs);
        }

        return requests;
    }
	
	// Phương thức thêm yêu cầu (request)
	public boolean addRequest(Request request) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    boolean isInserted = false;

	    try {
	        conn = getConnection();

	        String sql = "INSERT INTO tblrequest (request_id, request_name, request_email, request_phone, request_date, request_materialname, request_quantity, request_reason, request_note, request_status) "
	                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, request.getRequest_id());
	        pstmt.setString(2, request.getRequest_name());
	        pstmt.setString(3, request.getRequest_email());
	        pstmt.setString(4, request.getRequest_phone());
	        pstmt.setString(5, request.getRequest_date());
	        pstmt.setString(6, request.getRequest_materialname());
	        pstmt.setInt(7, request.getRequest_quantity());
	        pstmt.setString(8, request.getRequest_reason());
	        pstmt.setString(9, request.getRequest_note());
	        pstmt.setString(10, request.getRequest_status());

	        int rowsAffected = pstmt.executeUpdate();
	        if (rowsAffected > 0) {
	            isInserted = true;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        closeResources(conn, pstmt);
	    }

	    return isInserted;
	}

	
	 // Hàm đếm số lượng yêu cầu theo trạng thái
    public int countRequestsByStatus(String status) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int count = 0; 

        try {
            conn = getConnection();
            String sql = "SELECT COUNT(*) FROM tblrequest WHERE request_status = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, status);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, pstmt, rs);
        }
        return count;
    }


    public int getApprovedCount() {
        return countRequestsByStatus("Đã duyệt"); 
    }

    public int getRejectedCount() {
        return countRequestsByStatus("Từ chối"); 
    }

    public int getPendingCount() {
        return countRequestsByStatus("Đang chờ"); 
    }
	
	public boolean updateRequest(Request request) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = getConnection();
            String sql = "UPDATE tblrequest SET request_status = ? WHERE request_id = ?";
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, request.getRequest_status());
            pstmt.setInt(2, request.getRequest_id());

            int rowsUpdated = pstmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            closeResources(conn, pstmt, null);
        }
    }
    
	
	 public boolean updateRequestStatus(String requestId, String status) {
	        Connection conn = null;
	        PreparedStatement stmt = null;
	        try {
	            // Lấy kết nối từ pool
	            conn = getConnection();
	            // Cập nhật trạng thái của yêu cầu trong cơ sở dữ liệu
	            String query = "UPDATE tblrequest SET request_status = ? WHERE request_id = ?";
	            stmt = conn.prepareStatement(query);
	            stmt.setString(1, status);
	            stmt.setString(2, requestId);
	            int rowsUpdated = stmt.executeUpdate();
	            return rowsUpdated > 0;
	        } catch (SQLException e) {
	            e.printStackTrace();
	            return false;
	        } finally {
	            // Đảm bảo đóng tài nguyên
	            closeResources(conn, stmt);
	        }
	    }
	

	@Override
	public List<Request> getAll() {
		
		List<Request> requests = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = getConnection();
            String sql = "SELECT * FROM tblrequest";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            System.out.println("Query executed successfully!");

            while (rs.next()) {
                Request request = new Request();
                request.setRequest_id(rs.getInt("request_id"));
                request.setRequest_name(rs.getString("request_name"));
                request.setRequest_email(rs.getString("request_email"));
                request.setRequest_phone(rs.getString("request_phone"));
                request.setRequest_date(rs.getString("request_date"));
                request.setRequest_materialname(rs.getString("request_materialname"));
                request.setRequest_quantity(rs.getInt("request_quantity"));
                request.setRequest_reason(rs.getString("request_reason"));
                request.setRequest_note(rs.getString("request_note"));
                request.setRequest_status(rs.getString("request_status"));
                requests.add(request);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, pstmt, rs);
        }

        return requests;
		
	}

	@Override
	public Optional<Request> get(int id) {
		// TODO Auto-generated method stub
		return Optional.empty();
	}

	@Override
	public void save(Request t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Request t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Request t) {
		// TODO Auto-generated method stub
		
	}


}

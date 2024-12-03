package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import model.Request;

public class RequestDAO extends BaseDAO implements Dao<Request>{

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

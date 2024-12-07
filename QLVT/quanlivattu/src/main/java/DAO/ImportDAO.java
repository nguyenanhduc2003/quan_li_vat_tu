package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import model.Import;

public class ImportDAO extends BaseDAO implements Dao<Import> {
	public boolean deleteImport(int importId) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;

	    try {
	        conn = getConnection();
	        String sql = "DELETE FROM tblimport WHERE import_id = ?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, importId);

	        int rowsAffected = pstmt.executeUpdate();
	        return rowsAffected > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    } finally {
	        // Đóng kết nối
	        try {
	            if (pstmt != null) pstmt.close();
	            if (conn != null) conn.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}

	// Phương thức thêm phiếu nhập
	public boolean addImport(Import importt) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    boolean isInserted = false;

	    try {
	        conn = getConnection();

	        String sql = "INSERT INTO tblimport (import_id, import_name, import_date, import_receiver, import_department, import_phone, import_quantity) "
	                + "VALUES (?, ?, ?, ?, ?, ?, ?)";

	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, importt.getImport_id());
	        pstmt.setString(2, importt.getImport_name());
	        pstmt.setString(3, importt.getImport_date());
	        pstmt.setString(4, importt.getImport_receiver());
	        pstmt.setString(5, importt.getImport_department());
	        pstmt.setString(6, importt.getImport_phone());
	        pstmt.setInt(7, importt.getImport_quantity());

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


	@Override
	public List<Import> getAll() {
		List<Import> importts = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = getConnection();  
            String sql = "SELECT * FROM tblimport";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            System.out.println("Query executed successfully!");

            // Duyệt qua tất cả các bản ghi và thêm vào danh sách imports
            while (rs.next()) {
                Import importItem = new Import();
                importItem.setImport_id(rs.getInt("import_id"));
                importItem.setImport_name(rs.getString("import_name"));
                importItem.setImport_date(rs.getString("import_date"));
                importItem.setImport_receiver(rs.getString("import_receiver"));
                importItem.setImport_phone(rs.getString("import_phone"));
                importItem.setImport_department(rs.getString("import_department"));
                importItem.setImport_quantity(rs.getInt("import_quantity"));
                importts.add(importItem);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, pstmt, rs);  // Hàm đóng tài nguyên
        }

        return importts;
	}

	@Override
	public Optional<Import> get(int id) {
		// TODO Auto-generated method stub
		return Optional.empty();
	}

	@Override
	public void save(Import t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Import t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Import t) {
		// TODO Auto-generated method stub
		
	}

}

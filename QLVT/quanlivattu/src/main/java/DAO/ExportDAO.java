package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import model.Export;

public class ExportDAO extends BaseDAO implements Dao<Export> {
	public boolean deleteExport(int exportId) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;

	    try {
	        conn = getConnection();
	        String sql = "DELETE FROM tblexport WHERE export_id = ?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, exportId);

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

	// Phương thức thêm phiếu xuất
	public boolean addExport(Export export) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    boolean isInserted = false;

	    try {
	        conn = getConnection();

	        String sql = "INSERT INTO tblexport (export_id, export_name, export_date, export_receiver, export_department, export_phone, export_quantity) "
	                + "VALUES (?, ?, ?, ?, ?, ?, ?)";

	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, export.getExport_id());
	        pstmt.setString(2, export.getExport_name());
	        pstmt.setString(3, export.getExport_date());
	        pstmt.setString(4, export.getExport_receiver());
	        pstmt.setString(5, export.getExport_department());
	        pstmt.setString(6, export.getExport_phone());
	        pstmt.setInt(7, export.getExport_quantity());

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
	public List<Export> getAll() {
		List<Export> exportts = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = getConnection();  
            String sql = "SELECT * FROM tblexport";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Export exportItem = new Export();
                exportItem.setExport_id(rs.getInt("export_id"));
                exportItem.setExport_name(rs.getString("export_name"));
                exportItem.setExport_date(rs.getString("export_date"));
                exportItem.setExport_receiver(rs.getString("export_receiver"));
                exportItem.setExport_phone(rs.getString("export_phone"));
                exportItem.setExport_department(rs.getString("export_department"));
                exportItem.setExport_quantity(rs.getInt("export_quantity"));
                exportts.add(exportItem);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, pstmt, rs); 
        }

        return exportts;
	}

	@Override
	public Optional<Export> get(int id) {
		// TODO Auto-generated method stub
		return Optional.empty();
	}

	@Override
	public void save(Export t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Export t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Export t) {
		// TODO Auto-generated method stub
		
	}

}

package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ForecastDAO extends BaseDAO{
	 public int forecastImport(int materialId) {
	        int forecast = 0;
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;

	        try {
	            conn = getConnection();
	            String sql = "SELECT AVG(import_quantity) AS avg_import FROM tblimport WHERE material_id = ?";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, materialId);
	            rs = pstmt.executeQuery();

	            if (rs.next()) {
	                forecast = rs.getInt("avg_import");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            closeResources(conn, pstmt, rs);
	        }

	        return forecast;
	    }

	    public int forecastExport(int materialId) {
	        int forecast = 0;
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;

	        try {
	            conn = getConnection();
	            String sql = "SELECT AVG(export_quantity) AS avg_export FROM tblexport WHERE material_id = ?";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, materialId);
	            rs = pstmt.executeQuery();

	            if (rs.next()) {
	                forecast = rs.getInt("avg_export");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            closeResources(conn, pstmt, rs);
	        }

	        return forecast;
	    }
}

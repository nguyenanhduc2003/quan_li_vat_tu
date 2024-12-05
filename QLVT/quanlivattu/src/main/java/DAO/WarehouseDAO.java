package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import model.Warehouse;

public class WarehouseDAO extends BaseDAO implements Dao<Warehouse>{
	
	public boolean deleteWarehouse(int warehouseId) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;

	    try {
	        conn = getConnection();
	        String sql = "DELETE FROM tblwarehouse WHERE warehouse_id = ?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, warehouseId);

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
	
	public boolean updateWarehouse(Warehouse warehouse) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;

	    try {
	        conn = getConnection();
	        String sql = "UPDATE tblwarehouse SET warehouse_name = ?, warehouse_supplier = ?, warehouse_quantity = ? WHERE warehouse_id = ?";
	        pstmt = conn.prepareStatement(sql);

	        pstmt.setString(1, warehouse.getWarehouse_name());
	        pstmt.setString(2, warehouse.getWarehouse_supplier());
	        pstmt.setInt(3, warehouse.getWarehouse_quantity());
	        pstmt.setInt(4, warehouse.getWarehouse_id());

	        int rowsUpdated = pstmt.executeUpdate();
	        return rowsUpdated > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    } finally {
	        closeResources(conn, pstmt, null);
	    }
	}
	
    public boolean addWarehouse(Warehouse warehouse) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean isInserted = false;

        try {
            conn = getConnection();

            String sql = "INSERT INTO tblwarehouse (warehouse_id, material_id, warehouse_name, warehouse_supplier, warehouse_quantity)"
                    + "VALUES (?, ?, ?, ?, ?)";

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, warehouse.getWarehouse_id());
            pstmt.setInt(2, warehouse.getMaterial_id());
            pstmt.setString(3, warehouse.getWarehouse_name());
            pstmt.setString(4, warehouse.getWarehouse_supplier());
            pstmt.setInt(5, warehouse.getWarehouse_quantity());

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
	public List<Warehouse> getAll() {
		
		List<Warehouse> warehouses = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = getConnection();
            String sql = "SELECT * FROM tblwarehouse";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            System.out.println("Query executed successfully!");

            while (rs.next()) {
            	Warehouse warehouse = new Warehouse();
            	warehouse.setWarehouse_id(rs.getInt("warehouse_id"));
            	warehouse.setWarehouse_name(rs.getString("warehouse_name"));
            	warehouse.setWarehouse_supplier(rs.getString("warehouse_supplier"));
            	warehouse.setWarehouse_quantity(rs.getInt("warehouse_quantity"));
            	warehouses.add(warehouse);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, pstmt, rs);
        }

        return warehouses;
		
	}

	@Override
	public Optional<Warehouse> get(int id) {
		// TODO Auto-generated method stub
		return Optional.empty();
	}

	@Override
	public void save(Warehouse t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Warehouse t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Warehouse t) {
		// TODO Auto-generated method stub
		
	}


}

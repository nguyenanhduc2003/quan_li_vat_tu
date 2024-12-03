package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import model.Account;
import model.Material;
import model.Warehouse;

public class WarehouseDAO extends BaseDAO implements Dao<Warehouse>{

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

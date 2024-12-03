package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import model.Supplier;

public class SupplierDAO extends BaseDAO implements Dao<Supplier>{

	@Override
	public List<Supplier> getAll() {
		
		List<Supplier> suppliers = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = getConnection();
            String sql = "SELECT * FROM tblsupplier";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            System.out.println("Query executed successfully!");

            while (rs.next()) {
            	Supplier supplier = new Supplier();
            	supplier.setSupplier_id(rs.getInt("supplier_id"));
            	supplier.setSupplier_name(rs.getString("supplier_name"));
            	supplier.setSupplier_email(rs.getString("supplier_email"));
            	supplier.setSupplier_phone(rs.getString("supplier_phone"));
            	supplier.setSupplier_address(rs.getString("supplier_address"));
            	supplier.setSupplier_website(rs.getString("supplier_website"));
            	supplier.setSupplier_describe(rs.getString("supplier_describe"));
            	supplier.setSupplier_date_created(rs.getString("supplier_date_created"));
                suppliers.add(supplier);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, pstmt, rs);
        }

        return suppliers;
		
	}

	@Override
	public Optional<Supplier> get(int id) {
		// TODO Auto-generated method stub
		return Optional.empty();
	}

	@Override
	public void save(Supplier t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Supplier t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Supplier t) {
		// TODO Auto-generated method stub
		
	}

	
}

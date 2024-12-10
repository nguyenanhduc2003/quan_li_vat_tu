package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Transaction;

public class TransactionDAO extends BaseDAO{
	
	public List<Transaction> getTransactionsByDateRange(String fromDate, String toDate) {
	    List<Transaction> transactions = new ArrayList<>();
	    
	    String sql = "SELECT t.transaction_date, t.transaction_type, m.material_name, t.transaction_quantity " +
	             "FROM tbltransactions t " +
	             "JOIN tblmaterial m ON t.material_id = m.material_id " +
	             "WHERE t.transaction_date BETWEEN ? AND ?";


	    try (Connection conn = getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql)) {

	        pstmt.setString(1, fromDate);
	        pstmt.setString(2, toDate);
	        ResultSet rs = pstmt.executeQuery();

	        while (rs.next()) {
	            Transaction transaction = new Transaction();
	            transaction.setDate(rs.getString("transaction_date"));
	            transaction.setType(rs.getString("transaction_type"));
	            transaction.setMaterialName(rs.getString("material_name"));
	            transaction.setQuantity(rs.getInt("transaction_quantity"));
	            transactions.add(transaction);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return transactions;
	}

	
	public boolean addTransaction(String type, String date, int quantity, int materialId) {
        String sql = "INSERT INTO tbltransactions (transaction_type, transaction_date, transaction_quantity, material_id) VALUES (?, ?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, type);
            ps.setString(2, date);
            ps.setInt(3, quantity);
            ps.setInt(4, materialId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
	
	public List<Integer> getTransactionHistory(int materialId, String type, int days) {
	    List<Integer> history = new ArrayList<>();
	    String sql = "SELECT transaction_quantity FROM tbltransactions " +
	                 "WHERE material_id = ? AND transaction_type = ? " +
	                 "AND transaction_date >= DATE_SUB(CURDATE(), INTERVAL ? DAY)";
	    try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
	        ps.setInt(1, materialId);
	        ps.setString(2, type);
	        ps.setInt(3, days);
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            history.add(rs.getInt("transaction_quantity"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return history;
	}

}

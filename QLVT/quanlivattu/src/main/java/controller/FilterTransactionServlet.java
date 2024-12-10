package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import DAO.TransactionDAO;
import model.Transaction;

/**
 * Servlet implementation class FilterTransactionServlet
 */
@WebServlet("/FilterTransactionServlet")
public class FilterTransactionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TransactionDAO transactionDAO = new TransactionDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FilterTransactionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");

	        String fromDate = request.getParameter("fromDate");
	        String toDate = request.getParameter("toDate");

	        List<Transaction> transactions = transactionDAO.getTransactionsByDateRange(fromDate, toDate);
	        Gson gson = new Gson();
	        String json = gson.toJson(transactions);
	        response.getWriter().write(json);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import model.Transaction;
import model.TransactionDetail;
import service.TransactionService;
import dao.TransactionDetailDAO;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author hp
 */
public class TransactionDetailService {

    TransactionDetailDAO detailDAO = new TransactionDetailDAO();

    public int getCreatedID() {
        List<Transaction> transactions = (new TransactionService()).getAllList();
        int key = 0;

        if (!transactions.isEmpty()) {
            Transaction lastTransaction = transactions.get(transactions.size() - 1);
            key = lastTransaction.getTransactionID();
        }
        return key;
    }

    public void createTransactionDetail(List<TransactionDetail> transactionDetail) throws SQLException {
        for (TransactionDetail td : transactionDetail) {
            System.out.println(getCreatedID()+" " + td);
            (new TransactionDetailDAO()).createTransactionDetail(getCreatedID(), td.getRoomCode(), td.getTime(), td.getType(), td.getPrice());
        }
    }

    public List<TransactionDetail> getTransDetailByID(int id) {
        return detailDAO.getAllTransactionDetail(id);
    }

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dbConnect.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Transaction;

/**
 *
 * @author hp
 */
public class TransactionDAO {

    public TransactionDAO() {
        connectDB();
    }

    Connection cnn;
    Statement stm;
    ResultSet rs;

    private void connectDB() {
        try {
            cnn = (new DBContext()).connection;
            System.out.println("Connect successfully");
        } catch (Exception e) {
            System.out.println("Connect error" + e.getMessage());
        }
    }

    private void closeConnection() {
        try {
            cnn.close();
            System.out.println("db closed");
        } catch (SQLException e) {
            System.out.println("Can't close");
        }
    }

    public void createTransaction(String customerName, String customerPhoneNumber, String date, int price) throws SQLException {
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date parsedDate = dateFormat.parse(date);
            System.out.println(parsedDate);
            java.sql.Date sqlDate = new java.sql.Date(parsedDate.getTime());
            System.out.println(sqlDate);

            String sql = "INSERT INTO transaction(customerName, customerPhoneNumber, date, price) VALUES (?, ?, ?, ?)";
            try {
                cnn.setAutoCommit(false);
                PreparedStatement pt = cnn.prepareStatement(sql);

                pt.setString(1, customerName);
                pt.setString(2, customerPhoneNumber);
                pt.setDate(3, sqlDate);
                pt.setInt(4, price);
                pt.executeUpdate();

                cnn.commit();
                pt.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
                cnn.rollback();
            } finally {
                cnn.setAutoCommit(true);
                closeConnection();
            }
        } catch (ParseException ex) {
            Logger.getLogger(TransactionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Transaction> getAllTransaction() {
        List<Transaction> transactions = new ArrayList<>();
        String sql = "SELECT * from transaction";
        try {
            PreparedStatement pt = cnn.prepareStatement(sql);
            rs = pt.executeQuery();
            while (rs.next()) {
                int transactionID = rs.getInt(1);
                String customerName = rs.getString(2);
                String customerPhoneNumber = rs.getString(3);
                SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
                String date = "";
                if (rs.getDate(4) != null) {
                    date = f.format(rs.getDate(4));
                }
                int price = rs.getInt(5);

                Transaction t = new Transaction(transactionID, customerName, customerPhoneNumber, date, price);
                transactions.add(t);
            }

            pt.close();
            rs.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            closeConnection();
        }
        return transactions;
    }
    
    public List<Transaction> getSortAllTransaction(int currentPage) {
        List<Transaction> transactions = new ArrayList<>();
        String sql = "SELECT * from transaction order by date LIMIT ?, 5";
        try {
            PreparedStatement pt = cnn.prepareStatement(sql);
            pt.setInt(1, currentPage * 5 - 5);
            rs = pt.executeQuery();
            while (rs.next()) {
                int transactionID = rs.getInt(1);
                String customerName = rs.getString(2);
                String customerPhoneNumber = rs.getString(3);
                SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
                String date = "";
                if (rs.getDate(4) != null) {
                    date = f.format(rs.getDate(4));
                }
                int price = rs.getInt(5);

                Transaction t = new Transaction(transactionID, customerName, customerPhoneNumber, date, price);
                transactions.add(t);
            }

            pt.close();
            rs.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            closeConnection();
        }
        return transactions;
    }
    public Transaction getTransactionById(int id) {
        Transaction transaction = null;
        String sql = "SELECT * from transaction where transactionID = ?";
        try {
            PreparedStatement pt = cnn.prepareStatement(sql);
            pt.setInt(1, id);
            rs = pt.executeQuery();
            while (rs.next()) {
                int transactionID = rs.getInt(1);
                String customerName = rs.getString(2);
                String customerPhoneNumber = rs.getString(3);
                SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
                String date = "";
                if (rs.getDate(4) != null) {
                    date = f.format(rs.getDate(4));
                }
                int price = rs.getInt(5);

                transaction = new Transaction(transactionID, customerName, customerPhoneNumber, date, price);
            }

            pt.close();
            rs.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            closeConnection();
        }
        return transaction;
    }
    
    public int getNumberPage() {
        String sql = "SELECT count(*) FROM transaction";

        try {
            PreparedStatement pt = cnn.prepareStatement(sql);
            rs = pt.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                int countPage = 0;
                countPage = total / 5;
                if (total % 5 != 0) {
                    countPage++;
                }
                return countPage;
            }
            rs.close();
            pt.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            closeConnection();
        }

        return 0;
    }
    
}

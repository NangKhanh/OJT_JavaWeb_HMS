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
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
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

    public void createTransaction(String customerName, String customerPhoneNumber, String date) throws SQLException {
        String inputFormat = "yyyy-MM-dd'T'HH:mm";
//      Định dạng của kiểu datetime trong SQL
        String outputFormat = "yyyy-MM-dd HH:mm:ss";
//      Định nghĩa DateTimeFormatter cho các định dạng
        DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern(inputFormat);
        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern(outputFormat);
//      Chuyển đổi chuỗi datetime local thành LocalDateTime
        LocalDateTime localDateTime = LocalDateTime.parse(date, inputFormatter);
//      Chuyển đổi LocalDateTime thành Timestamp (kiểu datetime trong SQL)
        Timestamp sqlTimestamp = Timestamp.valueOf(localDateTime.format(outputFormatter));
        System.out.println(sqlTimestamp);
        String sql = "INSERT INTO transaction(customerName, customerPhoneNumber, checkinDate, checkoutStatus) VALUES (?, ?, ?, 0)";
        try {
            cnn.setAutoCommit(false);
            PreparedStatement pt = cnn.prepareStatement(sql);

            pt.setString(1, customerName);
            pt.setString(2, customerPhoneNumber);
            pt.setTimestamp(3, sqlTimestamp);
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
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy, HH:mm:ss");
                String dateTimeString = "";
                if (rs.getTimestamp(4) != null) {
                    Timestamp timestamp = rs.getTimestamp(4);
                    LocalDateTime localDateTime = timestamp.toLocalDateTime();
                    dateTimeString = localDateTime.format(formatter);
                }
                int price = rs.getInt(6);

                Transaction t = new Transaction(transactionID, customerName, customerPhoneNumber, dateTimeString, price);
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
        String sql = "SELECT * from transaction order by checkinDate LIMIT ?, 5";
        try {
            PreparedStatement pt = cnn.prepareStatement(sql);
            pt.setInt(1, currentPage * 5 - 5);
            rs = pt.executeQuery();
            while (rs.next()) {
                int transactionID = rs.getInt(1);
                String customerName = rs.getString(2);
                String customerPhoneNumber = rs.getString(3);
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy, HH:mm:ss");
                String checkinDate = "";
                if (rs.getTimestamp(4) != null) {
                    Timestamp timestamp = rs.getTimestamp(4);
                    LocalDateTime localDateTime = timestamp.toLocalDateTime();
                    checkinDate = localDateTime.format(formatter);
                }
                String checkoutDate = "";
                if (rs.getTimestamp(5) != null) {
                    Timestamp timestamp = rs.getTimestamp(5);
                    LocalDateTime localDateTime = timestamp.toLocalDateTime();
                    checkoutDate = localDateTime.format(formatter);
                }
                int price = rs.getInt(6);
                int checoutStatus = rs.getInt(7);
                Transaction t = new Transaction(transactionID, customerName, customerPhoneNumber, checkinDate, checkoutDate, price, checoutStatus);
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
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy, HH:mm:ss");
                String checkinDate = "";
                if (rs.getTimestamp(4) != null) {
                    Timestamp timestamp = rs.getTimestamp(4);
                    LocalDateTime localDateTime = timestamp.toLocalDateTime();
                    checkinDate = localDateTime.format(formatter);
                }
                String checkoutDate = "";
                if (rs.getTimestamp(5) != null) {
                    Timestamp timestamp = rs.getTimestamp(5);
                    LocalDateTime localDateTime = timestamp.toLocalDateTime();
                    checkoutDate = localDateTime.format(formatter);
                }
                int price = rs.getInt(6);
                int checoutStatus = rs.getInt(7);
                transaction = new Transaction(transactionID, customerName, customerPhoneNumber, checkinDate, checkoutDate, price, checoutStatus);
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

    public void checkout(int id, String checkoutDate, int price) throws SQLException {
        String inputFormat = "MM/dd/yyyy, HH:mm:ss";
//      Định dạng của kiểu datetime trong SQL
        String outputFormat = "yyyy-MM-dd HH:mm:ss";
//      Định nghĩa DateTimeFormatter cho các định dạng
        DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern(inputFormat);
        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern(outputFormat);
//      Chuyển đổi chuỗi datetime local thành LocalDateTime
        LocalDateTime localDateTime = LocalDateTime.parse(checkoutDate, inputFormatter);
//      Chuyển đổi LocalDateTime thành Timestamp (kiểu datetime trong SQL)
        Timestamp sqlTimestamp = Timestamp.valueOf(localDateTime.format(outputFormatter));
        System.out.println(sqlTimestamp);
        
        String sql = "UPDATE transaction set checkoutDate = ?, price = ?, checkoutStatus = 1 where transactionID = ?";
        try {
            cnn.setAutoCommit(false);
            PreparedStatement pt = cnn.prepareStatement(sql);
            pt.setTimestamp(1, sqlTimestamp);
            pt.setInt(2, price);
            pt.setInt(3, id);
            pt.executeUpdate();
            
            cnn.commit();
            pt.close();
        } catch (SQLException e) {
            cnn.rollback();
        } finally{
            cnn.setAutoCommit(true);
            closeConnection();
        }
    }

}

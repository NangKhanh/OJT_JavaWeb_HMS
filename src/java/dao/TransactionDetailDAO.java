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
import java.util.ArrayList;
import java.util.List;
import model.TransactionDetail;

/**
 *
 * @author hp
 */
public class TransactionDetailDAO {

    public TransactionDetailDAO() {
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

    public void createTransactionDetail(int createdID, String roomCode, int time, int type, int price) throws SQLException {
        String sql = "INSERT INTO transactiondetail(transactionID, roomCode, time, type, price) VALUES (?, ?, ?, ? ,?)";
        try {
            cnn.setAutoCommit(false);
            PreparedStatement pt = cnn.prepareStatement(sql);
            pt.setInt(1, createdID);
            pt.setString(2, roomCode);
            pt.setInt(3, time);
            pt.setInt(4, type);
            pt.setInt(5, price);
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

    public List<TransactionDetail> getAllTransactionDetail(int id) {
        List<TransactionDetail> transactions = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM transactiondetail\n"
                + "INNER JOIN room\n"
                + "ON transactiondetail.roomCode = room.roomCode where transactiondetail.transactionID = ?;";
        try {
            PreparedStatement pt = cnn.prepareStatement(sql);
            pt.setInt(1, id);
            rs = pt.executeQuery();
            while (rs.next()) {
                int transactionID = rs.getInt("transactionID");
                String roomCode = rs.getString("roomCode");
                int time = rs.getInt("time");
                int type = rs.getInt("type");
                int price = rs.getInt("price");
                String name = rs.getString("name");
                TransactionDetail detail = new TransactionDetail(transactionID, roomCode, name, time, type, price);
                transactions.add(detail);
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

}

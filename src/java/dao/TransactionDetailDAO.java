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
import model.Room;
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

    public void createTransactionDetail(int createdID, String roomCode) throws SQLException {
        String sql = "INSERT INTO transactiondetail(transactionID, roomCode) VALUES (?, ?)";
        try {
            cnn.setAutoCommit(false);
            PreparedStatement pt = cnn.prepareStatement(sql);
            pt.setInt(1, createdID);
            pt.setString(2, roomCode);
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

    public List<Room> getAllTransactionDetail(int id) {
        List<Room> rooms = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM transactiondetail\n"
                + "INNER JOIN room\n"
                + "ON transactiondetail.roomCode = room.roomCode where transactiondetail.transactionID = ?;";
        try {
            PreparedStatement pt = cnn.prepareStatement(sql);
            pt.setInt(1, id);
            rs = pt.executeQuery();
            while (rs.next()) {
                String roomCode = rs.getString("roomCode");
                String name = rs.getString("name");
                int hPrice =rs.getInt("pricePerHour");
                int dPrice =rs.getInt("pricePerDay");
                Room r = new Room(roomCode, name, hPrice, dPrice);
                rooms.add(r);
            }

            pt.close();
            rs.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            closeConnection();
        }
        return rooms;
    }

}

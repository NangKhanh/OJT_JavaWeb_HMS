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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Room;

/**
 *
 * @author hp
 */
public class RoomDAO {

    public RoomDAO() {
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

    public List<Room> getListRoom(int curentPage) {

        List<Room> rooms = new ArrayList<>();
        String sql = "SELECT * FROM room LIMIT ?, 5";
        try {
            PreparedStatement pt = cnn.prepareStatement(sql);
            pt.setInt(1, curentPage * 5 - 5);
            rs = pt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("roomID");
                String code = rs.getString("roomCode");
                String name = rs.getString("name");
                int status = rs.getInt("status");
                int pHour = rs.getInt("pricePerHour");
                int pDay = rs.getInt("pricePerDay");
                Room r = new Room(id, code, name, status, pHour, pDay);
                rooms.add(r);
            }
            pt.close();
            rs.close();
        } catch (SQLException e) {
            System.out.println("list error :" + e.getMessage());
        } finally {
            closeConnection();
        }
        return rooms;
    }

    public boolean editRoom(String name, int pHour, int pDay, int status, String code) throws SQLException {
        String sql = "UPDATE room set name = ?, pricePerHour = ?, pricePerDay = ?, status = ? WHERE roomCode = ?";
        try {
            cnn.setAutoCommit(false);
            PreparedStatement pt = cnn.prepareStatement(sql);
            pt.setString(1, name);
            pt.setInt(2, pHour);
            pt.setInt(3, pDay);
            pt.setInt(4, status);
            pt.setString(5, code);
            pt.executeUpdate();

            cnn.commit();
            pt.close();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            cnn.rollback();
        } finally {
            cnn.setAutoCommit(true);
            closeConnection();
        }
        return false;
    }

    public boolean deteteRoom(String code){
        // TODO: kt trang thai phong trc khi xoa
        String sql = "DELETE FROM room WHERE roomCode = ?";
        try {
            cnn.setAutoCommit(false);
            PreparedStatement pt = cnn.prepareStatement(sql);
            pt.setString(1, code);
            pt.executeUpdate();

            cnn.commit();
            pt.close();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            try {
                cnn.rollback();
            } catch (SQLException ex) {
                Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        } finally {
            try {
                cnn.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            closeConnection();
        }
        return false;
    }

    public boolean addRoom(String name, String code, int pHour, int pDay) throws SQLException {
        String sql = "INSERT INTO room(name, roomCode, pricePerHour, pricePerDay, status) VALUES (?, ?, ?, ?, 1)";
        try {
            cnn.setAutoCommit(false);
            PreparedStatement pt = cnn.prepareStatement(sql);
            pt.setString(1, name);
            pt.setString(2, code);
            pt.setInt(3, pHour);
            pt.setInt(4, pDay);
            pt.executeUpdate();

            cnn.commit();
            pt.close();
            return true;
        } catch (SQLException ex) {
            cnn.rollback();
            System.out.println(ex.getMessage());
        } finally {
            cnn.setAutoCommit(true);
            closeConnection();
        }
        return false;

    }

    public int getNumberPage() {
        String sql = "SELECT count(*) FROM room";

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

    public List<Room> getListRoom() {
        List<Room> rooms = new ArrayList<>();
        String sql = "SELECT * FROM room WHERE status = 1";
        try {
            PreparedStatement pt = cnn.prepareStatement(sql);
            rs = pt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("roomID");
                String code = rs.getString("roomCode");
                String name = rs.getString("name");
                int status = rs.getInt("status");
                int pHour = rs.getInt("pricePerHour");
                int pDay = rs.getInt("pricePerDay");
                Room r = new Room(id, code, name, status, pHour, pDay);
                rooms.add(r);
            }
            pt.close();
            rs.close();
        } catch (SQLException e) {
            System.out.println("list error :" + e.getMessage());
        } finally {
            closeConnection();
        }
        return rooms;
    }

    public Room getRoomByCode(String rCode) {
        String sql = "SELECT * FROM room where roomCode = ?";
        Room room = null;
        try {
            PreparedStatement pt = cnn.prepareStatement(sql);
            pt.setString(1, rCode);
            rs = pt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("roomID");
                String code = rs.getString("roomCode");
                String name = rs.getString("name");
                int status = rs.getInt("status");
                int pHour = rs.getInt("pricePerHour");
                int pDay = rs.getInt("pricePerDay");
                room = new Room(id, code, name, status, pHour, pDay);
            }
            pt.close();
            rs.close();
        } catch (SQLException e) {
            System.out.println("list error :" + e.getMessage());
        } finally {
            closeConnection();
        }
        return room;
    }

    public void setCloseRoom(String roomCode) throws SQLException {
        String sql = "UPDATE room set status = 0 WHERE roomCode = ?";
        try {
            cnn.setAutoCommit(false);
            PreparedStatement pt = cnn.prepareStatement(sql);
            pt.setString(1, roomCode);
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

    public void setOppenRoom(String code) throws SQLException {
        String sql = "UPDATE room set status = 1 WHERE roomCode = ?";
        try {
            cnn.setAutoCommit(false);
            PreparedStatement pt = cnn.prepareStatement(sql);
            pt.setString(1, code);
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
}

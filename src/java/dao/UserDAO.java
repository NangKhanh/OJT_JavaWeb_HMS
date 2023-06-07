/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import model.User;
import dbConnect.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
/**
 *
 * @author hp
 */
public class UserDAO {

    public UserDAO() {
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
    
    public User checkLogin(String userName, String password){
        User user = null;
        String sql = "SELECT * FROM user WHERE useName = ? AND password = ?";
        try {
            PreparedStatement pt = cnn.prepareStatement(sql);
            pt.setString(1, userName);
            pt.setString(2, password);
            rs = pt.executeQuery();
            while (rs.next()) {                
                int id = rs.getInt("useID");
                String name = rs.getString("useName");
                String pass = rs.getString("password");
                user = new User(id, userName, pass);
            }
            pt.close();
            rs.close();
        } catch (SQLException e) {
            System.out.println("login error :" +e.getMessage());
        }finally{
            closeConnection();
        }
        
        return user;
    }
}

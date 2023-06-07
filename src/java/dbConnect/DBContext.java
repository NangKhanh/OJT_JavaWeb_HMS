/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dbConnect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author hp
 */
public class DBContext {

    public Connection connection;

    public DBContext() {
        try {
            String url = "jdbc:mysql://localhost:3306/hms";
            String username = "root";
            String password = "12345"; // Thay doi tren tung may
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }

     
    public static void main(String[] args) {
        DBContext db = new DBContext();
        System.out.println(db.connection);
    }
}

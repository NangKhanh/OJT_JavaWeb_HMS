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
import model.Statistic;

/**
 *
 * @author hp
 */
public class StatisticDAO {

    public StatisticDAO() {
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

    public List<Statistic> getStatisticList(int currentYear) {
        List<Statistic> statistics = new ArrayList<>();
        String sql = "SELECT \n"
                + "    YEAR(date) AS year,\n"
                + "    MONTH(date) AS month,\n"
                + "    SUM(CASE WHEN (DAY(date) - 1) DIV 7 + 1 = 1 THEN price ELSE 0 END) AS week1,\n"
                + "    SUM(CASE WHEN (DAY(date) - 1) DIV 7 + 1 = 2 THEN price ELSE 0 END) AS week2,\n"
                + "    SUM(CASE WHEN (DAY(date) - 1) DIV 7 + 1 = 3 THEN price ELSE 0 END) AS week3,\n"
                + "    SUM(CASE WHEN (DAY(date) - 1) DIV 7 + 1 = 4 THEN price ELSE 0 END) AS week4,\n"
                + "    SUM(CASE WHEN (DAY(date) - 1) DIV 7 + 1 = 5 THEN price ELSE 0 END) AS week5,\n"
                + "    SUM(price) AS total\n"
                + "FROM transaction WHERE YEAR(date) = ?\n"
                + "GROUP BY YEAR(date), month\n"
                + "ORDER BY YEAR(date), month";
        try {
            PreparedStatement pt = cnn.prepareStatement(sql);
            pt.setInt(1, currentYear);
            rs = pt.executeQuery();
            while (rs.next()) {
                int year = rs.getInt("year");
                String month = convertToMonthString(rs.getInt("month"));
                int week1 = rs.getInt("week1");
                int week2 = rs.getInt("week2");
                int week3 = rs.getInt("week3");
                int week4 = rs.getInt("week4");
                int week5 = rs.getInt("week5");
                int total = rs.getInt("total");
                Statistic s = new Statistic(year, month, week1, week2, week3, week4, week5, total);
                statistics.add(s);
            }
            rs.close();
            pt.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            closeConnection();
        }
        return statistics;
    }

    static String convertToMonthString(int number) {
        String monthString = "";

        switch (number) {
            case 1:
                monthString = "January";
                break;
            case 2:
                monthString = "February";
                break;
            case 3:
                monthString = "March";
                break;
            case 4:
                monthString = "April";
                break;
            case 5:
                monthString = "May";
                break;
            case 6:
                monthString = "June";
                break;
            case 7:
                monthString = "July";
                break;
            case 8:
                monthString = "August";
                break;
            case 9:
                monthString = "September";
                break;
            case 10:
                monthString = "October";
                break;
            case 11:
                monthString = "November";
                break;
            case 12:
                monthString = "December";
                break;
            default:
                monthString = "Invalid month";
                break;
        }

        return monthString;
    }

}

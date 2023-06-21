/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.User;
import dao.UserDAO;
import model.Statistic;
import service.StatisticService;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import service.UserService;

/**
 *
 * @author hp
 */
@WebServlet(urlPatterns = "/home")
public class LogIn extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String message;
        String year = req.getParameter("currentPage");
        if (year == null) {
            year = "2023";
        }
        int currentYear = Integer.parseInt(year);
        System.out.println("login infor :" + username + " " + password);
        User user = (new UserService()).checkLogin(username, password);
        if (user != null) {
            System.out.println(user);
            HttpSession session = req.getSession();
            session.setAttribute("useName", user.getUserName());

            List<Statistic> statistics = (new StatisticService()).getStatisticList(currentYear);
            Statistic lastStatistic = null;
            for (Statistic statistic : statistics) {
                System.out.println(statistic);
                lastStatistic = statistic;
            }
            req.setAttribute("lastStatistic", lastStatistic);
            req.setAttribute("statistics", statistics);
            req.getRequestDispatcher("home.jsp").forward(req, resp);
        } else {
            message = "Wrong user name or password! Try again.";
            req.setAttribute("message", message);
            req.setAttribute("useName", req.getParameter("username"));
            req.setAttribute("password", req.getParameter("password"));
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        String year = req.getParameter("currentPage");
        if (year == null) {
            year = "2023";
        }
        int currentYear = Integer.parseInt(year);
        if (session != null) {
            String useName = (String) session.getAttribute("useName");
            if (useName != null && !useName.isEmpty()) {
                List<Statistic> statistics = (new StatisticService()).getStatisticList(currentYear);
                Statistic lastStatistic = null;
                for (Statistic statistic : statistics) {
                    System.out.println(statistic);
                    lastStatistic = statistic;
                }
                req.setAttribute("lastStatistic", lastStatistic);
                req.setAttribute("statistics", statistics);
                req.getRequestDispatcher("home.jsp").forward(req, resp);
            } else {
                req.getRequestDispatcher("login.jsp").forward(req, resp);
            }
        } else {
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }

}

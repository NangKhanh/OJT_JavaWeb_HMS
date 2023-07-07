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
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import model.Transaction;
import service.TransactionService;

/**
 *
 * @author hp
 */
@WebServlet(urlPatterns = "/transactionHistory")
public class TransactionHistoryController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int pageNumber = (new TransactionService()).getPageNumber();
        String indexPage = req.getParameter("currentPage");
        if (indexPage == null) {
            indexPage = "1";
        }
        int currentPage = Integer.parseInt(indexPage);
        System.out.println("current Page : " + currentPage);
        List<Transaction> transactions = (new TransactionService()).getSortAllTransaction(currentPage);
        req.setAttribute("currentPage", currentPage);
        req.setAttribute("pageNumber", pageNumber);
        req.setAttribute("transactions", transactions);
        req.getRequestDispatcher("transactionHistory.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session != null) {
            String useName = (String) session.getAttribute("useName");
            int pageNumber = (new TransactionService()).getPageNumber();
            String indexPage = req.getParameter("currentPage");
            if (indexPage == null) {
                indexPage = "1";
            }
            int currentPage = Integer.parseInt(indexPage);
            System.out.println("current Page : " + currentPage);
            List<Transaction> transactions = (new TransactionService()).getSortAllTransaction(currentPage);
            req.setAttribute("currentPage", currentPage);
            req.setAttribute("pageNumber", pageNumber);
            req.setAttribute("transactions", transactions);
            req.getRequestDispatcher("transactionHistory.jsp").forward(req, resp);
            if (useName != null && !useName.isEmpty()) {
            } else {
                req.getRequestDispatcher("login.jsp").forward(req, resp);
            }
        } else {
            req.setAttribute("message", "Session time out! login again");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }

}

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
import java.util.ArrayList;
import java.util.List;
import model.Transaction;
import model.TransactionDetail;
import service.TransactionDetailService;
import service.TransactionService;
/**
 *
 * @author hp
 */
@WebServlet(urlPatterns = "/transactionDetail")
public class TransactionDetailHistory extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        List<TransactionDetail> details = (new TransactionDetailService()).getTransDetailByID(id);
        Transaction transaction = (new TransactionService()).getTransactionByID(id);
        
        for (TransactionDetail detail : details) {
            System.out.println(detail);
        }
        System.out.println(transaction);
        req.setAttribute("transaction", transaction);
        req.setAttribute("roombill", details);
        req.getRequestDispatcher("transactionDetail.jsp").forward(req, resp);
    }
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import com.google.gson.reflect.TypeToken;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import model.Transaction;
import model.TransactionDetail;
import service.TransactionService;
import service.TransactionDetailService;

/**
 *
 * @author hp
 */
@WebServlet(urlPatterns = "/submitTransaction")
public class SubmitTransaction extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String transactionData = req.getParameter("transactionData");
        String billData = req.getParameter("billData");
        Transaction transactionInfor = null;
        List<TransactionDetail> transactionDetail = null;
        //RoomService roomService = new RoomService();
        TransactionService transactionService = new TransactionService();
        TransactionDetailService detailService = new TransactionDetailService();

        try {
            // Chuyển đổi JSON thành đối tượng Java bằng Gson
            Gson gson = new Gson();
            transactionInfor = gson.fromJson(transactionData, Transaction.class);
            transactionDetail = gson.fromJson(billData, new TypeToken<List<TransactionDetail>>() {
            }.getType());
        } catch (JsonSyntaxException e) {
            System.out.println(e.getMessage());
        }
        System.out.println(transactionInfor);
        for (TransactionDetail room : transactionDetail) {
            System.out.println(room);
        }

        try {
            transactionService.createTransaction(transactionInfor);
            detailService.createTransactionDetail(transactionDetail);
            System.out.println("final key :" +detailService.getCreatedID());
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        req.getRequestDispatcher("./transactionManagerment").forward(req, resp);
    }
}

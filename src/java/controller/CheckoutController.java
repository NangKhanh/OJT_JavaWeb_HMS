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
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import service.TransactionService;
import service.RoomService;
/**
 *
 * @author hp
 */
@WebServlet(urlPatterns = "/checkout")
public class CheckoutController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String checkoutDate = req.getParameter("checkoutDate");
        int price = Integer.parseInt(req.getParameter("totalPirce"));
        String roomCodes = req.getParameter("roomCode");
        System.out.println(roomCodes);
        String[] code = roomCodes.split("\\|\\|");
        for (String string : code) {
            System.out.println("test "+string);
        }
        try {
            (new TransactionService()).checkout(id, checkoutDate, price);
            (new RoomService()).setOpenRoom(code);
        } catch (SQLException ex) {
            Logger.getLogger(CheckoutController.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("checkout information : " + id + " || " + checkoutDate + " || " + price);
        req.setAttribute("id", id);
        req.getRequestDispatcher("./transactionHistory?currentPage=1").forward(req, resp);
    }
}

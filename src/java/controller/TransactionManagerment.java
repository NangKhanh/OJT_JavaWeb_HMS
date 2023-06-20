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
import model.Room;
import service.RoomService;

/**
 *
 * @author hp
 */
@WebServlet(urlPatterns = "/transactionManagerment")
public class TransactionManagerment extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Room> listRoom = (new RoomService().getAllRoom());
        req.setAttribute("rooms", listRoom);
        req.getRequestDispatcher("transactionManagerment.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session != null) {
            String useName = (String) session.getAttribute("useName");
            if (useName != null && !useName.isEmpty()) {
                List<Room> listRoom = (new RoomService().getAllRoom());
                req.setAttribute("rooms", listRoom);
                req.getRequestDispatcher("transactionManagerment.jsp").forward(req, resp);
            } else {
                req.getRequestDispatcher("login.jsp").forward(req, resp);
            }
        } else {
            req.setAttribute("message", "Session time out! login again");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }

}

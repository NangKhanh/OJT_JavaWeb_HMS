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
import service.RoomService;

/**
 *
 * @author hp
 */
@WebServlet(urlPatterns = "/deleteRoom")
public class HideRoomController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String code = req.getParameter("code");
        System.out.println("Hide Room : code: " + code);
        
        try {
            boolean success = (new RoomService()).hideRoom(code);
        } catch (SQLException ex) {
            Logger.getLogger(EditRoomController.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex.getMessage());
        }
        req.setAttribute("currentPage", "1");
        req.getRequestDispatcher("./roomManagerment").forward(req, resp);
    }

}

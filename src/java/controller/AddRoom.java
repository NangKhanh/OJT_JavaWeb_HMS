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
@WebServlet(urlPatterns = "/addRoom")
public class AddRoom extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String code = req.getParameter("code");
        int pHour = Integer.parseInt(req.getParameter("pHour"));
        int pDay = Integer.parseInt(req.getParameter("pDay"));
        System.out.println("Add Room information :" + name + " " + code + " " + pHour + " " + pDay );
        
        try {
            boolean success = (new RoomService()).addRoom(name, code, pHour, pDay);
        } catch (SQLException ex) {
            Logger.getLogger(AddRoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        req.getRequestDispatcher("./roomManagerment").forward(req, resp);
    }

}

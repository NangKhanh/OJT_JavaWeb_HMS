/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import model.Room;
import model.Transaction;
import service.RoomService;
/**
 *
 * @author hp
 */
@WebServlet(urlPatterns = "/addbill")
public class AddBill extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Đọc dữ liệu JSON được gửi từ client
        String transactionData = req.getParameter("transactionData");
        String selectedRoom = req.getParameter("roomSelected");
        Transaction transaction = null;
        
        Room room = (new RoomService().getRoomByCode(selectedRoom));
        List<Room> listRoom = (new RoomService().getAllRoom());
        List<Room> roombill = new ArrayList<>();
        roombill.add(room);
        try {
            // Chuyển đổi JSON thành đối tượng Java bằng Gson
            Gson gson = new Gson();
             transaction = gson.fromJson(transactionData, Transaction.class);

            // Xử lý dữ liệu
            // ...
        } catch (JsonSyntaxException e) {
            // Xử lý lỗi cú pháp JSON
            System.out.println(e.getMessage());
        }
        System.out.println("bill information :"+transaction+" "+room);
        // Gửi phản hồi về client
        req.setAttribute("transaction", transaction);
        req.setAttribute("roombill", roombill);
        req.setAttribute("rooms", listRoom);
        req.getRequestDispatcher("transactionManagerment.jsp").forward(req, resp);
//        resp.setContentType("application/json");    
//        resp.setCharacterEncoding("UTF-8");
//        resp.getWriter().write("Dữ liệu đã được nhận và xử lý thành công");
    }
}

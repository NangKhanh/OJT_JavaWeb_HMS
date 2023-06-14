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
import java.util.List;
import model.Room;
import model.Transaction;
import service.RoomService;
import service.TransactionService;

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
        String billData = req.getParameter("billData");
        System.out.println("billData " + billData);
        String selectedRoom = req.getParameter("roomSelected");
        Transaction transactionInfor = null;
        List<Room> roombill = null;

        List<Room> listRoom = (new RoomService().getAllRoom());
        try {
            // Chuyển đổi JSON thành đối tượng Java bằng Gson
            Gson gson = new Gson();
            transactionInfor = gson.fromJson(transactionData, Transaction.class);
            roombill = gson.fromJson(billData, new TypeToken<List<Room>>() {
            }.getType());
        } catch (JsonSyntaxException e) {
            System.out.println(e.getMessage());
        }
//        if (roombill != null) {
//            for (Room d : roombill) {
//                System.out.println(d);
//            }
//        } else {
//            System.out.println("null bill infor");
//        }
        if (!selectedRoom.equals("-1")) {
            Room room = (new RoomService().getRoomByCode(selectedRoom));
            room.setTime(1);
            room.setType(0);
            roombill.add(room);
        }
        int totalPrice = (new TransactionService()).calTotalPrice(roombill);
        listRoom = (new TransactionService()).fillerRoomSelected(listRoom, roombill);
        transactionInfor.setPrice(totalPrice);

        // Gửi phản hồi về client
        req.setAttribute("transaction", transactionInfor);
        req.setAttribute("roombill", roombill);
        req.setAttribute("rooms", listRoom);
        req.getRequestDispatcher("transactionManagerment.jsp").forward(req, resp);
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import java.util.Iterator;
import java.util.List;
import model.Room;
import model.Transaction;
import dao.TransactionDAO;
import java.sql.SQLException;

/**
 *
 * @author hp
 */
public class TransactionService {

    TransactionDAO transactionDAO = new TransactionDAO();

    public List<Room> fillerRoomSelected(List<Room> listRoom, List<Room> roombill) {
        Iterator<Room> iterator = listRoom.iterator();
        while (iterator.hasNext()) {
            Room obj = iterator.next();
            for (Room room : roombill) {
                String a = obj.getRoomCode();
                String b = room.getRoomCode();
                if (a.equals(b)) {
                    iterator.remove();
                    break;
                }
            }
        }
        return listRoom;
    }

    public int calTotalPrice(List<Room> roombill) {
        int totalPrice = 0;
        for (Room r : roombill) {
            //System.out.println(r);
            if (r.getType() == 0) {
                totalPrice += r.getPricePerHour() * r.getTime();
            }
            if (r.getType() == 1) {
                totalPrice += r.getPricePerDay() * r.getTime();
            }
        }
        return totalPrice;
    }

    public void createTransaction(Transaction transactionInfor) {
        try {
            transactionDAO.createTransaction(transactionInfor.getCustomerName(), transactionInfor.getCustomerPhoneNumber(), transactionInfor.getCheckinDate());
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    
    public List<Transaction> getAllList(){
        return transactionDAO.getAllTransaction();
    }
    
    public List<Transaction> getSortAllTransaction(int currentPage){
        return transactionDAO.getSortAllTransaction(currentPage);
    }
    
    public Transaction getTransactionByID(int id){
        return transactionDAO.getTransactionById(id);
    }
    
    public int getPageNumber(){
        return transactionDAO.getNumberPage();
    }

    public void checkout(int id, String checkoutDate, int price) throws SQLException {
        transactionDAO.checkout(id, checkoutDate, price);
    }
}

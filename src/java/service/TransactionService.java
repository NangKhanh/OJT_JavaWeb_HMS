/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import java.util.Iterator;
import java.util.List;
import model.Room;

/**
 *
 * @author hp
 */
public class TransactionService {

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
                totalPrice += r.getPricePerHour()*r.getTime();
            }
            if (r.getType() == 1) {
                totalPrice += r.getPricePerDay()*r.getTime();
            }
        }
        return totalPrice;
    }

}

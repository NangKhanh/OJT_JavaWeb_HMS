/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import dao.RoomDAO;
import java.sql.SQLException;
import java.util.List;
import model.Room;

/**
 *
 * @author hp
 */
public class RoomService {

    public RoomDAO roomDAO = new RoomDAO();

    public List<Room> getListRoom() {
        List<Room> rooms = roomDAO.getListRoom();
        return rooms;
    }

    public boolean ediRoom(String name, String code, int pHour, int pDay, int status) throws SQLException {
        return roomDAO.editRoom(name, pHour, pDay, status, code);
    }
    
    
}

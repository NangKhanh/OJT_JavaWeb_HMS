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

    public List<Room> getAllRoom() {
        List<Room> rooms = roomDAO.getListRoom();
        return rooms;
    }
    
    public List<Room> getListRoom(int currentPage) {
        List<Room> rooms = roomDAO.getListRoom(currentPage);
        return rooms;
    }

    public  Room getRoomByCode(String code){
        return roomDAO.getRoomByCode(code);
    }
    
    public boolean editRoom(String name, String code, int pHour, int pDay, int status) throws SQLException {
        return roomDAO.editRoom(name, pHour, pDay, status, code);
    }
    
    public boolean hideRoom(String code) throws SQLException {
        return roomDAO.deteteRoom(code);
    }

    public boolean addRoom(String name, String code, int pHour, int pDay) throws SQLException {
        return roomDAO.addRoom(name, code, pHour, pDay);
    }
    
    public int getPageNumber(){
        return roomDAO.getNumberPage();
    }
}

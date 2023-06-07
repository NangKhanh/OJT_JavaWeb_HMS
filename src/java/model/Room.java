/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import lombok.Data;
/**
 *
 * @author hp
 */
public @Data class Room {
    private int roomID;
    private String roomCode;
    private String name;
    private int status;
    private int pricePerHour;
    private int pricePerDay;
    private int showStatus;

    public Room(int roomID, String roomCode, String name, int quantity, int pricePerHour, int pricePerDay, int status) {
        this.roomID = roomID;
        this.roomCode = roomCode;
        this.name = name;
        this.status = quantity;
        this.pricePerHour = pricePerHour;
        this.pricePerDay = pricePerDay;
        this.showStatus = status;
    }

    public Room(String roomCode, String name, int quantity, int pricePerHour, int pricePerDay, int status) {
        this.roomCode = roomCode;
        this.name = name;
        this.status = quantity;
        this.pricePerHour = pricePerHour;
        this.pricePerDay = pricePerDay;
        this.showStatus = status;
    }
    
    
}

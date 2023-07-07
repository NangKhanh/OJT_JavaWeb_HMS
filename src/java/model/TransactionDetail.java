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
public @Data class TransactionDetail {
    private int id;
    private int transactionID;
    private String roomCode;

    // use for database

    public TransactionDetail(int id, int transactionID, String roomCode) {
        this.id = id;
        this.transactionID = transactionID;
        this.roomCode = roomCode;
    }

    public TransactionDetail(int transactionID, String roomCode) {
        this.transactionID = transactionID;
        this.roomCode = roomCode;
    }

    public TransactionDetail(String roomCode) {
        this.roomCode = roomCode;
    }
    
}

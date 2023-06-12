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
    private String name;
    private int time;
    private int type;
    private int price;

    // use for database
    public TransactionDetail(int id, int transactionID, String roomCode, int time, int type, int price) {
        this.id = id;
        this.transactionID = transactionID;
        this.roomCode = roomCode;
        this.time = time;
        this.type = type;
        this.price = price;
    }

    // use for database
    public TransactionDetail(int transactionID, String roomCode, int time, int type, int price) {
        this.transactionID = transactionID;
        this.roomCode = roomCode;
        this.time = time;
        this.type = type;
        this.price = price;
    }

    //stogare the bill's data
    public TransactionDetail(String roomCode,String name, int time, int type, int price) {
        this.roomCode = roomCode;
        this.name = name;
        this.time = time;
        this.type = type;
        this.price = price;
    }

}

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
    private int transcationDetailID;
    private int transactionID;
    private int roomID;
    private int price;
    private int type;

    public TransactionDetail(int transcationDetailID, int transactionID, int roomID, int price, int type) {
        this.transcationDetailID = transcationDetailID;
        this.transactionID = transactionID;
        this.roomID = roomID;
        this.price = price;
        this.type = type;
    }

    public TransactionDetail(int transactionID, int roomID, int price, int type) {
        this.transactionID = transactionID;
        this.roomID = roomID;
        this.price = price;
        this.type = type;
    }
    
    
}

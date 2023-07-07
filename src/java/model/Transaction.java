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
public @Data class Transaction {
    private int transactionID;
    private String customerName;
    private String customerPhoneNumber;
    private String checkinDate;
    private String checkoutDate;
    private int price;
    private int checkoutStatus;

    public Transaction(int transactionID, String customerName, String customerPhoneNumeber, String date, int price) {
        this.transactionID = transactionID;
        this.customerName = customerName;
        this.customerPhoneNumber = customerPhoneNumeber;
        this.checkinDate = date;
        this.price = price;
    }

    public Transaction(String customerName, String customerPhoneNumeber, String date, int price) {
        this.customerName = customerName;
        this.customerPhoneNumber = customerPhoneNumeber;
        this.checkinDate = date;
        this.price = price;
    }

    public Transaction(int transactionID, String customerName, String customerPhoneNumber, String checkinDate, String checkoutDate, int price, int checoutStatus) {
        this.transactionID = transactionID;
        this.customerName = customerName;
        this.customerPhoneNumber = customerPhoneNumber;
        this.checkinDate = checkinDate;
        this.checkoutDate = checkoutDate;
        this.price = price;
        this.checkoutStatus = checoutStatus;
    }

    
}

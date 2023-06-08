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
    private String customerPhoneNumeber;
    private String date;
    private int price;

    public Transaction(int transactionID, String customerName, String customerPhoneNumeber, String date, int price) {
        this.transactionID = transactionID;
        this.customerName = customerName;
        this.customerPhoneNumeber = customerPhoneNumeber;
        this.date = date;
        this.price = price;
    }

    public Transaction(String customerName, String customerPhoneNumeber, String date, int price) {
        this.customerName = customerName;
        this.customerPhoneNumeber = customerPhoneNumeber;
        this.date = date;
        this.price = price;
    }
    
    
}

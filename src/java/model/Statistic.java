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
public @Data class Statistic {
    private int year;
    private String month;
    private int week1, week2, week3, week4, week5;
    private int total;

    public Statistic(int year, String month, int week1, int week2, int week3, int week4, int week5, int total) {
        this.year = year;
        this.month = month;
        this.week1 = week1;
        this.week2 = week2;
        this.week3 = week3;
        this.week4 = week4;
        this.week5 = week5;
        this.total = total;
    }
    
    
}

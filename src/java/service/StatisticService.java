/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import java.util.List;
import model.Statistic;
import dao.StatisticDAO;
/**
 *
 * @author hp
 */
public class StatisticService {
    
    StatisticDAO statisticDAO = new StatisticDAO();
    
    public List<Statistic> getStatisticList(int currentYear) {
        return statisticDAO.getStatisticList(currentYear);
    }
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author trong
 */
public class DAO473 {
    Connection con = null;
    
    public DAO473() {
        if (con == null) {
            String url = "jdbc:mysql://localhost:3306/shop";
            String username = "root";
            String password = "080322";
            
            String dbClass = "com.mysql.cj.jdbc.Driver";
            
            try {
                Class.forName(dbClass);
                con = DriverManager.getConnection(url, username, password);
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(DAO473.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}

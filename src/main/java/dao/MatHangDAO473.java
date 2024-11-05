/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.MatHang473;

/**
 *
 * @author trong
 */
public class MatHangDAO473 extends DAO473{
    
    public MatHangDAO473() {
        super();
    }
    
    public MatHang473 getMH(int mhid) {
        String sql = "SELECT * FROM tblMatHang473 WHERE id = ?";
        
        MatHang473 mh = null;
        
        try {
            CallableStatement cs = con.prepareCall(sql);
            
            cs.setInt(1, mhid);
            
            ResultSet rs = cs.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String ten = rs.getString("ten");
                int soluong = rs.getInt("soluong");
                float gia = rs.getFloat("gia");
                String mota = rs.getString("mota");

                mh = new MatHang473(id, ten, soluong, gia, mota);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(MatHangDAO473.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return mh;
    }
    
}

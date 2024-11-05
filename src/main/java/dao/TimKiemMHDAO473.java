/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.MatHang473;

/**
 *
 * @author trong
 */
public class TimKiemMHDAO473 extends DAO473{
    
    public TimKiemMHDAO473() {
        super();
    }
    
    public ArrayList<MatHang473> getDanhSachMH(String keyword) {
        String sql = "{call searchMatHang(?)}";
        
        ArrayList<MatHang473> res = new ArrayList<>();
        
        try {
            CallableStatement cs = con.prepareCall(sql);
            
            cs.setString(1, keyword);
            ResultSet rs = cs.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String ten = rs.getString("ten");
                int soluong = rs.getInt("soluong");
                float gia = rs.getFloat("gia");
                String mota = rs.getString("mota");

                res.add(new MatHang473(id, ten, soluong, gia, mota));
            }
        } catch (SQLException ex) {
            Logger.getLogger(TimKiemMHDAO473.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return res;
    }
}

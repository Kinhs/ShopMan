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
import model.ThanhVien473;

/**
 *
 * @author trong
 */
public class ThanhVienDAO473 extends DAO473{

    public ThanhVienDAO473() {
        super();
    }
    
    public boolean kiemTraDangNhap(ThanhVien473 tv) {
        boolean ketqua = false;
        if(tv.getUsername().contains("true") ||
               tv.getUsername().contains("=")||
               tv.getPassword().contains("true") || 
               tv.getPassword().contains("=")) return false;
        String sql = "{call kiemtraDN(?,?)}";
        
        try {
            CallableStatement cs = con.prepareCall(sql);
            cs.setString(1, tv.getUsername());
            cs.setString(2, tv.getPassword());
            
            ResultSet rs = cs.executeQuery();
            
            if(rs.next()){
                tv.setId(rs.getInt("id"));
                tv.setVaitro(rs.getString("vaitro"));
                tv.setHovaten(rs.getString("hovaten"));
                ketqua = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ThanhVienDAO473.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }
}

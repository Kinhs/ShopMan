/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.CallableStatement;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.TKKhachHang473;

/**
 *
 * @author trong
 */
public class TKKHDAO473 extends DAO473{
    
    public TKKHDAO473() {
        super();
    }
    
    public ArrayList<TKKhachHang473> getTKKH(Date startDate, Date endDate) {
        ArrayList<TKKhachHang473> res = new ArrayList<>();
        String sql = "{CALL GetCustomerRevenueStatistics(?, ?)}";
        
        try {
            
            CallableStatement cs = con.prepareCall(sql);
           
            cs.setDate(1, startDate);
            cs.setDate(2, endDate);
            
            ResultSet rs = cs.executeQuery();
            
            while (rs.next()) {
                TKKhachHang473 tk = new TKKhachHang473();
                tk.setId(rs.getInt("KhachHangID"));
                tk.setHoten(rs.getString("TenKhachHang"));
                tk.setSoHoaDon(rs.getInt("SoLuongHoaDon"));
                tk.setDoanhThu(rs.getFloat("TongTien"));
                
                res.add(tk);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TimKiemMHDAO473.class.getName()).log(Level.SEVERE, null, ex);
        } 
        
        return res;
    }
}

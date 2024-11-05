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
import model.HangXuat473;
import model.HoaDon473;

/**
 *
 * @author trong
 */
public class HoaDonDAO473 extends DAO473{
    
    public HoaDonDAO473() {
        super();
        String sql = "{CALL capNhatDongiaHoaDon()}";
        CallableStatement cs;
        try {
            cs = con.prepareCall(sql);
            cs.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(HoaDonDAO473.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public ArrayList<HoaDon473> getDSHoaDonbyDate(int khachHangID, Date startDate, Date endDate) {
         String sql = "SELECT * FROM tblHoaDon473 WHERE tblKhachHang473id = ? AND ngaykhoitao BETWEEN ? AND ?";
         ArrayList<HoaDon473> hoaDonList = new ArrayList<>();
         
        try {
            CallableStatement cs = con.prepareCall(sql);
            
            cs.setInt(1, khachHangID);
            cs.setDate(2, startDate);
            cs.setDate(3, endDate);
            
            ResultSet rs = cs.executeQuery();
            
            while (rs.next()) {
                HoaDon473 hd = new HoaDon473();
                hd.setId(rs.getInt("id"));
                hd.setNgaykhoitao(rs.getDate("ngaykhoitao"));
                hd.setNgayhoantat(rs.getDate("ngayhoantat"));
                hd.setDongia(rs.getFloat("dongia"));

                hoaDonList.add(hd);
            }
        } catch (SQLException ex) {
            Logger.getLogger(HoaDonDAO473.class.getName()).log(Level.SEVERE, null, ex);
        }
         
        return hoaDonList;
    }
    
    public HoaDon473 getHoaDonByID(int hoadonID) {
        HoaDon473 hoaDon = new HoaDon473();
        
        String sql = "SELECT * FROM tblHoaDon473 WHERE id = ?";
        
        try {
            CallableStatement cs = con.prepareCall(sql);
            cs.setInt(1, hoadonID);
            
            ResultSet rs = cs.executeQuery();
            if (rs.next()) {
                hoaDon = new HoaDon473();
                hoaDon.setId(rs.getInt("id"));
                hoaDon.setNgaykhoitao(rs.getDate("ngaykhoitao"));
                hoaDon.setDongia(rs.getFloat("dongia"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(HoaDonDAO473.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return hoaDon;
    }
    
    public ArrayList<HangXuat473> getHangXuatByHoaDonID(int hoaDonID) {
        ArrayList<HangXuat473> hangXuatList = new ArrayList<>();
        String sql = "SELECT * FROM tblHangXuat473 WHERE tblHoaDon473id = ?";
        
        try {
            CallableStatement cs = con.prepareCall(sql);
            cs.setInt(1, hoaDonID);
            
            ResultSet rs = cs.executeQuery();
            
            while (rs.next()) {
                HangXuat473 hx = new HangXuat473();
                hx.setId(rs.getInt("id"));
                hx.setSoluong(rs.getInt("soluong"));
                hx.setMatHangId(rs.getInt("tblMatHang473id"));
                hx.setHoaDonId(rs.getInt("tblHoaDon473id"));
                hangXuatList.add(hx);
            }
        } catch (SQLException ex) {
            Logger.getLogger(HoaDonDAO473.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return hangXuatList;
    }
}

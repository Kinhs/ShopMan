/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author trong
 */
public class HoaDon473 {
    private int id;
    private float dongia;
    private String trangthai; 
    private Date ngaykhoitao;  
    private Date ngayhoantat; 
    private int khachHangId;  
    private int thanhVienId;

    public HoaDon473() {
    }
    
    

    public HoaDon473(int id, float dongia, String trangthai, Date ngaykhoitao, Date ngayhoantat, int khachHangId, int thanhVienId) {
        this.id = id;
        this.dongia = dongia;
        this.trangthai = trangthai;
        this.ngaykhoitao = ngaykhoitao;
        this.ngayhoantat = ngayhoantat;
        this.khachHangId = khachHangId;
        this.thanhVienId = thanhVienId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getDongia() {
        return dongia;
    }

    public void setDongia(float dongia) {
        this.dongia = dongia;
    }

    public String getTrangthai() {
        return trangthai;
    }

    public void setTrangthai(String trangthai) {
        this.trangthai = trangthai;
    }

    public Date getNgaykhoitao() {
        return ngaykhoitao;
    }

    public void setNgaykhoitao(Date ngaykhoitao) {
        this.ngaykhoitao = ngaykhoitao;
    }

    public Date getNgayhoantat() {
        return ngayhoantat;
    }

    public void setNgayhoantat(Date ngayhoantat) {
        this.ngayhoantat = ngayhoantat;
    }

    public int getKhachHangId() {
        return khachHangId;
    }

    public void setKhachHangId(int khachHangId) {
        this.khachHangId = khachHangId;
    }

    public int getThanhVienId() {
        return thanhVienId;
    }

    public void setThanhVienId(int thanhVienId) {
        this.thanhVienId = thanhVienId;
    }
    
    
}

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
public class HangNhap473 {
    private int id;
    private Date ngaynhap;      
    private int soluong;        
    private float dongia;       
    private int matHangId;      
    private int nhaCungCapId;

    public HangNhap473(int id, Date ngaynhap, int soluong, float dongia, int matHangId, int nhaCungCapId) {
        this.id = id;
        this.ngaynhap = ngaynhap;
        this.soluong = soluong;
        this.dongia = dongia;
        this.matHangId = matHangId;
        this.nhaCungCapId = nhaCungCapId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getNgaynhap() {
        return ngaynhap;
    }

    public void setNgaynhap(Date ngaynhap) {
        this.ngaynhap = ngaynhap;
    }

    public int getSoluong() {
        return soluong;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }

    public float getDongia() {
        return dongia;
    }

    public void setDongia(float dongia) {
        this.dongia = dongia;
    }

    public int getMatHangId() {
        return matHangId;
    }

    public void setMatHangId(int matHangId) {
        this.matHangId = matHangId;
    }

    public int getNhaCungCapId() {
        return nhaCungCapId;
    }

    public void setNhaCungCapId(int nhaCungCapId) {
        this.nhaCungCapId = nhaCungCapId;
    }
    
    
}

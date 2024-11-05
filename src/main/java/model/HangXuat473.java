/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author trong
 */
public class HangXuat473 {
    private int id;
    private int soluong;       
    private int matHangId;     
    private int hoaDonId;

    public HangXuat473() {
    }
    

    public HangXuat473(int id, int soluong, int matHangId, int hoaDonId) {
        this.id = id;
        this.soluong = soluong;
        this.matHangId = matHangId;
        this.hoaDonId = hoaDonId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSoluong() {
        return soluong;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }

    public int getMatHangId() {
        return matHangId;
    }

    public void setMatHangId(int matHangId) {
        this.matHangId = matHangId;
    }

    public int getHoaDonId() {
        return hoaDonId;
    }

    public void setHoaDonId(int hoaDonId) {
        this.hoaDonId = hoaDonId;
    }
    
    
}

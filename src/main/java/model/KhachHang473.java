/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author trong
 */
public class KhachHang473 {
    private int id;
    private int thanhVienId;
    
    public KhachHang473(){
        
    }

    public KhachHang473(int id, int thanhVienId) {
        this.id = id;
        this.thanhVienId = thanhVienId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getThanhVienId() {
        return thanhVienId;
    }

    public void setThanhVienId(int thanhVienId) {
        this.thanhVienId = thanhVienId;
    }
    
    
}

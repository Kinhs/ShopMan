<%-- 
    Document   : doDangNhap473
    Created on : Oct 19, 2024, 9:19:28 PM
    Author     : trong
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"
        import="java.util.*, dao.*, model.*"%>
 
<%
    String username = (String)request.getParameter("username");
    String password = (String)request.getParameter("password");
    ThanhVien473 tv = new ThanhVien473();
    tv.setUsername(username);
    tv.setPassword(password);
    ThanhVienDAO473 dao = new ThanhVienDAO473();
    boolean kq = dao.kiemTraDangNhap(tv);
    if(kq && (tv.getVaitro().equalsIgnoreCase("Khách Hàng"))){
        session.setAttribute("khachhang", tv);
        response.sendRedirect("kh\\GDChinhKH473.jsp");
    }else if(kq &&(tv.getVaitro().equalsIgnoreCase("Nhân viên"))){
        session.setAttribute("nhanvien", tv);
        response.sendRedirect("nv\\GDChinhNV473.jsp");
    }else{
        response.sendRedirect("GDDangNhap473.jsp?err=fail");
    }
%>

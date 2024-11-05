<%-- 
    Document   : GDChiTietMH473
    Created on : Oct 20, 2024, 4:10:27 PM
    Author     : trong
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"
        import="java.util.*, dao.*, model.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chi tiết mặt hàng</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f9;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .detail-container {
                background-color: #ffffff;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                padding: 40px;
                max-width: 700px;
                width: 100%;
                text-align: center;
            }
            h2 {
                color: #333;
                margin-bottom: 20px;
            }
            .item-details {
                text-align: left;
                font-size: 18px;
            }
            .item-details p {
                margin: 10px 0;
            }
            .item-details span {
                font-weight: bold;
                color: #333;
            }
            .btn {
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                text-decoration: none;
                border-radius: 4px;
                display: inline-block;
                margin-top: 20px;
            }
            .btn:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <%
            ThanhVien473 tv = (ThanhVien473)session.getAttribute("khachhang");
            if(tv==null){
                response.sendRedirect("dangnhap.jsp?err=timeout");
            }
        %>
        <div class="detail-container">
            <h2>Chi tiết mặt hàng</h2>
            <div class="item-details">
                <%
                    String idstr = (String) request.getParameter("mhid");
                    if (idstr != null) {
                        MatHangDAO473 dao = new MatHangDAO473();
                        MatHang473 mh = dao.getMH(Integer.parseInt(idstr));
                        
                        if (mh != null) {
                %>
                <p><span>ID:</span> <%= mh.getId() %></p>
                <p><span>Tên:</span> <%= mh.getTen() %></p>
                <p><span>Số lượng:</span> <%= mh.getSoluong() %></p>
                <p><span>Giá:</span> <%= mh.getGia() %> vnd</p>
                <p><span>Mô tả:</span> <%= mh.getMota() %></p>
                <a class="btn">Thêm vào giỏ hàng</a>
                <%
                        } else {
                            out.println("<p>Mặt hàng không tồn tại.</p>");
                        }
                    } else {
                        out.println("<p>ID không hợp lệ.</p>");
                    }
                %>
            </div>
        </div>
    </body>
</html>

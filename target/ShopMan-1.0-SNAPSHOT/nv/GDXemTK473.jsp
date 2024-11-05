<%-- 
    Document   : GDXemTK473
    Created on : Oct 28, 2024, 4:35:56 PM
    Author     : trong
--%>

<%@page language="java" contentType="text/html; charset=UTF-8"
        import="java.util.*, dao.*, model.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang chủ quản lý</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                color: #333;
            }
            .container {
                width: 50%;
                margin: 50px auto;
                padding: 20px;
                background-color: #fff;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
            }
            h2 {
                text-align: center;
                color: #4CAF50;
                margin-bottom: 20px;
            }
            form {
                display: flex;
                flex-direction: column;
            }
            label {
                margin: 10px 0 5px;
                font-size: 1.1em;
                font-weight: bold;
            }
            input[type="date"], select {
                padding: 12px;
                font-size: 1em;
                border: 1px solid #ccc;
                border-radius: 4px;
                margin-bottom: 20px;
            }
            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                padding: 14px;
                font-size: 1em;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }
            input[type="submit"]:hover {
                background-color: #45a049;
            }
            select {
                background-color: #f9f9f9;
            }
            .form-group {
                display: flex;
                justify-content: space-between;
                gap: 20px;
            }
            @media (max-width: 768px) {
                .container {
                    width: 90%;
                }
                .form-group {
                    flex-direction: column;
                }
            }
        </style>
    </head>
    <body>
        <%
            ThanhVien473 tv = (ThanhVien473)session.getAttribute("nhanvien");
            if(tv==null){
                response.sendRedirect("dangnhap.jsp?err=timeout");
            }
        %>
        <div class="container">
            <h2>Xem báo cáo thống kê</h2>
            <form action="doXemTK473.jsp" method="post">
                <label for="statisticType">Chọn loại thống kê:</label>
                <select name="statisticType" required>
                    <option value="khachhang">Thống kê khách hàng</option>
                    <option value="nhacungcap">Thống kê nhà cung cấp</option>
                    <option value="mathang">Thống kê mặt hàng</option>
                </select>
                <div class="form-group">
                    <div>
                        <label for="start">Ngày bắt đầu:</label>
                        <input type="date" name="start" required>
                    </div>
                    <div>
                        <label for="end">Ngày kết thúc:</label>
                        <input type="date" name="end" required>
                    </div>
                </div>
                
                <input type="submit" value="Xem thống kê">
            </form>
        </div>
    </body>
</html>


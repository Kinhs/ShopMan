<%-- 
    Document   : GDChinhNV473
    Created on : Oct 28, 2024, 4:03:14 PM
    Author     : trong
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"
        import="model.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang chủ nhân viên quản lý</title>
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
            .main-container {
                background-color: #ffffff;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                padding: 40px;
                text-align: center;
                max-width: 600px;
                width: 100%;
            }
            h2 {
                color: #333;
                margin-bottom: 30px;
            }
            button {
                background-color: #4CAF50;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                width: 100%;
            }
            button:hover {
                background-color: #45a049;
            }
        </style>
        <script type="text/javascript">
            function openPage(pageURL) {
                window.location.href = pageURL;
            }
        </script>
    </head>
    <body>
        <%
            ThanhVien473 tv = (ThanhVien473)session.getAttribute("nhanvien");
            if(tv==null){
                response.sendRedirect("dangnhap.jsp?err=timeout");
            }
        %>
        <div class="main-container">
            <h2>Trang chủ nhân viên quản lý</h2>
            <button onclick="openPage('GDXemTK473.jsp')">Xem báo cáo thống kê</button>
        </div>
    </body>
</html>
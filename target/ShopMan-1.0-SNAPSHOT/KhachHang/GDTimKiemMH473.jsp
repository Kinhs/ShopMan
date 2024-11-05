<%-- 
    Document   : GDTimKiemMH473
    Created on : Oct 20, 2024, 2:05:15 PM
    Author     : trong
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"
        import="java.util.*, dao.*, model.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tìm kiếm mặt hàng</title>
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
            .search-container {
                background-color: #ffffff;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                padding: 30px;
                max-width: 700px;
                width: 100%;
                text-align: center;
            }
            h2 {
                color: #333;
                margin-bottom: 20px;
            }
            input[type="text"] {
                width: 70%;
                padding: 10px;
                margin-right: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
                box-sizing: border-box;
            }
            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            input[type="submit"]:hover {
                background-color: #45a049;
            }
            table {
                width: 100%;
                margin-top: 20px;
                border-collapse: collapse;
            }
            table, th, td {
                border: 1px solid #ddd;
            }
            th, td {
                padding: 12px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
            tr:nth-child(even) {
                background-color: #f9f9f9;
            }
            .no-results {
                margin-top: 20px;
                color: red;
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
        <div class="search-container">
            <h2>Tìm kiếm mặt hàng</h2>
            <form action="GDTimKiemMH473.jsp" method="get">
                <input type="text" name="keyword" placeholder="Nhập từ khóa để tìm kiếm...">
                <input type="submit" value="Tìm kiếm">
            </form>

            <%
                String keyword = request.getParameter("keyword");
                if (keyword != null && !keyword.isEmpty()) {
                    TimKiemMHDAO473 dao = new TimKiemMHDAO473();
                    ArrayList<MatHang473> results = dao.getDanhSachMH(keyword);

                    if (results != null && !results.isEmpty()) {
            %>
            <h3>Kết quả tìm kiếm:</h3>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Tên mặt hàng</th>
                    <th>Giá</th>
                    <th>Xem chi tiết</th>
                </tr>
                <%
                    for (MatHang473 mh : results) {
                %>
                <tr>
                    <td><%= mh.getId() %></td>
                    <td><%= mh.getTen() %></td>
                    <td><%= mh.getGia() %></td>
                    <td><a href="GDChiTietMH473.jsp?mhid=<%= mh.getId()%>">Xem</a></td>
                </tr>
                <%
                    }
                %>
            </table>
            <%
                    } else {
            %>
            <p class="no-results">Không có kết quả cho từ khóa "<%= keyword %>".</p>
            <%
                    }
                } else {
                    out.println("<p class='no-results'>Vui lòng nhập từ khóa để tìm kiếm.</p>");
                }
            %>
        </div>
    </body>
</html>

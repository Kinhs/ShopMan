<%-- 
    Document   : GDXemDSHoaDon473
    Created on : Oct 29, 2024, 1:36:33 PM
    Author     : trong
--%>

<%@page language="java" contentType="text/html; charset=UTF-8"
        import="java.util.ArrayList, dao.HoaDonDAO473, model.*, java.sql.Date" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh sách hóa đơn của khách hàng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
                width: 80%;
                margin: auto;
                background: #fff;
                padding: 20px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                margin-top: 30px;
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }
        table {
        width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: center;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .total-row {
            font-weight: bold;
        }
        .summary {
            text-align: right;
            margin-top: 20px;
            font-size: 18px;
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
            <h2>Danh sách hóa đơn của khách hàng</h2>

            <%
                // Lấy ID khách hàng từ URL
                String khachHangID = request.getParameter("khachHangID");
                String start = request.getParameter("start");
                String end = request.getParameter("end");

                if (khachHangID != null && start != null && end != null) {
                    HoaDonDAO473 dao = new HoaDonDAO473();
                    ArrayList<HoaDon473> hoaDonList = dao.getDSHoaDonbyDate(Integer.parseInt(khachHangID), Date.valueOf(start), Date.valueOf(end));

                    if (hoaDonList.isEmpty()) {
                        out.println("<p>Khách hàng không có hóa đơn trong khoảng thời gian này.</p>");
                    } else {
            %>

            <table>
                <tr>
                    <th>ID Hóa Đơn</th>
                    <th>Ngày Tạo</th>
                    <th>Ngày Hoàn Tất</th>
                    <th>Tổng Tiền (VNĐ)</th>
                    <th>Xem chi tiết</th>
                </tr>
                <%
                    for (HoaDon473 hd : hoaDonList) {
                %>
                <tr>
                    <td><%= hd.getId() %></td>
                    <td><%= hd.getNgaykhoitao()%></td>
                    <td><%= hd.getNgayhoantat()%></td>
                    <td><%= hd.getDongia()%></td>
                    <td>
                        <a href="GDXemChiTietHoaDon473.jsp?hoaDonID=<%= hd.getId() %>">
                            Xem 
                        </a>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>

            <%
                    }
                } else {
                    out.println("<p>Không có thông tin khách hàng.</p>");
                }
            %>

        </div>
    </body>
</html>


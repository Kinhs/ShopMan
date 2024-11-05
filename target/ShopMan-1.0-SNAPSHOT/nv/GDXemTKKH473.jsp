<%-- 
    Document   : XemTKKH473
    Created on : Oct 28, 2024, 4:43:14 PM
    Author     : trong
--%>

<%@page language="java" contentType="text/html; charset=UTF-8"
        import="java.util.ArrayList, dao.*, model.*, java.sql.Date" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thống kê khách hàng</title>
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
            <h2>Thống kê khách hàng theo doanh thu</h2>

            <%
                // Lấy dữ liệu từ form (start, end)
                String start = request.getParameter("start");
                String end = request.getParameter("end");

                if (start != null && end != null) {
                    TKKHDAO473 dao = new TKKHDAO473();
                    ArrayList<TKKhachHang473> thongKeList = dao.getTKKH(Date.valueOf(start), Date.valueOf(end));

                    if (thongKeList.isEmpty()) {
                        out.println("<p>Không có dữ liệu trong khoảng thời gian này.</p>");
                    } else {
            %>

            <table>
                <tr>
                    <th>ID Khách Hàng</th>
                    <th>Tên Khách Hàng</th>
                    <th>Số Lượng Hóa Đơn</th>
                    <th>Tổng Tiền (VNĐ)</th>
                    <th>Danh sách hóa đơn</th>
                </tr>
                <%
                    for (TKKhachHang473 tk : thongKeList) {
                %>
                <tr>
                    <td><%= tk.getId()%></td>
                    <td><%= tk.getHoten()%></td>
                    <td><%= tk.getSoHoaDon()%></td>
                    <td><%= tk.getDoanhThu()%></td>
                    <td>
                        <a href="GDXemDSHoaDon473.jsp?khachHangID=<%= tk.getId() %>&start=<%= start %>&end=<%= end %>">
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
                    out.println("<p>Vui lòng chọn khoảng thời gian thống kê.</p>");
                }
            %>

        </div>
    </body>
</html>


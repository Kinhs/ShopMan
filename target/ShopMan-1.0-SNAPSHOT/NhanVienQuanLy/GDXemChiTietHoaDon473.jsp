<%-- 
    Document   : GDXemChiTietHoaDon473
    Created on : Oct 29, 2024, 2:30:22 PM
    Author     : trong
--%>

<%@page language="java" contentType="text/html; charset=UTF-8"
    import="java.util.*, dao.*, model.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Chi tiết hóa đơn</title>
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
        <h2>Chi tiết hóa đơn</h2>

        <%
            String hoaDonID = request.getParameter("hoaDonID");

            if (hoaDonID != null) {
                HoaDonDAO473 dao = new HoaDonDAO473();
                MatHangDAO473 mhdao = new MatHangDAO473();
                HoaDon473 hoaDon = dao.getHoaDonByID(Integer.parseInt(hoaDonID));
                ArrayList<HangXuat473> hangXuatList = dao.getHangXuatByHoaDonID(Integer.parseInt(hoaDonID));

                if (hoaDon != null && !hangXuatList.isEmpty()) {
        %>
                    <p>Mã hóa đơn: <%= hoaDon.getId() %></p>
                    <p>Ngày tạo: <%= hoaDon.getNgaykhoitao()%></p>

                    <h3>Danh sách hàng xuất:</h3>
                    <table border="1">
                        <tr>
                            <th>Tên mặt hàng</th>
                            <th>Số lượng</th>
                            <th>Đơn giá</th>
                            <th>Thành tiền</th>
                        </tr>
                        <%
                            double tongTien = 0;
                            for (HangXuat473 hx : hangXuatList) {
                                MatHang473 matHang = mhdao.getMH(hx.getMatHangId());
                                double thanhTien = hx.getSoluong() * matHang.getGia();
                                tongTien += thanhTien;
                        %>
                            <tr>
                                <td><%= matHang.getTen() %></td>
                                <td><%= hx.getSoluong() %></td>
                                <td><%= matHang.getGia() %> VND</td>
                                <td><%= thanhTien %> VND</td>
                            </tr>
                        <%
                            }
                        %>
                        <tr class="total-row">
                            <td colspan="3">Tổng cộng</td>
                            <td><%= tongTien %> VND</td>
                        </tr>
                    </table>
                    <div class="summary">
                        <p>Tổng giá trị hóa đơn: <b><%= String.format("%,.0f", hoaDon.getDongia()) %> VND</b></p>
                    </div>
        <%
                } else {
                    out.println("<p>Hóa đơn không tồn tại hoặc không có hàng xuất nào.</p>");
                }
            } else {
                out.println("<p>ID hóa đơn không hợp lệ.</p>");
            }
        %>
    </div>
</body>
</html>


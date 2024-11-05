<%-- 
    Document   : GDDangNhap473.jsp
    Created on : Oct 19, 2024, 5:36:09 PM
    Author     : trong
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"
        import="java.util.*, dao.*, model.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dang nhap</title>
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
            .login-container {
                background-color: #ffffff;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                padding: 30px;
                max-width: 400px;
                width: 100%;
                text-align: center;
            }
            h2 {
                color: #333;
                margin-bottom: 20px;
            }
            table {
                width: 100%;
            }
            table td {
                padding: 10px;
            }
            input[type="text"], input[type="password"] {
                width: 100%;
                padding: 10px;
                margin: 8px 0;
                border: 1px solid #ddd;
                border-radius: 4px;
                box-sizing: border-box;
            }
            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                width: 100%;
                font-size: 16px;
            }
            input[type="submit"]:hover {
                background-color: #45a049;
            }
            .error-message {
                color: red;
                font-size: 14px;
                margin-bottom: 10px;
            }
            .timeout-message {
                color: orange;
                font-size: 14px;
                margin-bottom: 10px;
            }
        </style>
    </head>
    <body>
        <div class="login-container">
            <%
                if(request.getParameter("err") !=null && 
                   request.getParameter("err").equalsIgnoreCase("timeout")){
                    %> <div class="timeout-message">Hết phiên làm việc. Làm ơn đăng nhập lại!</div><%
                } else if(request.getParameter("err") !=null && 
                         request.getParameter("err").equalsIgnoreCase("fail")){
                    %> <div class="error-message">Sai tên đăng nhập/mật khẩu!</div><%
                }
            %>
            <h2>Đăng nhập</h2>
            <form name="dangnhap" action="doDangNhap473.jsp" method="post">
                <table border="0">
                    <tr>
                        <td><label for="username">Tên đăng nhập:</label></td>
                        <td><input type="text" name="username" id="username" required /></td>
                    </tr>
                    <tr>
                        <td><label for="password">Mật khẩu:</label></td>
                        <td><input type="password" name="password" id="password" required /></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="Đăng nhập" /></td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>

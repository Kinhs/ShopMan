<%-- 
    Document   : doXemTK473
    Created on : Oct 28, 2024, 4:40:44 PM
    Author     : trong
--%>

<%@page language="java" contentType="text/html; charset=UTF-8"
        import="java.util.*, dao.*, model.*"%>
<%
    String start = request.getParameter("start");
    String end = request.getParameter("end");
    String statisticType = request.getParameter("statisticType");

    if ("khachhang".equals(statisticType)) {
        response.sendRedirect("GDXemTKKH473.jsp?start=" + start + "&end=" + end);
    } else if ("nhacungcap".equals(statisticType)) {
        response.sendRedirect("GDXemTKNCC473.jsp?start=" + start + "&end=" + end);
    } else if ("mathang".equals(statisticType)) {
        response.sendRedirect("GDXemTKMH473.jsp?start=" + start + "&end=" + end);
    }
%>


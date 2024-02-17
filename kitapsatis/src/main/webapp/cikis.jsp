<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%

    session.invalidate();
    String errorMessage = "Oturum Kapatildi";
    response.setContentType("text/html");
    out.println("<script type='text/javascript'>");
    out.println("alert('" + errorMessage + "');");
    out.println("window.location.href='index.jsp';"); // Uyarıyı gösterdikten sonra yönlendirme yapabilirsiniz
    out.println("</script>");
%>



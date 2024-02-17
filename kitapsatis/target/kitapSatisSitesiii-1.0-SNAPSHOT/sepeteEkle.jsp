<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>

<%
int kitapID = -1;

try {
    kitapID = Integer.parseInt(request.getParameter("id"));
} catch (NumberFormatException e) {
    out.println("Invalid kitapID parameter: " + request.getParameter("id"));
    e.printStackTrace();
    
}

ArrayList<Integer> sepet = (ArrayList<Integer>) session.getAttribute("sepet");
if (sepet == null) {
    sepet = new ArrayList<>();
    session.setAttribute("sepet", sepet);
}

sepet.add(kitapID);

    String errorMessage = "Sepete Eklendi! Sepete gitmek için tamama basınız.";
    response.setContentType("text/html");
    out.println("<script type='text/javascript'>");
    out.println("alert('" + errorMessage + "');");
    out.println("window.location.href='sepet.jsp';");
    out.println("</script>");
      
%>



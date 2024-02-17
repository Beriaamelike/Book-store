<%@page import="veri.Database"%>
<%@page import="java.sql.*" %> 
<%@page language="java" pageEncoding="UTF-8"%>


<% 
        int kitapID = Integer.parseInt(request.getParameter("id"));
        PreparedStatement pst;
        ResultSet rs;
        Database db = new Database();
        Connection con;
        con = db.baglan();
        pst = con.prepareStatement("CALL kitapSil(?)");
        pst.setInt(1, kitapID);
        pst.executeUpdate();  
        
    response.sendRedirect("admin.jsp");
    
%>

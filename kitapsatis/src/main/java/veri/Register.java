/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package veri;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Register extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        PrintWriter out = response.getWriter();
        
        boolean status = false;
        String musteriAdi = request.getParameter("musteriAdi");
        String musteriSoyadi = request.getParameter("musteriSoyadi");
        String telefon = request.getParameter("telefon");
        String email = request.getParameter("email");
        String adres = request.getParameter("adres");
        String sifre = request.getParameter("sifre"); 

        try {
            Database db = new Database();
            Connection conn = db.baglan();

            PreparedStatement st = conn.prepareStatement(
                "INSERT INTO musteri(musteriAdi, musteriSoyadi, telefon, email, adres, sifre) VALUES (?, ?, ?, ?, ?, ?)"
            );
            st.setString(1, musteriAdi);
            st.setString(2, musteriSoyadi);
            st.setString(3, telefon);
            st.setString(4, email);
            st.setString(5, adres);
            st.setString(6, sifre);
            st.executeUpdate();
            status = true;

        } catch (SQLException e) {
            System.out.println("Veritabanina ekleme hatasi: " + e.getMessage());
        }
        
    if (status) {
    String errorMessage = "Basariyla Kaydoldunuz! Simdi giris yapabilirsiniz.";
    response.setContentType("text/html");
    out.println("<script type='text/javascript'>");
    out.println("alert('" + errorMessage + "');");
    out.println("window.location.href='login.jsp';"); // Uyarıyı gösterdikten sonra yönlendirme yapabilirsiniz
    out.println("</script>");
            
        } else {
    String errorMessage = "Basarisiz kayıt! tekrar deneyiniz.";
    response.setContentType("text/html");
    out.println("<script type='text/javascript'>");
    out.println("alert('" + errorMessage + "');");
    out.println("window.location.href='registration.jsp';"); // Uyarıyı gösterdikten sonra yönlendirme yapabilirsiniz
    out.println("</script>");
        }
        
       
    }



}

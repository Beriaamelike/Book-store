package veri;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        boolean status = false;
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");
        String sifre = request.getParameter("sifre");

        if ("admin".equals(email) && "1".equals(sifre)) {
            HttpSession session = request.getSession();
            session.setAttribute("userType", "admin");
            response.sendRedirect("admin.jsp");
            return;
        }

        try {
            Database db = new Database();
            Connection conn = db.baglan();

            PreparedStatement ps = conn.prepareStatement("select * from musteri where email=? and sifre=?");
            ps.setString(1, email);
            ps.setString(2, sifre);

            ResultSet rs = ps.executeQuery();
            status = rs.next();
            if (status) {
                HttpSession session = request.getSession();
                session.setAttribute("userType", "customer");
                session.setAttribute("musteriID", rs.getInt("musteriID"));
                session.setAttribute("musteriAdi", rs.getString("musteriAdi"));
                session.setAttribute("musteriSoyadi", rs.getString("musteriSoyadi"));
                session.setAttribute("telefon", rs.getString("telefon"));
                session.setAttribute("adres", rs.getString("adres"));
                session.setAttribute("butce", rs.getInt("butce"));
                
            }
            
        } catch (Exception e) {
            // Handle exception
        }

        if (status) {
            String errorMessage = "Basariyla giris yaptiniz!";
    response.setContentType("text/html");
    out.println("<script type='text/javascript'>");
    out.println("alert('" + errorMessage + "');");
    out.println("window.location.href='index.jsp';"); // Uyarıyı gösterdikten sonra yönlendirme yapabilirsiniz
    out.println("</script>");
            
        } else {
    String errorMessage = "Yanlis mail ya da sifre!";
    response.setContentType("text/html");
    out.println("<script type='text/javascript'>");
    out.println("alert('" + errorMessage + "');");
    out.println("window.location.href='login.jsp';"); // Uyarıyı gösterdikten sonra yönlendirme yapabilirsiniz
    out.println("</script>");
        }

        out.close();
    }
}


<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="veri.Database" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<%
    // Sepet verilerini alın
    ArrayList<Integer> sepet = (ArrayList<Integer>) session.getAttribute("sepet");

    int musteriID = (int) session.getAttribute("musteriID");

    // Veritabanına bağlanın
    Database db = new Database();
    Connection connection = db.baglan();
    
    // Sepetten silinecek kitapları tutmak için yeni bir liste oluşturun
    ArrayList<Integer> Kitaplar = new ArrayList<>();
    
    // Sepetteki her kitap için sipariş oluşturun
    for (Integer kitapID : sepet) {
        String query = "INSERT INTO siparis (musteriID, kitapID) VALUES (?, ?)";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1, musteriID);
        preparedStatement.setInt(2, kitapID);

        // Siparişi veritabanına ekleyin
        int rowCount = preparedStatement.executeUpdate();
        preparedStatement.close();

        if (rowCount > 0) {
            // Sipariş başarıyla eklenmişse, bu kitabı silinecekler listesine ekleyin
            Kitaplar.add(kitapID);
        }
    }

    // Sepetten silinecek kitapları sepetten kaldırın
    sepet.removeAll(Kitaplar);

    // Veritabanı bağlantısını kapatın
    connection.close();

    String errorMessage = "Satin alma islemi basariyla gerceklesti!";
    response.setContentType("text/html");
    out.println("<script type='text/javascript'>");
    out.println("alert('" + errorMessage + "');");
    out.println("window.location.href='kullaniciBilgileri.jsp';"); // Uyarıyı gösterdikten sonra yönlendirme yapabilirsiniz
    out.println("</script>");
%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="veri.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>

<%
    // Sepet verilerini alın
    ArrayList<Integer> sepet = (ArrayList<Integer>) session.getAttribute("sepet");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sepet</title>
    <link rel="stylesheet" href="style.css">
    <style>
        /* Diğer stiller burada bulunabilir */

        .total-price {
            font-size: 24px;
            margin: 20px 0;
            text-align: center;
        }

        .cart-actions {
            text-align: center;
        }
        
             /* Temel Stil */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4; /* Sayfa arkaplan rengi */
}

h1 {
    text-align: center;
    color: #333; /* Başlık metin rengi */
}
.cart-container {
    display: flex;
    flex-direction: column; /* Kitapları sıralamak için dikey yönde (alt alta) düzenleme */
    gap: 20px;
    justify-content: center;
    margin-top: 20px;
}


.book-item {
    background-color: #fff; /* Kitap kutusu arkaplan rengi */
    border: 1px solid #ddd;
    border-radius: 5px;
    padding: 20px;
    width: 900px;
    margin-left: 300px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Kitap kutusu gölgesi */
    margin-top:10px;
    align-items: center; 
}


.book-image {
    width: 100px;
    max-height: 250px;
    object-fit: cover; /* Kitap resmi boyutu ayarları */
    display: flex;
    align-items: center; 

}

.book-details {
    padding: 10px;
    text-align: center;
}

.book-name {
    font-size: 20px;
    margin: 10px 0;
    color: #333; /* Kitap adı metin rengi */

}



.price {
    font-size: 18px;
    margin-right:10px;
    margin: 0;
    color: #f00; /* Fiyat metin rengi */
}

.buy-button {
    display: block;
    padding: 10px 20px;
    background-color: #007474; /* Buton rengi */
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    margin-top: 10px;
    text-align: center;
    cursor: pointer;
    margin-left:600px;
    width:300px;
    transition: background-color 0.3s; /* Buton hover animasyonu */
}

.buy-button:hover {
    background-color: #004d4d;
}

/* İletişim Kutusu Stili */
.message-box {
    /* İletişim kutusu stilleri */
}

.message {
    /* Mesaj içeriği stilleri */
}

.confirm-button {
    /* Onay düğmesi stilleri */
}

.cart-heading {
    /* Sepet başlığı stilleri */
}

.book{
    display:flex;
    margin-top:20px;
     justify-content: space-between; /* Kitapları yatay olarak sıralarken boşluğu ayarla */
    gap: 20px; 
}

.remove-button{
    height:30px;
    width:150px;
}
    </style>
</head>
<body>
    <nav>
        <%@include file="navbar.jsp" %>
    </nav>

    <main>
        <h1>Sepet</h1>
        <div class="cart-container">
            <table>
              
                <tbody>
                   <div class="book-item">
                    <%
                        int totalFiyat = 0; // Toplam fiyatı takip etmek için bir değişken ekleyin
                        // Sepet içeriğini listele
                        if (sepet != null && !sepet.isEmpty()) {
                            for (Integer kitapID : sepet) {
                                // Veritabanı sorgusu ve kitap listesi burada
                                Database db = new Database();
                                Connection connection = db.baglan();
                                String query = "SELECT k.kitapID, k.kitapAdi, y.yazarAdi, k.fiyat, k.aciklama, k.kitapfoto FROM kitap k, yazar y WHERE k.yazarID = y.yazarID AND k.kitapID = ?";

                                // Execute the query
                                PreparedStatement preparedStatement = connection.prepareStatement(query);
                                preparedStatement.setInt(1, kitapID); // kitapID değişkenini sorgu parametresine ekleyin
                                ResultSet resultSet = preparedStatement.executeQuery();

                                // Kitapları listele
                                while (resultSet.next()) {
                                    String kitapAdi = resultSet.getString("kitapAdi");
                                    String yazarAdi = resultSet.getString("yazarAdi");
                                    int fiyat = resultSet.getInt("fiyat");
                                    String aciklama = resultSet.getString("aciklama");
                                    String kitapFoto = resultSet.getString("kitapfoto");
                                    totalFiyat += fiyat; // Toplam fiyatı güncelle

                                    // Kitap bilgilerini ekrana yazdır
                    %>
                    <div class="book">
            <img src="<%= kitapFoto %>" alt="<%= kitapAdi %>" class="book-image">
           
                <h2 class="book-name"><%= kitapAdi %></h2>
                <h3 class="price"><%= fiyat %> TL</h3>
            
            <button class="remove-button" data-kitap-id="<%= kitapID %>">Sepetten Kaldır</button>
                    </div>
                    <%
                                }

                                // Close the resources
                                resultSet.close();
                                preparedStatement.close();
                                connection.close();
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="5">Sepetiniz boş.</td>
                    </tr>
                    <%
                        }
                    %>
                   </div>
                </tbody>
            </table>

            <!-- Toplam fiyatı göster -->
            <p class="total-price">Toplam Fiyat: <%= totalFiyat %> TL</p>

            <!-- Satın alma düğmesi -->
            <div class="cart-actions">
                <form action="satinAl.jsp" method="post">
                    <input type="submit" value="Satın Al" class="buy-button">
                </form>
            </div>
        </div>
    </main>
</body>
</html>

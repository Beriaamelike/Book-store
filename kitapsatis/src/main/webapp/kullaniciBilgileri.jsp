<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="veri.Database"%>
<%
    // Kullanıcı bilgilerini çekmek için müşteriID'yi alın
    int musteriID = (int) session.getAttribute("musteriID");

    // Veritabanı bağlantısını oluşturun
    Database db = new Database();
    Connection connection = db.baglan();

    // Müşteri bilgilerini çekmek için sorgu
    String musteriBilgiQuery = "SELECT * FROM musteri WHERE musteriID = ?";
    PreparedStatement musteriBilgiStatement = connection.prepareStatement(musteriBilgiQuery);
    musteriBilgiStatement.setInt(1, musteriID);
    ResultSet musteriBilgiResultSet = musteriBilgiStatement.executeQuery();

    // Siparişleri çekmek için sorgu
    String siparisQuery = "SELECT s.siparisID, k.kitapAdi, k.fiyat FROM siparis s " +
                          "INNER JOIN kitap k ON s.kitapID = k.kitapID " +
                          "WHERE s.musteriID = ?";
    PreparedStatement siparisStatement = connection.prepareStatement(siparisQuery);
    siparisStatement.setInt(1, musteriID);
    ResultSet siparisResultSet = siparisStatement.executeQuery();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kullanıcı Bilgileri</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }
         .container-wrapper {
        display: flex;
        justify-content: space-between;
    }

        .container {
            width: 500px;
            max-height: 500px;
            margin: 100px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            justify-content: space-between; /* İçerikleri aralarında boşluk bırakarak yan yana sıralar */
            margin-bottom: 20px; 
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        /* Tablo biçimi */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }



        /* Satın Alınan Kitaplar tablosunu stilleyin */
        h2 {
            margin-top: 20px;
        }

        .book-table {
            margin-top: 10px;
        }

        /* Satın Alınan Kitaplar tablosu için sütun genişlikleri */
        .book-table th:nth-child(1),
        .book-table td:nth-child(1) {
            width: 40%;
        }

        .book-table th:nth-child(2),
        .book-table td:nth-child(2) {
            width: 20%;
        }

        /* Satın Alınan Kitaplar tablosu için hücreleri ortala */
        .book-table td {
            text-align: center;
        }
        p {
        font-size: 20px; /* Yazı boyutunu 16 piksel olarak ayarlar */
        }

    </style>
</head>
<body>
    
     <nav><%@include file="navbar.jsp" %></nav>

     <div class="container-wrapper">

    <div class="container">
        <h1>Kullanıcı Bilgileri</h1>

            <% 
                while (musteriBilgiResultSet.next()) {
                    musteriID = musteriBilgiResultSet.getInt("musteriID");
                    String adi = musteriBilgiResultSet.getString("musteriAdi");
                    String soyadi = musteriBilgiResultSet.getString("musteriSoyadi");
                    String email = musteriBilgiResultSet.getString("email");
                    String telefon = musteriBilgiResultSet.getString("telefon");
                    String adres = musteriBilgiResultSet.getString("adres");
                %>
                   <div>
        <p><strong>Adı:</strong> <%= adi %></p>
        <p><strong>Soyadı:</strong> <%= soyadi %></p>
        <p><strong>Email:</strong> <%= email %></p>
        <p><strong>Telefon:</strong> <%= telefon %></p>
        <p><strong>Adres:</strong> <%= adres %></p>
    </div>
    </div>
    <div class="container">
     
            <%
                }
                musteriBilgiResultSet.close();
                musteriBilgiStatement.close();
            %>


        <h2>Satın Alınan Kitaplar</h2>
        <table class="book-table">
            <tr>
                <th>Kitap Adı</th>
                <th>Fiyat</th>
            </tr>
            <% 
                while (siparisResultSet.next()) {
                    String kitapAdi = siparisResultSet.getString("kitapAdi");
                    int fiyat = siparisResultSet.getInt("fiyat");
                %>
                <tr>
                    <td><%= kitapAdi %></td>
                    <td><%= fiyat %></td>
                </tr>
            <%
                }
                siparisResultSet.close();
                siparisStatement.close();
            %>
        </table>
    </div>
     </div>
</body>
</html>

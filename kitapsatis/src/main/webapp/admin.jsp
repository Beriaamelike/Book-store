<%@page import="veri.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<% 

    if(request.getParameter("submit")!=null)
    {
        String kitapAdi = request.getParameter("kitapAdi");
        String kategoriAdi = request.getParameter("kategoriAdi");
        String yazarAdi = request.getParameter("yazarAdi");
        String yayineviAdi = request.getParameter("yayineviAdi");
        int sayfasayisi = Integer.parseInt(request.getParameter("sayfasayisi"));
        int fiyat = Integer.parseInt(request.getParameter("fiyat"));
        String kitapFoto = request.getParameter("kitapFoto");
        String aciklama = request.getParameter("aciklama");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Database db = new Database();
        con = db.baglan();
        pst = con.prepareStatement("call kitapEkle(?,?,?,?,?,?,?,?)");
        pst.setString(1, kitapAdi);
        pst.setString(2, kategoriAdi);
        pst.setString(3, yazarAdi);
        pst.setString(4, yayineviAdi);
        pst.setInt(5, sayfasayisi);
        pst.setInt(6, fiyat);
        pst.setString(7, kitapFoto);
        pst.setString(8, aciklama);
        
        pst.executeUpdate();  
        
        %> 
    <script>   
        alert("Kitap eklendi");     
    </script> 
    <%             
    }
   %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin Panel</title>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <style>
        body {
            background-color: #f7f7f7;
            font-family: Arial, sans-serif;
        }
        .container {
            margin-top: 20px;
        }
        .header {
           background-color: #004d4d;
            height:80px;
            color: #fff;
            padding:5px 0;
            text-align: center;
        }
        .form-container {
            margin:20px;
            height:400px;
            background-color: #fff;
            width:300px;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom:5px;
            margin-right:20px;
        }
        .form-group label {
            font-weight: bold;
        }
        .form-control {
            width: 100%;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        .btn-container {
            text-align: center;
        }
        .btn-primary {
            background-color: #007bff;
            color: #fff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .table-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        table.table {
            width: 100%;
            border-collapse: collapse;
        }
        table.table th{
            height:50px;
            background-color: #004d4d;
        }
        table.table td {
            padding:0;
            height:100px;
            text-align: left;
            max-width: 400px;
        }
        table.table th {
            background-color: #333;
            color: #fff;
        }
        table.table tr:nth-child(even) {
            background-color: #f2f2f2;
            
        }
        a {
            text-decoration: none;
            margin-right: 10px;
            color: #004d4d;;
        }
        a:hover {
            text-decoration:none;
            color:#004d4d;
        }
        
        .kitapFoto{
            width:100px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Admin Paneli</h1>
            <br><br>
            <a href="index.jsp">ÇIKIŞ YAP</a>
        </div>
        
        <div class="form-container">
            <form method="POST" action="#"> 
                <div class="form-group">
                    <label class="form-label">Kitabın Adı</label>
                    <input type="text" class="form-control"  name="kitapAdi" required>
                </div>
                <div class="form-group">
                    <label class="form-label">Kategori</label>
                    <input type="text" class="form-control" name="kategoriAdi" required>
                </div>
                <div class="form-group">
                    <label class="form-label">Kitabın Yazarı</label>
                    <input type="text" class="form-control" name="yazarAdi" required>
                </div>
                <div class="form-group">
                    <label class="form-label">Yayınevi</label>
                    <input type="text" class="form-control" name="yayineviAdi" required>
                </div>
                <div class="form-group">
                    <label class="form-label">Kitabın Sayfa Sayısı</label>
                    <input type="text" class="form-control" name="sayfasayisi" required>
                </div>
                <div class="form-group">
                    <label class="form-label">Kitabın Fiyatı</label>
                    <input type="text" class="form-control" name="fiyat" required>
                </div>
                <div class="form-group">
                    <label class="form-label">Kitabın Fotoğraf Adresi</label>
                    <input type="text" class="form-control" name="kitapFoto" required>
                </div>
                <div class="form-group">
                    <label class="form-label">Açıklama</label>
                    <input type="text" class="form-control" name="aciklama" required>
                </div>
                <div class="btn-container">
                    <input type="submit" id="submit" value="Kitap Ekle" name="submit" class="btn-primary">
                   
                </div>  
            </form>
        </div>

        <div class="table-container">
            <table class="table">
                <thead>
                    <tr>
                        <th>Kitap ID</th>
                        <th>Kitap Adı</th>
                        <th>Kategori Adı</th>
                        <th>Yazar Adı</th>
                        <th>Yayınevi Adı</th>
                        <th>sayfa sayisi</th>
                        <th>Fiyat</th>
                        <th>Kitap Foto URL</th>
                        <th>Kitap Açıklama</th>
                        
                        <th>Sil</th>
                    </tr>
                     <%   
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
                                Database db = new Database();
                                con = db.baglan();
                                String query = "SELECT k.kitapID, k.kitapAdi, y.yazarAdi, k.fiyat, k.sayfasayisi, k.kitapfoto, ka.kategoriAdi, ye.yayineviAdi, k.aciklama " +
                   "FROM kitap k " +
                   "JOIN yazar y ON k.yazarID = y.yazarID " +
                   "JOIN kategori ka ON k.kategoriID = ka.kategoriID " +
                   "JOIN yayinevi ye ON k.yayineviID = ye.yayineviID";

            // Execute the query
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                int kitapID = resultSet.getInt("kitapID");
                String kitapAdi = resultSet.getString("kitapAdi");
                String yazarAdi = resultSet.getString("yazarAdi");
                int fiyat = resultSet.getInt("fiyat");
                int sayfasayisi = resultSet.getInt("sayfasayisi");
                String aciklama = resultSet.getString("aciklama");
                String kitapFoto = resultSet.getString("kitapFoto");
                String kategoriAdi = resultSet.getString("kategoriAdi");
                String yayineviAdi = resultSet.getString("yayineviAdi");
                            %>
                            <tr>
                                <td><%=kitapID%></td>
                                <td><%=kitapAdi%></td>
                                <td><%=kategoriAdi%></td>
                                <td><%=yazarAdi%></td>
                                <td><%=yayineviAdi %></td>
                                <td><%=sayfasayisi%></td>
                                <td><%=fiyat%></td>
                                <td><%=kitapFoto %></td>
                                <td><%=aciklama%></td>
                               
                                <td><a href="delete.jsp?id=<%=resultSet.getInt("kitapID")%>">Sil</a></td>
                            </tr> 
                            <%
                                }
                            %>
                </thead>
                <tbody>
            </table>
        </div>
    </div>
</body>
</html>
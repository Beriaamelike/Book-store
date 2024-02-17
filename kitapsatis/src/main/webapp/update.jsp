<%@page import="veri.Database"%>
<%@page import="java.sql.*" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.CallableStatement"%>

<% 
if (request.getParameter("submit") != null) {
    int kitapID = Integer.parseInt(request.getParameter("id"));
    String kitapAdi = request.getParameter("kitapAdi");
    String kategoriAdi = request.getParameter("kategoriAdi");
    String yazarAdi = request.getParameter("yazarAdi");
    String yayineviAdi = request.getParameter("yayineviAdi");
    int sayfasayisi = Integer.parseInt(request.getParameter("sayfasayisi"));
    int fiyat = Integer.parseInt(request.getParameter("fiyat"));
    String kitapFoto = request.getParameter("kitapFoto");
    String aciklama = request.getParameter("aciklama");

    Database db = new Database();
    Connection con = db.baglan();
    PreparedStatement pst = null;

    try {
        pst = con.prepareStatement("CALL kitapGuncelle(?,?,?,?,?,?,?,?,?)");
        pst.setString(1, kitapAdi);
        pst.setString(2, kategoriAdi);
        pst.setString(3, yazarAdi);
        pst.setString(4, yayineviAdi);
        pst.setInt(5, sayfasayisi);
        pst.setInt(6, fiyat);
        pst.setString(7, kitapFoto);
        pst.setString(8, aciklama);
        pst.setInt(9, kitapID);
        
        pst.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace(); // Hata mesajını konsola yazdırabilirsiniz.
    } finally {
        try {
            if (pst != null) {
                pst.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

%>

        
        <script>   
            alert("Record Updateddddd");           
       </script>
<% 
    }  %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title> 
        
         <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <style>

  input {
    display: block;
  }

  /* İstediğiniz input alanlarının stilini özelleştirme */
  input[type="text"] {
    height:100px;
  }
</style>

        
        
    </head>
    <body>
        <h1>Student Update</h1>
        
        
        <div class="row">
            <div class="col-sm-4">
                <form  method="POST" action="#" >
                    
                    <%    
                    try{
                    
                           
                       int kitapID = Integer.parseInt(request.getParameter("id"));
                        PreparedStatement pst;
                        ResultSet rs;
                        Connection con;
                        Database db = new Database();
                        con = db.baglan();
                        pst = con.prepareStatement("CALL kitapBilgileri(?, @kitapAdi, @kategoriAdi, @yazarAdi, @yayineviAdi, @sayfasayisi, @fiyat, @kitapFoto, @aciklama);");
                        pst.setInt(1, kitapID);
                        rs = pst.executeQuery();
               String   SQL = "{call kitapBilgileri(?, ?, ?, ?, ?, ?, ?, ?, ?)}";
            CallableStatement callableStatement = con.prepareCall(SQL);
            callableStatement.setInt(1, kitapID);

            // OUT parametrelerini tanımlayın
            callableStatement.registerOutParameter(2, Types.VARCHAR);  // kitapAdi
            callableStatement.registerOutParameter(3, Types.VARCHAR);  // kategoriAdi
            callableStatement.registerOutParameter(4, Types.VARCHAR);  // yazarAdi
            callableStatement.registerOutParameter(5, Types.VARCHAR);  // yayineviAdi
            callableStatement.registerOutParameter(6, Types.INTEGER);  // sayfasayisi
            callableStatement.registerOutParameter(7, Types.INTEGER);  // fiyat
            callableStatement.registerOutParameter(8, Types.VARCHAR);  // kitapFoto
            callableStatement.registerOutParameter(9, Types.VARCHAR);  // aciklama

            // Saklı yordamı çağırın
            callableStatement.execute();

            // OUT parametrelerini alın
            String kitapAdi = callableStatement.getString(2);
            String kategoriAdi = callableStatement.getString(3);
            String yazarAdi = callableStatement.getString(4);
            String yayineviAdi = callableStatement.getString(5);
            int sayfasayisi = callableStatement.getInt(6);
            int fiyat = callableStatement.getInt(7);
            String kitapFoto = callableStatement.getString(8);
            String aciklama = callableStatement.getString(9);

                    
                    %>
 <div align="left">
    <label class="form-label">Kitap Adı</label>
    <input type="text" value="<%= kitapAdi%>" name="kitapAdi"  required >
</div>

<div align="left">
    <label class="form-label">Course</label>
    <input type="text" class="form-control" placeholder="Course" name="kategoriAdi" value="<%= kategoriAdi%>" id="course" required >
</div>

<div align="left">
    <label class="form-label">Fee</label>
    <input type="text" class="form-control" name="yazarAdi" id="fee" value="<%= yazarAdi%>" required >
</div>

<div align="left">
    <label class="form-label">Yayınevi Adı</label>
    <input type="text" class="form-control" value="<%= yayineviAdi%>" name="yayineviAdi"  required >
</div>

<div align="left">
    <label class="form-label">Sayfa Sayısı</label>
    <input type="text" class="form-control" value="<%= sayfasayisi%>" name="sayfasayisi"  required >
</div>

<div align="left">
    <label class="form-label">Fiyat</label>
    <input type="text" class="form-control" value="<%= fiyat%>" name="fiyat"  required >
</div>

<div align="left">
    <label class="form-label">Kitap Foto</label>
    <input type="text" class="form-control" value="<%= kitapFoto%>" name="kitapFoto"  required >
</div>

<div align="left">
    <label class="form-label">Açıklama</label>
    <input type="text" class="form-control" value="<%= aciklama%>" name="aciklama"  required >
</div>

                    <% 
    // Your database code here
    // ...
} catch (SQLException e) {
    // Handle the SQL exception here, e.g., print the error message
    e.printStackTrace();
} %>
                    
                    
                    
                         </br>
                         
                     <div alight="right">
                         <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                         <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                     </div>  
                         
                         <div align="right">
                             
                             <p><a href="index.jsp">Click Back</a></p>
                             
                             
                         </div>
  
                </form>
            </div>          
        </div>
  
    </body>
</html>
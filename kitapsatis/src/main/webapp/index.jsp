<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="veri.Database"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%> 


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Anasayfa</title>
    <link rel="stylesheet" href="main.css">

    <!-- Fonts...... -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@300&display=swap" rel="stylesheet">

    <!-- Google icons  -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        
        <style>
            html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed, 
figure, figcaption, footer, header, hgroup, 
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure, 
footer, header, hgroup, menu, nav, section {
	display: block;
}
body {
	line-height: 1;
}
ol, ul {
	list-style: none;
}
blockquote, q {
	quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
	content: '';
	content: none;
}
table {
	border-collapse: collapse;
	border-spacing: 0;
}

body{

    background-color: #a3c2c2;
}


@media(min-width: 900px){

    main{
        margin-top: 1em;
        font-family: cursive;
        display: flex;
        flex-direction: row;
        flex-wrap: wrap;
        justify-content: space-evenly;
        align-items: center;
    }
    .books{
        display: flex;
        flex-direction: row;
        width: 390px;
        height:290px;
        justify-content: space-evenly;
        border-radius: 10px;
        border-color: red;
        margin-top:1.5em;
        background-color: #f0f5f5;
        margin-bottom: 3em;
        box-shadow: rgba(0, 0, 0, 0.25) 5px 10px 30px -5px;
    }
    
    .books:hover{
        transform: scale(1.05);
    }

    .book-img{
        width: 150px;
        height:250px;
        border-radius: 3px;
        transition: transform 1s;
        margin-top: 1em;
        margin-left:1em;
        margin-right: 0.2em;
        box-shadow: rgba(0, 0, 0, 0.19) 0px 10px 20px, rgba(0, 0, 0, 0.23) 0px 6px 6px;
    }

    .descp{
        margin-top: 0.5em;
        padding: 1em;
        width:170px;
        height:110px;
        
    }
    .book-name{
        font-weight: bold;
        padding-bottom: 0.5em;
        font-size: 1.1em;
        letter-spacing: 1px;
        color: black;
    }
    .author{
        padding-bottom: 0.5em;
        font-size: 1.1em;
        letter-spacing: 1px;
        color: black;
    }
    .rating{
        padding-bottom: 1.2em;
        font-size: 1em;
        letter-spacing: 1px;
        color: black;
    }
    .info{
        font-size: 1em;
        letter-spacing: 1px;
        color: black;
        font-size:12px;

    }
    .descp button{
        margin-top:1em;
        padding:10px;
        background: none;
        border: none;       
        width:150px;
        background-color: #e6e6e6;
        padding: 0.6em 1.5em;
        font-size: 1em;
        border-radius: 10px;
        font-weight: bolder;
        color: #004d4d;
        
        
   
    }
    .descp button:hover{
        transform: scale(1.10);
  
    }
    
  
    .type{
        font-size:12px;
        margin-bottom:4px;
        color:#004d4d;
        font-weight: bold;
    }


       
    #anasayfa{
        background-color: #c1c1d7;
    }
    
    a{
        color: #004d4d;
        text-decoration: none;
    }

}

            
        </style>
</head>

<body>
    <nav><%@include file="navbar.jsp" %></nav>

    <main>
        <%  
            ResultSet resultSet;
            String query="";
            int kategoriID = 0;
            try{
             kategoriID = Integer.parseInt(request.getParameter("id"));
            }
            catch(Exception e){
            
            }
            Database db = new Database();
            Connection connection = db.baglan();
            PreparedStatement preparedStatement;
            if(kategoriID==0){
            query = "SELECT k.kitapID, k.kitapAdi, y.yazarAdi, k.fiyat, k.aciklama, k.kitapfoto , "
            + "ka.kategoriAdi FROM kitap k, yazar y , kategori ka WHERE k.yazarID = y.yazarID AND k.kategoriID=ka.kategoriID";
            Statement statement = connection.createStatement();
            resultSet = statement.executeQuery(query);
            }
            else{
            query = "SELECT k.kitapID, k.kitapAdi, y.yazarAdi, k.fiyat, k.aciklama, k.kitapfoto , "
            + "ka.kategoriAdi FROM kitap k, yazar y, kategori ka WHERE k.yazarID = y.yazarID AND k.kategoriID = ka.kategoriID AND k.kategoriID = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, kategoriID);
            resultSet = preparedStatement.executeQuery();
            }

           

            // Kitapları listele
            while (resultSet.next()) {
                int kitapID = resultSet.getInt("kitapID");
                String kitapAdi = resultSet.getString("kitapAdi");
                String yazarAdi = resultSet.getString("yazarAdi");
                int fiyat = resultSet.getInt("fiyat");
                String aciklama = resultSet.getString("aciklama");
                String kitapFoto = resultSet.getString("kitapFoto");
                String kategoriAdi = resultSet.getString("kategoriAdi");
        %>
        
        <div class="books">
            <div>
                <img src="<%= kitapFoto %>" alt="" class="book-img">
            </div>
            <div class="descp">
                <h2 class="book-name"><%= kitapAdi %></h2>
                <h3 class="author"><%= yazarAdi %></h3>
                <h3 class="rating"><%= fiyat %> TL</h3>
                <h1 class="type"><%=kategoriAdi%></h1>
                <p class="info"><%= aciklama %></p>
                
                <%
                    if ("customer".equals(userType)) {
                %>
                <button><a href="sepeteEkle.jsp?id=<%= kitapID %>">Sepete Ekle</a></button>
                <%
                    } else {
                %>
                <button onclick="showAlert()">Sepete Ekle</button>
                <%
                    }
                %>
            </div>
        </div>
        <%
            }
            
            // Close the resources
            resultSet.close();
            connection.close();
        %>
    </main>

    <script>
        function showAlert() {
            alert("Sepete eklemek için önce giriş yapmalısınız.");
            window.location.href = "login.jsp";
        }
    </script>
</body>


</html>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
   <head>
      <meta charset="utf-8">
      <title>A simple navigation bar</title>
      <link rel="stylesheet" href="style.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
          
<style>              
    nav{
        margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
    }
    
    body,ul{
	margin: 0;

}
    

.nav-bar{
        display: flex;
        flex-direction: row;
        justify-content:left;
        align-items: center;
        background-color:#e6e6e6 ;
        font-family: 'Roboto', sans-serif;
        
    }

.nav-link {
   display: inline-block;
   width: 130px;
   font-size:16px;
   color:  #004d4d;

   text-align: center;
   line-height: 70px;

   text-decoration: none;
   
}

#logo {
   width: 190px;
   background-color: #004d4d;
   font-family: cursive;
   font-weight: bold;
   font-size:25px;
   color:white;
}

#login {
   position: absolute;
   top: 0;
   right: 200px;
}

#sepet {
   position: absolute;
   top: 0;
   right: 20px;
}


.cikis{
    text-decoration: none;
    color:#660066;
}
          </style>
   </head>
   <body>
      <nav class="nav-bar">
         <a id="logo" class="nav-link" >Kitapzon</a>
         <a class="nav-link" id="anasayfa" href="index.jsp">Anasayfa</a>
         <a class="nav-link" id="kategoriler" href="kategori.jsp">Kategoriler</a>
         <a class="nav-link" id="hakkimizda" href="hakkimizda.jsp">Hakkımızda</a>
         <a class="nav-link" id="iletisim" href="iletisim.jsp">İletişim</a>

 <% String userType = (String) session.getAttribute("userType");
  String musteriAdi = (String) session.getAttribute("musteriAdi");
  String musteriSoyadi = (String) session.getAttribute("musteriSoyadi");
 
  if ("customer".equals(userType)) {
  %>
            <ul id="login">
            <a class="cikis" href="cikis.jsp">Çıkış Yap</a>
            <a  class="nav-link"  href="kullaniciBilgileri.jsp"><i class="fa-solid fa-user fa-xl"style="color: #004d4d;"></i><%=" "+musteriAdi%></a>
            </ul>
            <ul id="sepet">
            <a  class="nav-link" id="sepet" href="sepet.jsp"><i class="fa-solid fa-cart-shopping fa-xl"  style="color: #004d4d;"></i>Sepete Git</a>
            </ul>
            
            <% }else{

%>
         <ul id="login">  
         <a  class="nav-link"  href="login.jsp"><i class="fa-solid fa-user fa-xl"style="color: #004d4d;"></i>Giriş Yap</a>
         </ul>
         <ul id="sepet">
         <a  class="nav-link" id="sepet" href="#" onclick="showLoginAlert()"><i class="fa-solid fa-cart-shopping fa-xl"  style="color: #004d4d;"></i>  Sepete Git</a>
         </ul>
 <% } 
 
 %>        
         
      </nav>
   <script>
        function showLoginAlert() {
            alert("Sepeti görüntülemek için önce giriş yapmalısınız.");
            window.location.href = "login.jsp";
        }
    </script>
   </body>
</html>
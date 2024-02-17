<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="veri.Register" %>

<!DOCTYPE html>
<!-- Created By CodingLab - www.codinglabweb.com -->
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title> Kaydol </title>
    <link rel="stylesheet" href="style.css">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <style>
         @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
         
body{
  background-color: whitesmoke;
}


.container{
  position: absolute;
  margin-top:300px;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 700px;
  background-color: white;
  height:360px;
  

}

.content .user-details{
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  margin: 20px 40px 30px 15px;
}
.user-details .input-box{
  margin-bottom: 15px;
  width: calc(100% / 2 - 20px);
}
input-box span.details{
  display: block;
  font-weight: 500;
  height:30px;
}
.user-details .input-box input{
  height: 45px;
  width: 100%;
  outline: none;
  font-size: 16px;
  border-radius: 5px;
  padding-left: 15px;
  border: 1px solid #ccc;
  border-bottom-width: 2px;
  transition: all 0.3s ease;
}

#button{
    background-color: #004d4d;
    color:white;
    height: 45px;
    width: 300px;
    outline: none;
    font-size: 16px;
    border-radius: 5px;
    padding: 15px;
    padding-bottom: 30px;
    border: 1px solid #ccc;
    border-bottom-width: 2px;
    transition: all 0.3s ease;
    margin: 10px auto;
}

     </style>
     
     
   </head>
<body>
  <nav><%@include file="navbar.jsp" %></nav>
  <div class="container">
    <div class="content">
        <form action="Register" method="Post">
        <div class="user-details">
          <div class="input-box">
            <span class="details">Ad</span>
            <input type="text" name="musteriAdi" placeholder="Adınızı giriniz" required>
          </div>
          <div class="input-box">
            <span class="details">Soy Ad</span>
            <input type="text" name="musteriSoyadi" placeholder="Soy adınızı giriniz" required>
          </div>
          <div class="input-box">
            <span class="details">Email</span>
            <input type="text" name="email" placeholder="mailinizi giriniz" required>
          </div>
          <div class="input-box">
            <span class="details">Telefon Numarası</span>
            <input type="text" name="telefon" placeholder="Telefon numaranızı giriniz" required>
          </div>
            <div class="input-box">
            <span class="details">Adres</span>
            <input type="text" name="adres" placeholder="Adresinizi giriniz" required>
          </div>
          <div class="input-box">
            <span class="details">Şifre</span>
            <input type="text" name="sifre" placeholder="Şifrenizi giriniz" required>
          </div>
            <input type="submit" name="button" id="button" value="kaydol" required>
   </div>
        </form>
 
  </div>
  </div>


</body>
</html>

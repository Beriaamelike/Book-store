
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>İletişim - Kitap Satış Sitesi</title>
    <link rel="stylesheet" href="style.css">
        <style>
            
             #iletisim{
            background-color: #c1c1d7;
        }
        
            body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f0f0f0;
}

header h1 {
    margin: 0;
}


main {
    max-width: 900px;
    margin: 20px auto;
    height:380px;
    padding: 130px;
    text-align: center;
    
    font-family: cursive;
    box-shadow: rgba(0, 0, 0, 0.25) 0px 25px 50px -12px;
}


p{
    font-size:18px;
}

</style>
</head>
<body>
    <nav><%@include file="navbar.jsp" %></nav>
    <main>
        <p style="font-weight: bold;">Bize aşağıdaki bilgilerden ulaşabilirsiniz:</p>
        <address>
            <p>Adres: Çukurçayır Mah. Ortahisar/TRABZON</p>
            <p>Telefon: 0123 456 7890</p>
            <p>E-posta: info@kitapzon.com</p>
        </address>
    </main>
</body>
</html>


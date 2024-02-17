<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%> 


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kategoriler</title>
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

/* ---------------------------------------------------------- Main css -------------------------------------------------------------*/
body{
    font-family: 'Roboto', sans-serif;
    min-height: 100vh;

}


/*--------------------------------------------------------------- fOR PC AND LAPTOPS -------------------------------------------- */
@media(min-width: 900px){
    /* ----------------------------------------------------- Navbar ---------------------------------------------------------- */
    
   
    /* ------------------- MAIN BOOKS ---------------------------------- */
    main{
        margin-top: 1em;
        font-family: 'Noto Sans JP', sans-serif;
        display: flex;
        flex-direction: row;
        flex-wrap: wrap;
        justify-content: space-evenly;
        align-items: center;
    }
    .books{
        display: flex;
        flex-direction: row;
        width: 100%;
        width: 350px;
        height:300px;
        justify-content: space-evenly;
        background-color: white;
        margin-bottom: 3em;
        box-shadow: rgba(0, 0, 0, 0.25) 0px 25px 50px -12px;
    }
    .book-img{
        width: 100%;
        width: 200px;
        height:200px;
        border-radius: 3px;
        transition: transform 1s;
        margin: 1.5em;
        box-shadow: rgba(0, 0, 0, 0.19) 0px 10px 20px, rgba(0, 0, 0, 0.23) 0px 6px 6px;
    }
    
    .book-img:hover{
        transform: scale(1.05);
    }
    .descp{
        margin: 1.5em;
        padding: 1em;
        
    }
    .book-name{
        font-weight: bold;
        padding-bottom: 0.5em;
        font-size: 1.1em;
        letter-spacing: 1px;
        color: black;
        width:100%;
        text-align:center;
    }
    .author{
        padding-bottom: 0.5em;
        font-size: 1.1em;
        letter-spacing: 1px;
        color: white;
    }
    .rating{
        padding-bottom: 1.2em;
        font-size: 1em;
        letter-spacing: 1px;
        color: white;
    }
    .info{
        font-size: 1em;
        letter-spacing: 1px;
        color: white;
    }
    .descp button{
        margin-top: 1em;
        background: none;
        border: none;
        color: #cbb5e2;
        background-color: white;
        padding: 0.6em 1.5em;
        font-size: 1em;
        border-radius: 20px;
        font-weight: bolder;
    }
    .descp button:hover{
        color: #a790f2;
    }

    
    #kategoriler{
        background-color: #c1c1d7;
    }

    

}

            
        </style>
</head>

<body>
    <nav><%@include file="navbar.jsp" %></nav>

    <main>
        <div class="books">
            <div>
                <a href="index.jsp?id=1">
  <img src="https://www.orhangazi.net/wp-content/uploads/2017/11/bursa-ile-ilgili-kitaplar-bursa-uzerine-kitap-eser.jpeg" alt="" class="book-img">
</a>

                <h2 class="book-name">Roman</h2>
            </div>
        </div>

        <div class="books">
            <div>
                <a href="index.jsp?id=8">
                <img src="https://frpnet.net/wp-content/uploads/2012/03/en-iyi-100-bilimkurgu-3.jpg" alt="" class="book-img">
                    </a>
                <h2 class="book-name">Bilim Kurgu</h2>
                
            </div>
            
        </div>
        
        <div class="books">
            <div>
                <a href="index.jsp?id=3">
                <img src="https://media.istockphoto.com/id/1202075933/tr/vekt%C3%B6r/siyah-beyaz-%C3%A7izgi-roman-sayfas%C4%B1-konu%C5%9Fma-kabarc%C4%B1klar%C4%B1-ve-sesler-etkisi-ile-%C3%A7izgilere.jpg?s=612x612&w=is&k=20&c=KKFjn9OrL1y2LGL3ROI6V8C4WHJAHPIyzZ-3mhsxsQI=" alt="" class="book-img">
                </a>
                <h2 class="book-name">Çizgi Roman</h2>
        </div>
        </div>
        
        <div class="books">
            <div>
                <a href="index.jsp?id=6">
                <img src="https://www.istanbulegitimler.com/wp-content/uploads/2016/02/ki%C5%9Fisel-geli%C5%9Fim-1.jpg" alt="" class="book-img">
                </a>
                <h2 class="book-name">Kişisel Gelişim</h2>
            </div>
        </div>
        
        <div class="books">
            <div>
                <a href="index.jsp?id=7">
                <img src="data:image/jpeg;base64,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" alt="" class="book-img">
                </a>
                <h2 class="book-name">Tarih</h2>    
            </div>
        </div>

        <div class="books">
            <div>
                <a href="index.jsp?id=5">
                <img src="https://ia.tmgrup.com.tr/d91581/0/0/0/0/660/434?u=https://i.tmgrup.com.tr/fikriyat/2019/02/27/islam-hukuku-acisindan-din-ve-vicdan-hurriyeti-nasil-olmalidir-1551272784187.jpg" alt="" class="book-img">
                </a>
                <h2 class="book-name">Din</h2>
            </div>
        </div>

        <div class="books">
            <div>
                <a href="index.jsp?id=2">
                <img src="https://bgcp.bionluk.com/images/portfolio/1400x788/ade513de-46ab-4474-9ca7-38f7f01f1219.jpeg" alt="" class="book-img">
                </a>
                <h2 class="book-name">Çocuk</h2>
            </div>
        </div>

        <div class="books">
            <div>
                <a href="index.jsp?id=4">
                <img src="https://www.nettercume.com.tr/wp-content/uploads/2019/03/siir-cevirisi-3.jpg" alt="" class="book-img">
                </a>
                    <h2 class="book-name">Şiir</h2>
            </div>
        </div>


       


    </main>

</body>

</html>
<%-- 
    Document   : indexSearch
    Created on : Feb 28, 2020, 10:12:16 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home suggestion</title>
        <link rel="stylesheet" href="css/default.css"/>
        <script type="text/javascript" src="js/default.js"></script>
    </head>
    <body onload="return displaySearchSimpleSpace()">
        <!--        header-->
        <div class="header_container">
            <div class="logo"></div>
            <div class="line">
                <p>TÌM KIẾM NGÔI NHÀ TRONG MƠ CỦA BẠN</p>
            </div>
            <div class="love_list"></div>
            <div class="login"></div>
        </div>
        
        <!--search bar-->
        <div class="search_container">
            <div class="search_space" id="search_option">
                <input id="btn_more_option" type="submit" value="Tùy chọn nâng cao" name="btnMoreOption" onclick="return displaySearchSimpleSpace()"/>
            </div>
<!--            <div class="search_space" id="search_simple">
                <input id="btn_more_simple" type="submit" value="Tùy chọn nâng cao" name="btnMoreSimple" onclick="return displaySearchOptionSpace()"/>
            </div>-->
        </div>
    </body>
</html>

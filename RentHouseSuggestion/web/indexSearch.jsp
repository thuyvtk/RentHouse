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
    <body onload="return displaySearchOptionSpace()">
        <!--        header-->
        <div class="header_container">
            <div class="logo" onclick="location.href = ''"></div>
            <div class="line">
                <p>TÌM KIẾM NGÔI NHÀ TRONG MƠ CỦA BẠN</p>
            </div>
            <div class="love_list"></div>
            <div class="login" onclick="location.href = 'loginPage.html'"></div>
        </div>

        <!--search space-->
        <div class="search_container">
            <div id="search_space">
                <input id="search_bar" type="text" name="txtSearchValue" placeholder="Tìm theo khu vực, địa điểm..." />
                <input type="submit" value="Tìm kiếm" name="action" id="btn_Search"/>
                <br/>
                <input id="btn_MoreOption" type="submit" value="Tùy chọn nâng cao" name="btnMoreOption" onclick="return displaySearchOptionSpace()"/>
            </div>
        </div>
    </body>
</html>

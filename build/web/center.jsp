<%-- 
    Document   : center
    Created on : 04/03/2023, 10:33:53 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/css/font-awesome.min.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">
        <title>Center Page</title>
    </head>
    <body>
        <div>
            <div class="headd">
                <jsp:include page="top.jsp"></jsp:include>
            </div>
            <div class="centerr">
                <div class="ct1"><jsp:include page="left.jsp"></jsp:include></div>
                <div class="ct2 ${(number != 1 && number != 4)? "pdl" : ""}"><jsp:include page="rightcenter.jsp"></jsp:include></div>
            </div>
            <div class="bottomm">
                <div><jsp:include page="bottom.jsp"></jsp:include></div>
            </div>
        </div>
    </body>
</html>

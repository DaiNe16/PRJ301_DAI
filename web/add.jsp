<%-- 
    Document   : add
    Created on : 06/03/2023, 4:56:54 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/css/font-awesome.min.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">
        <title>Edit Page</title>
        <style>
            body{
                padding: 50px;
                background: linear-gradient(135deg, #71b7e6, #9b59b6);
            }
            .myContainer{
                padding: 0 200px;
            }
            .myForm {
                width: 100%;
                height: 580px;
                display: flex;
                justify-content: center;
                align-items: center;
            }
            form{
                /*background-color: rgba(242, 176, 198, 0.8);*/
                width: 800px;
                height: 500px;
                color: red;
                font-size: 18px;
                font-weight: 600;
            }
        </style>
    </head>
    <body>
        <div class="myContainer">
            <jsp:include page="top.jsp"></jsp:include>
                <h1 style="text-align: center; padding-top: 25px; color: yellow;">Add New Question</h1>
                <div class="myForm">
                    <div style="padding: 20px;background-color: rgba(242, 176, 198, 0.8);" class="cotent">
                        <form action="add" method="POST">
                        <select style="margin-left: 180px;" class="it1" name="subject">
                            <c:forEach items="${data}" var="i">
                                <option ${id == i.id ? "selected" : ""} value="${i.id}">${i.name} (${i.id})</option>
                            </c:forEach>
                        </select>
                        <br>
                        <c:set var="num" value="4"></c:set>
                        Question: <br><input size="50" style="width: 750px; height: 40px;" type="text" name="question" value="${qt.content}" />
                        <br>
                        Answer: <br>
                        <div id="contain">
                            <input style="width: 750px; height: 40px; margin-bottom: 10px" type="text" name="answer" value="" />
                            <input style="width: 750px; height: 40px; margin-bottom: 10px" type="text" name="answer" value="" />
                        </div>
                        <img onclick="add()" style="width: 30px; cursor: pointer;" src="./image/plus.png" alt="alt"/>
                        <img onclick="remove()" style="width: 29px; cursor: pointer; margin-left: 10px;" src="./image/minus.png" alt="alt"/>
                        <br>

                        CorrectAns:<br>
                        <div style="display: flex; justify-content: space-between;">
                            <select style="width: 50px; height: 50px;" name="correctAns">
                                <c:forEach begin="1" end="${num}" var="i">
                                    <option value="${i}">${i}</option>
                                </c:forEach>
                            </select>
                            <input class="btn btn-success" type="submit" value="Add"/>
                        </div>

                    </form>
                </div>

            </div>
        </div>
        <script>
            function add() {
                const contain = document.getElementById("contain");
                const inputTag = document.createElement('input');
                //style="width: 750px; height: 40px; margin-bottom: 10px" type="text" name="answer" value=""
                inputTag.style.width = '750px';
                inputTag.style.height = '40px';
                inputTag.style.marginBottom = '10px';
                inputTag.type = "text";
                inputTag.name = "answer";
                contain.appendChild(inputTag);
            }
            function remove() {
                const select = document.getElementById("contain");
                select.removeChild(select.lastChild);
            }
        </script>
    </body>
</html>


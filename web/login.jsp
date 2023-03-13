<%-- 
    Document   : Login
    Created on : 04/03/2023, 8:59:56 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/css/font-awesome.min.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">

        <title>Login Form</title>
    </head>
    <body>
        <form id="f" action="login" method="post">
            <section class="form-02-main">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="_lk_de">
                                <div class="form-03-main">
                                    <div class="logo">
                                        <img src="assets/images/user.png">
                                    </div>
                                    <c:if test="${loginFail != null}"><label class="mydanger">Your account is wrong!</label></c:if>
                                    <div class="form-group">
                                        <input type="email" name="account" class="form-control _ge_de_ol" type="text" placeholder="Enter Account" required="" aria-required="true">
                                    </div>
                                    <div class="form-group">
                                        <input name="password" class="form-control _ge_de_ol" type="password" placeholder="Enter Password" required="" aria-required="true">
                                    </div>
                                    <div class="checkbox form-group">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="">
                                            <label class="form-check-label" for="">
                                                Remember me
                                            </label>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="_btn_04">
                                            <a onclick="submit()" href="#">Login</a>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </form>
                                    <script>
                                        function submit() {
                                            document.getElementById("f").submit();
                                        }
                                    </script>
    </body>
</html>
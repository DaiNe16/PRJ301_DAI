<%-- 
    Document   : left
    Created on : 04/03/2023, 2:17:50 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="contain">
    <a href="center" style="text-decoration: none; ${(number == 1 || number == null) ? "pointer-events:none" : ""}" class="item ${(number == 1 || number == null)? "active" : ""}">
        <img src="./image/423483-200.png" alt="alt"/>
        <span>Home Page</span>
    </a>
    <a href="manage" style="text-decoration: none; ${(number == 2) ? "pointer-events:none" : ""}" class="item ${(number == 2)? "active" : ""}">
        <img src="./image/3524335.png" alt="alt"/>
        <span>Manage Question</span>
    </a>
    <a href="render" style="text-decoration: none; ${(number == 3) ? "pointer-events:none" : ""}" class="item ${(number == 3)? "active" : ""}">
        <img src="./image/Settings-PNG0.png" alt="alt"/>
        <span>Render Exam</span>
    </a>
    <a href="statistic" style="text-decoration: none; ${(number == 4) ? "pointer-events:none" : ""}" class="item ${(number == 4)? "active" : ""}">
        <img src="./image/statistic-icon-0.png" alt="alt"/>
        <span>Statistic</span>
    </a>
    <a href="view" style="text-decoration: none; ${(number == 5) ? "pointer-events:none" : ""}" class="item ${(number == 5)? "active" : ""}">
        <img src="./image/Exam.png" alt="alt"/>
        <span>View Exam</span>
    </a>
    <a href="mark" style="text-decoration: none; ${(number == 6) ? "pointer-events:none" : ""}" class="item ${(number == 6)? "active" : ""}">
        <img src="./image/check-mark-png-black-transparent-18.png" alt="alt"/>
        <span>Mark Stattus</span>
    </a>
</div>

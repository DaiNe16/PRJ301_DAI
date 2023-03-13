<%-- 
    Document   : rightcenter
    Created on : 04/03/2023, 8:52:03 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js"></script>
<link href="css/manager.css" rel="stylesheet" type="text/css"/>
<form id="f" action="manage" method="post">
    <c:choose>
        <c:when test="${number == 1}">
            <img class="rightcenter_img" src="./image/173272355-w600-2829-1554360715.png" alt="alt"/>
        </c:when>
        <c:when test="${number == 2}"><!-- Manage Question -->

            <div id="selectSubject">
                <select class="it1" onchange="submit()" name="subject">
                    <option value="1">Select subject</option>
                    <c:forEach items="${data}" var="i">
                        <option ${id == i.id ? "selected" : ""} value="${i.id}">${i.name} (${i.id})</option>
                    </c:forEach>
                </select>
                <input onchange="search('${id}', this.value)" class="it1 it2" type="text" value="${txt}" placeholder="Search..." />
                <a style="
                   display: flex;
                   justify-content: center;
                   align-items: center;" 
                   onclick="add()" class="btn btn-success" data-toggle="modal">
                    <i style="padding-bottom: 5px;" class="material-icons">&#xE147;</i> 
                    <span>Add New Question</span>
                </a>
            </div>
            <c:set var="count" value="1"></c:set>
            <c:if test="${dataQ != null}">
                <c:forEach items="${dataQ}" var="q">
                    <h4 style="color: #dc3545; font-size: 22px;">${count}. ${q.content}</h4>
                    <ul>
                        <c:set var="count1" value="1"></c:set>
                        <c:forEach items="${dataA}" var="a">
                            <c:if test="${q.id == a.quesID}">
                                <li 
                                    class="<c:forEach items="${dataC}" var="c">
                                        <c:if test="${a.id == c.correctAns}">green</c:if>
                                    </c:forEach>"
                                    >${count1}. ${a.content}</li>
                                    <c:set var="count1" value="${count1+1}"></c:set>
                                </c:if>
                            </c:forEach>
                    </ul>
                    <a href="edit?id=${q.id}&subject=${id}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                    <a href="delete?id=${q.id}&subject=${id}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                    <br>
                    <c:set var="count" value="${count+1}"></c:set>
                </c:forEach>
            </c:if>

        </c:when>
        <c:when test="${number == 3}"><!-- Render Exam -->
            <div id="selectSubject">
                <select class="it1" name="subject">
                    <c:forEach items="${data}" var="i">
                        <option ${id == i.id ? "selected" : ""} value="${i.id}">${i.name} (${i.id})</option>
                    </c:forEach>
                </select>
                <a style="
                   display: flex;
                   justify-content: center;
                   align-items: center;" 
                   onclick="render()" class="btn btn-primary" data-toggle="modal">
                    <span>Render</span>
                </a>
            </div>
            <c:set var="count" value="1"></c:set>
            <c:if test="${dataQ != null}">
                <c:forEach items="${dataQ}" var="q">
                    <h4 style="color: #dc3545; font-size: 22px;">${count}. ${q.content}</h4>
                    <ul>
                        <c:set var="count1" value="1"></c:set>
                        <c:forEach items="${dataA}" var="a">
                            <c:if test="${q.id == a.quesID}">
                                <li>${count1}. ${a.content}</li>
                                    <c:set var="count1" value="${count1+1}"></c:set>
                                </c:if>
                            </c:forEach>
                    </ul>
                    <br>
                    <c:set var="count" value="${count+1}"></c:set>
                </c:forEach>
            </c:if>
        </c:when>
        <c:when test="${number == 4}"><!-- Statistic -->
            <input id="mod" style="display: none" type="text" name="mode" value=""/>
            <div id="selectSubject">
                <select class="it1" onchange="statistic1()" name="subject">
                    <option value="1">Select subject (Statistic Question)</option>
                    <c:forEach items="${data1}" var="i">
                        <option ${id1 == i.id ? "selected" : ""} value="${i.id}">${i.name} (${i.id})</option>
                    </c:forEach>
                </select>
                <select class="it1" onchange="statistic2()" name="subject1">
                    <option value="1">Select subject (Statistic Mark)</option>
                    <c:forEach items="${data2}" var="i">
                        <option ${id2 == i.id ? "selected" : ""} value="${i.id}">${i.name} (${i.id})</option>
                    </c:forEach>
                </select>
            </div>

            <c:set var="count" value="1"></c:set>
            <c:if test="${dataStatistic != null}">
                <c:forEach items="${dataStatistic}" var="ds">
                    <h4 style="color: #dc3545; font-size: 22px; padding-left: 30px;">${count}. ${ds.question.content}</h4>
                    <div style="width: 375px; height: 275px; padding-left: 30px;"><canvas id="${ds.question.id}" width="100" height="50"></canvas></div>
                    <script>
                        $(function () {
                            var ctx_2 = document.getElementById("${ds.question.id}").getContext('2d');
                            var data_2 = {
                                datasets: [{
                                        data: [${ds.correctRatio}, ${ds.wrongRatio}],
                                        backgroundColor: [
                                            '#44C651',
                                            '#f56954',
                                        ],
                                    }],
                                labels: [
                                    'True',
                                    'False'
                                ]
                            };
                            var myDoughnutChart_2 = new Chart(ctx_2, {
                                type: 'pie',
                                data: data_2,
                                options: {
                                    maintainAspectRatio: false,
                                    legend: {
                                        position: 'bottom',
                                        labels: {
                                            boxWidth: 12
                                        }
                                    }
                                }
                            });
                        });
                    </script>
                    <br>
                    <c:set var="count" value="${count+1}"></c:set>
                </c:forEach>
            </c:if>
            <br><br>        
            <c:if test="${listM != null}">
                <script>
                    window.onload = function () {
                        var chart = new CanvasJS.Chart("chartContainer", {
                            animationEnabled: true,
                            exportEnabled: true,
                            theme: "light2", // "light1", "light2", "dark1", "dark2"
                            title: {
                                text: "Mark ${id2}"
                            },
                            axisY: {
                                includeZero: true
                            },
                            data: [{
                                    type: "column", //change type to bar, line, area, pie, etc
                                    //indexLabel: "{y}", //Shows y value on all Data Points
                                    indexLabelFontColor: "#5A5757",
                                    indexLabelFontSize: 16,
                                    indexLabelPlacement: "outside",
                                    dataPoints: [
                                        {x: 0, y: ${a0}, indexLabel: "${a0}"},
                                        {x: 1, y: ${a1}, indexLabel: "${a1}"},
                                        {x: 2, y: ${a2}, indexLabel: "${a2}"},
                                        {x: 3, y: ${a3}, indexLabel: "${a3}"},
                                        {x: 4, y: ${a4}, indexLabel: "${a4}"},
                                        {x: 5, y: ${a5}, indexLabel: "${a5}"},
                                        {x: 6, y: ${a6}, indexLabel: "${a6}"},
                                        {x: 7, y: ${a7}, indexLabel: "${a7}"},
                                        {x: 8, y: ${a8}, indexLabel: "${a8}"},
                                        {x: 9, y: ${a9}, indexLabel: "${a9}"},
                                        {x: 10, y: ${a10}, indexLabel: "${a10}"}//
                                    ]
                                }]
                        });
                        chart.render();

                    }
                </script>
                <div id="chartContainer" style="height: 600px; width: 100%;"></div>
                <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
            </c:if>
        </c:when>
        <c:when test="${number == 5}"> <!-- View Exam -->

            <div id="selectSubject">
                <select class="it1" onchange="submitView()" name="subject">
                    <option value="1">Select subject</option>
                    <c:forEach items="${data}" var="i">
                        <option ${id == i.id ? "selected" : ""} value="${i.id}">${i.name} (${i.id})</option>
                    </c:forEach>
                </select>
            </div>
            <br><br><br>
            <c:if test="${!empty listListQOTT}">
                <c:forEach items="${listListQOTT}" var="lq">
                    <c:set var="count" value="1"></c:set>
                        <div>
                            <h4 style="color: #990099; font-size: 22px;">Student ID: ${lq.stuID}</h4>
                        <h4 style="color: #990099; font-size: 22px;">Student Name: ${lq.stuName}</h4>
                        <h4 style="color: #990099; font-size: 22px;">Subject: ${id}</h4>
                        <h4 style="color: #990099; font-size: 22px;">Category: ${lq.testCategory}</h4>
                        <h4 style="color: #990099; font-size: 22px;">Mark: ${lq.markValue}</h4>
                    </div>

                    <c:forEach items="${lq.examAndAnswer}" var="q">
                        <h4 style="color: #dc3545; font-size: 22px;">${count}. ${q.questionOfTheTest.qContent}</h4><br>
                        <ul>
                            <c:set var="count1" value="1"></c:set>
                            <c:forEach items="${q.answers}" var="a">
                                <li class="
                                    <c:if test="${a == q.questionOfTheTest.yourAContent && a != q.questionOfTheTest.caContent}">red</c:if>
                                    <c:if test="${a == q.questionOfTheTest.caContent}">green</c:if>"
                                        >
                                    ${count1}. ${a}
                                </li>
                                <c:set var="count1" value="${count1+1}"></c:set>
                            </c:forEach>
                        </ul>
                        <c:set var="count" value="${count+1}"></c:set>  
                    </c:forEach>
                    <br>
                    <br><br>
                </c:forEach>
            </c:if>
            <c:if test="${empty listListQOTT && id!=null}">
                <h4 style="color: #dc3545; font-size: 22px;">There is no test for ${id}</h4><br>
            </c:if>

        </c:when>
        <c:when test="${number == 6}">

        </c:when>
    </c:choose>
</form>
<script>
    function submit() {
        document.getElementById("f").submit();
    }
    function search(id, text) {
        //Go to search 
        window.location = "search?subject=" + id + "&txt=" + text;
    }
    function add() {
        window.location = "add";
    }
    function render() {
        document.getElementById("f").action = 'render';
        document.getElementById("f").submit();
    }
    function statistic1() {
        document.getElementById("f").action = 'statistic';
        document.getElementById("mod").value = '1';
        document.getElementById("f").submit();
    }
    function statistic2() {
        document.getElementById("f").action = 'statistic';
        document.getElementById("mod").value = '2';
        document.getElementById("f").submit();
    }
    function submitView() {
        document.getElementById("f").action = 'view';
        document.getElementById("f").submit();
    }

</script>




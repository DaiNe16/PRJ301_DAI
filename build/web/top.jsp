

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<header>
    <div class="header_div">
        <div class="left">
            <a href="center.jsp"><img src="./image/logo-truong-fpt_043152255.png" alt=""></a>
            <div>ADMIN EOS</div>
        </div>
        <div class="center">
            <div>Do Differently To Succeed</div>
            <div>Hello ${sessionScope.account.account}</div>
        </div>
        <div class="right">
            <a href="logout"><button type="button" class="btn btn-danger">LOG OUT</button></a>
        </div>
    </div>
</header>

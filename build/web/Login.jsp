<%-- 
    Document   : Login
    Created on : 10/07/2019, 12:50:24 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="form.css">
        <link rel="stylesheet" type="text/css" href="Default.css" />
    </head>
    <body>
        <!-- start header -->
        <jsp:include page = "nav.jsp"/> 
        <!-- end header -->

        <!-- start content -->
        <section style="background: url(images/bg1.jpg) no-repeat; background-size: cover">
            <div class="login-wrap" style="top: 50px">
                <h2>Đăng Nhập</h2>

                <div class="form">
                    <form action="login" method="POST">
                        <input type="text" placeholder="Tên đăng nhập" name="username" required />
                        <input type="password" placeholder="Mật khẩu" name="password" required  />
                        <button type="submit" value="Login"> Đăng nhập </button>
                        <%
                            if (request.getAttribute("message") != null) {
                        %>

                        <p style="color: red"> <%=request.getAttribute("message")%> </p>

                        <%
                            }
                        %>

                        <a href="signUp"> <p> Chưa có tài khoản? Đăng ký tại đây </p></a>
                       
                    </form>
                </div>
            </div>
            <jsp:include page = "footer.jsp"/>
        </section>

        <!-- end content -->

        <!-- start footer -->

        <!-- end footer -->
    </body>
</html>

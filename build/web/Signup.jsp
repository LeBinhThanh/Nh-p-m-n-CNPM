<%-- 
    Document   : Register
    Created on : 10/07/2019, 1:49:32 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SignUp Page</title>
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
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
                <h2>Tạo Tài Khoản Mới</h2>

                <div class="form"  >
                    <form action="signUp" method="POST">
                        <input name="username" type="text" placeholder="Tên đăng nhập" required/>
                        <input name="password" type="password" placeholder="Mật khẩu mới" required/>
                        <input name="password2" type="password" placeholder="Nhập lại mật khẩu" required/>
                        <input type="text" name="address" placeholder="Địa Chỉ" />
                        <input type="text" name="phone" placeholder="Số điện thoại"/>
                        <input type="text" name="email" placeholder="@gmail.com"/>
                        <button type="submit" value="Sign me up!"> Đăng ký </button>
                        <%
                            if (request.getAttribute("message") != null){
                        %>
                        
                        <p style="color: red"> <%=request.getAttribute("message")%> </p>
                        
                        <%
                            }
                        %>    
                        <a href="Login.jsp"> <p> Đã có tài khoản? Đăng nhập tại đây </p></a>
                    </form>
                </div>
            </div>
                                
        <!-- end content -->
        
        <!-- start footer -->
        <jsp:include page = "footer.jsp"/>
        
        <!-- end footer -->
        </section>
    </body>
</html>

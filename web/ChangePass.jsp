

<%@page import="entity.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="images/favicon.ico">
        <link rel="stylesheet" type="text/css" href="Default.css" />
        <title>Change Password</title>
    </head>
    <body>
        <style>
            table{
                margin:20px auto;
                padding: 0;
            }
            h1{
                font-size:30px;
                color:blue;
            }
            th{
                color: brown;
                background: antiquewhite;
            }
            #fixed{
                position: absolute;
                border: 1px solid yellowgreen;
                border-radius: 0 1.5em 1.5em 0;
            }

            *{
                margin: 0px;
                padding: 0;
                font-family: sans-serif;
            }

            #sidebar {
                margin-top: -20px;
                position:absolute;
                width: 14%;
                background: #151719;
                left: -14%;
                transition: all 500ms linear; 
            }
            #sidebar.active {
                left: 0px;
            }
            #sidebar ul li {
                color: White;
                list-style:none;
                padding: 15px 10px;
                border-bottom: 1px solid rgba(100,100,100,0.3);
            }

            #sidebar li:hover{
                background-color: #ff9999;
            }
            .old{
                text-decoration: line-through;
                color: red;
            }
            #button{
                background: #e74c3c;
                border: none;
                color: white;
                font-size: 18px;
                font-weight: 200;
                cursor: pointer;
                transition: box-shadow .4s ease;
            }
        </style>

        <script>
            function toggleSidebar() {
                document.getElementById("sidebar").classList.toggle('active');
            }
        </script>
        <!-- start header -->
        <jsp:include page = "nav.jsp"/> 
        <!-- end header -->

        <table style="background: url(images/bg1.jpg) no-repeat; background-size: cover">
            <tr>
                <td>
            <center>
                <h1 style="color: blue"> Change Password </h1>
            </center>
            <form action="ChangePass" method="post">
                <%
                    if (request.getAttribute("message") != null) {
                %>
                <center>
                <h3 style="color: red">
                    <%=request.getAttribute("message")%>
                </h3>
                </center>
                <%
                    }
                %>    

                <table>
                    <tr>
                        <td> Enter old password: </td>
                        <td> <input type="text" name="oldPass" required /> </td>
                    </tr>

                    <tr>
                        <td> Enter new password: </td>
                        <td> <input type="text" name="newPass" required /> </td>
                    </tr>

                    <tr>
                        <td> Re-Enter new password: </td>
                        <td> <input type="text" name="newPass2" required /> </td>
                    </tr>

                    <tr>
                        <td></td>
                        <td> <input type="submit" value="Change" id="button"/> </td>
                    </tr>
                </table>
            </form>
        </td>
        <td width="10%" style="padding-top: 10px" >
            <img src="images/img1.png" style="width: 260px;height: 290px"><br>
            <img src="images/img3.jpg" style="width: 260px;height: 290px">
        </td>
    </tr>
</table>
<!-- start footer -->
<jsp:include page = "footer.jsp"/>
<!-- end footer -->
</body>
</html>

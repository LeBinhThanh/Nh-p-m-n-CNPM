

<%@page import="entity.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="images/favicon.ico">
        <link rel="stylesheet" type="text/css" href="Default.css" />
        <title>Profile Account</title>
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
        </style>

        <script>
            function toggleSidebar() {
                document.getElementById("sidebar").classList.toggle('active');
            }
        </script>

        <!-- start header -->
        <jsp:include page = "nav.jsp"/> 
        <!-- end header -->

        <table style="background: url(images/profile.png) no-repeat; background-size: cover">
            <tr>

                <td>
            <center>
                <h1>
                    PERSONAL INFORMATION
                </h1>
                <%
                    Account acc = (Account) session.getAttribute("account");
                    if (acc != null) {
                %>

                <table>
                    <tr>
                        <td>User name: </td>
                        <td> <%=acc.getUsername()%> </td>
                    </tr>
                    <tr>
                        <td>Password: </td>
                        <td> <%=acc.getPassword()%> </td>
                    </tr>
                    <tr>
                        <td>Address: </td>
                        <td> <%=acc.getAddress()%> </td>
                    </tr>
                    <tr>
                        <td>Phone Number: </td>
                        <td> <%=acc.getPhone()%> </td>
                    </tr>
                    <tr>
                        <td>Email: </td>
                        <td> <%=acc.getEmail()%> </td>
                    </tr>
                </table>


                <%
                    }
                %>
            </center>
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

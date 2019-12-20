<%-- 
    Document   : cart.jsp
    Created on : Aug 30, 2019, 9:37:56 AM
    Author     : Windows10-Pro
--%>

<%@page import="entity.InvoiceLine"%>
<%@page import="entity.Invoice"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="form.css">
        <link rel="stylesheet" type="text/css" href="Default.css" />
        <link rel="shortcut icon" href="images/favicon.ico">
        <title>Shopping Page</title>
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
            #buyButton{
                background-color: #4CAF50;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
        </style>

        <!-- start header -->
        <jsp:include page = "nav.jsp"/> 
        <!-- end header -->

        <section style="background: url(images/cart.jpg) no-repeat; background-size: cover">
            <%
                Invoice temp = (Invoice) request.getSession().getAttribute("invoice");
                if (temp != null) {
            %>

            <table>
                <tr>
                    <td>

                        <form action="buy" method="post">

                            <table border="1px" style="text-align: center">
                                <tr>
                                    <th> Name </th>
                                    <th> Image </th>
                                    <th> Price </th>
                                    <th> Quantity </th>
                                    <th></th>
                                </tr>

                                <%
                                    Invoice i = (Invoice) request.getSession().getAttribute("invoice");
                                    for (InvoiceLine line : i.getLines()) {
                                %>
                                <tr>
                                    <td> <%=line.getFlower().getName()%> </td>
                                    <td> <img src="<%=line.getFlower().getImage()%>" style="width: 100px;height: 100px" /> </td>
                                    <td> <%=line.getPrice()%> </td>
                                    <td> <%=line.getQuantity()%> </td>
                                    <td> <%=line.getTotal()%> </td>
                                </tr>
                                <%
                                    }
                                %>

                                <tr>
                                    <td colspan="4" align="center"> Total </td>
                                    <td> <%=i.getTotal()%> </td>
                                </tr>

                                <tr>
                                    <td colspan="4"> </td>
                                    <td> <input type="submit" value="Buy" id="buyButton"/> </td>
                                </tr>
                            </table>
                        </form>


                    </td>
                    <td width="10%" style="padding-top: 10px"  >
                        <img src="images/img1.png" style="width: 260px;height: 290px"><br>
                        <img src="images/img3.jpg" style="width: 260px;height: 290px">
                    </td>
                </tr>
            </table>
            <%
                }
            %>                    
            <%
                if (request.getSession().getAttribute("invoice") == null) {
            %>    
            <h3> You haven't buy anything!!! Click <a href="Home.jsp"> here </a> to continue shopping. </h3>
            <%
                }
            %>
        </section>

        <jsp:include page = "footer.jsp"/>       

    </body>
</html>

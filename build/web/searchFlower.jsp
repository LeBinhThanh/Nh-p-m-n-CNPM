<%-- 
    Document   : searchFlower
    Created on : Jul 15, 2019, 8:49:11 PM
    Author     : hoangdeptraivodich
--%>

<%@page import="model.FlowerDB"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashSet"%>
<%@page import="entity.Flower"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Flower</title>
        <link rel="shortcut icon" href="images/favicon.ico">
        <link rel="stylesheet" type="text/css" href="Default.css" />
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
    </head>
    <body>
        <!-- start header -->
        <jsp:include page = "nav.jsp"/> 
        <!-- end header -->

        <!-- start menu -->
        <section id="menuContaniner">
            <div id="menu">
                <nav class="menu_bg">
                    <div class="navbar" onclick="toggleSidebar()">
                        <img src="images/list.png" id="list"/>
                        <a href="" >DANH MỤC HOA TƯƠI</a>
                    </div>
                </nav>
                <div id="timkiem" >
                    <form name="SearchServlet" action="searchFlower.jsp" method="get">
                        <input id="txtTim" type="text" name="txt" placeholder="Tên sản phẩm"  required>
                        <input type="image" src="images/Search2.png" name="btnTim" id="btnTim" alt="???" >
                    </form>
                </div>
            </div>
        </section>
        <!-- end menu -->

        <!-- start content -->
        <%
            int y = 0;
            int iPage = 0;
            int flowersPerPage = 6;
            FlowerDB fdb = new FlowerDB();
            
            String text = request.getParameter("txt");
            ArrayList<Flower> list = fdb.getFlowersName(text);
            
            int size = list.size();
            try {
                iPage = Integer.parseInt(request.getParameter("page"));
            } catch (NumberFormatException ex) {
                iPage = 0;
            }
            if ((iPage == 0)) {
                iPage = 1;
            }
            y = (iPage - 1) * flowersPerPage;
            int iCounter = 0;
        %>

        <form method="post">
            <table width="100%">
                <tr >
                <div id="sidebar">
                    <ul>
                        <%
                            HashSet<String> hs = fdb.getFlowersType();
                            for (String i : hs) {
                        %>
                        <a href="searchByType.jsp?type=<%=i%>" style="text-decoration: none; color: white"/> 
                        <li> <%=i%> </li>
                        </a>
                        <%
                            }
                        %> 
                    </ul>
                </div>
                <td>
                    <div style="text-align: center; width: 70%; margin: auto">
                        <ul style="display: inline-table;
                            margin: 0;
                            padding:0; white-space: nowrap">

                        <%
                                String code = "";
                                String type = "";
                                String name = "";
                                String image = "";
                                double price,sale;
                                Flower f = new Flower();

                                if (list != null) {
                                    while ((y < size) && (iCounter < flowersPerPage)) {
                                        f = list.get(y);
                                        code = f.getCode();
                                        type = f.getType();
                                        name = f.getName();
                                        image = f.getImage();
                                        price = f.getPrice();
                                        sale = price * 0.9;
                            %>
                            <a href="flowerDetail.jsp?code=<%=code%>" class="content-item">
                                <li>
                                    <p><img src="<%= image%>" style="width: 300px; height: 350px; margin-top: 5px" ></p><br>
                                    <p>Mã Sản Phẩm: <%= code%></p><br>
                                    <p>Tên Sản Phẩm: <%= name%></p><br>
                                    <p>Giá: <span class="old"> <%=price%> VNĐ </span></p><br>
                                    <p>Sale: <%= sale%>VND</p>
                                </li>
                            </a>

                            <%
                                        y++;
                                        iCounter++;
                                        if (iCounter >= flowersPerPage) {
                                            break;
                                        }
                                    }
                                }
                            %>
                        </ul>
                    </div>
                </td>
                </tr>
            </table>
            <center>
                <%
                    String sFileName = "Home.jsp";
                    if (y == 0) {
                        out.println("No Flower");
                    } else {
                        if (iPage == 1) {
                            out.print("<a href=#>Previous</a>");
                        } else {
                            out.print("<a href=" + sFileName + "?page=" + (iPage - 1) + ">Previous</a>");
                        }
                        y = 1;
                        int numPage;
                        if (size % flowersPerPage == 0) {
                            numPage = size / flowersPerPage;
                        } else {
                            numPage = size / flowersPerPage + 1;
                        }
                        while (y < numPage) {
                            out.print("<a href=" + sFileName + "?page=" + y + "> [" + y + "] </a>");
                            y++;
                        }
                        if (iPage == numPage) {
                            out.print("<a href=#>Next</a>");
                        } else {
                            out.print("<a href=" + sFileName + "?page=" + (iPage + 1) + ">Next</a>");
                        }
                    }
                %>    
            </center>            
        </form>
        <!-- end content -->

        <!-- start footer -->
        <jsp:include page = "footer.jsp"/>
        <!-- end footer -->
    </body>
</html>

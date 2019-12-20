

<%@page import="entity.Account"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Flower"%>
<%@page import="model.FlowerDB"%>
<%@page import="entity.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Admin</title>
    </head>
    <body style="background-color: #ffcc99">

        <%
            if (request.getSession().getAttribute("account") == null) {
                response.sendRedirect("Login.jsp");
            } else {
        %>    


        <%
            Account acc = (Account) request.getSession().getAttribute("account");
        %>
        <h1> Hello :  <%=acc.getUsername()%> </h1>
        <a href="home"/> Back to Home Page </a>
        
    <center>
        <p> <a href="addFlower.jsp">Add new Flower </a> </p>
    
        <h2> The List of Flowers </h2>
        <table border="1px" >
            <tr>
                <th> Code</th>
                <th> Name </th>
                <th> Image </th>
                <th> Price </th>
                <th> </th>
                <th> </th>
            </tr>

            <%
                FlowerDB fdb = new FlowerDB();
                ArrayList<Flower> list = fdb.getAllFlowers();
                Flower f = new Flower();
                String code = "";
                String name = "";
                String image = "";
                double price;
                int i = 0;
                if (list != null) {
                    while (i < list.size()) {
                        f = list.get(i);
                        code = f.getCode();
                        name = f.getName();
                        image = f.getImage();
                        price = f.getPrice();
            %>

            <tr>
                <td> <%=code%> </td>
                <td> <%=name%> </td>
                <td> <img src="<%=image%>" /> </td>
                <td> <%=price%> </td>
                <td> <a href="deleteFlowerServlet?code=<%=code%>"> Remove </a> </td>
                <td> <a href="updateFlower.jsp?code=<%=code%>"> Update </a> </td>
            </tr>

            <%
                        i++;
                    }
                }
            %>


        </table>
    </center>
    <%
        }
    %>    
</body>
</html>

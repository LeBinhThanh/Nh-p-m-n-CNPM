<%-- 
    Document   : updateFlower
    Created on : Jul 22, 2019, 10:03:28 PM
    Author     : hoangdeptraivodich
--%>

<%@page import="entity.Flower"%>
<%@page import="model.FlowerDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Flower</title>
    </head>
    <body style="background-color: #ffcc99" >
        
        <%
            String code = request.getParameter("code");
            FlowerDB fdb = new FlowerDB();
            Flower f = fdb.getFlowersByCode(code);
            String type = f.getType();
            String name = f.getName();
            String image = f.getImage();
            double price = f.getPrice();
            double sale = 0.9 * price;
        %>    
        <center>
            <h1>Update Information of Flower</h1>
            <form action="updateFlowerServlet" method="post">
            <table border="1px">
                <tr>
                    <td>Code</td>
                    <td> <input type="text" name="code" required value="<%=code%>" readonly /> </td>
                </tr>
                <tr>
                    <td>Type</td>
                    <td> <input type="text" name="type" required value="<%=type%>" /> </td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td> <input type="text" name="name" required value="<%=name%>" /> </td>
                </tr>
                <tr>
                    <td>Image</td>
                    <td> 
                        <img src="<%=image%>" /> 
                        <input type="hidden" value="<%=image%>" name="image"/>
                    </td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td> <input type="text" name="price" required value="<%=price%>" /> </td>
                </tr>
                <tr>
                    <td> <input type="submit" value="Update"/> </td>
                    <td> </td>
                </tr>
                
            </table>
        </form>    
        </center>
    </body>
</html>

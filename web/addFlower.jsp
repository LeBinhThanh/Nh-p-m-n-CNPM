
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Flower</title>
    </head>
    <body style="background-color: #ffcc99">
    <center>
        <h1>Add new Flower</h1>
        <p> <a href="HomeAdmin.jsp"> Back to Home Page </a> </p>
        <form action="addFlowerServlet" method="post">
            <table border="1px">
                <tr>
                    <td>Code</td>
                    <td> <input type="text" name="code" required/> </td>
                </tr>
                <tr>
                    <td>Type</td>
                    <td> <input type="text" name="type" required/> </td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td> <input type="text" name="name" required/> </td>
                </tr>
                <tr>
                    <td>Image</td>
                    <td> <input type="file" name="image" required/> </td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td> <input type="number" name="price" required/> </td>
                </tr>
                <tr>
                    <td> <input type="submit" value="Add"/> </td>
                    <td> </td>
                </tr>
                
            </table>
            <%
                if (request.getAttribute("message") != null){
            %>
            
            <h3 style="color: red">
                <%=request.getAttribute("message")%>
            </h3>
            <%
                }
            %>
            
        </form>
    </center>
    </body>
</html>

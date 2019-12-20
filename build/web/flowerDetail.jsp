<%-- 
    Document   : flowerDetail
    Created on : Jul 10, 2019, 10:03:13 PM
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
        <title>Flower Detail</title>
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
            ul{
                list-style: none;
            }
            ul li{
                padding-left: 20px;
            }
            
            #buyButton{
                background-color: #4CAF50;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            #buyButton1{
                background-color: #ffff66;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
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
                    <form name="SearchServlet" action="" method="post">
                        <input id="txtTim" type="text" name="txt" placeholder="Tên sản phẩm"  required>
                        <input type="image" src="images/Search2.png" name="btnTim" id="btnTim" onclick="search()">
                    </form>
                </div>
            </div>
        </section>
        <!-- end menu -->

        <%
            FlowerDB fdb = new FlowerDB();
            String code = request.getParameter("code");
            Flower f = fdb.getFlowersByCode(code);
            String content = fdb.getContent(code);
            
            String type = f.getType();
            String name = f.getName();
            String image = f.getImage();
            double price = f.getPrice();
            double sale = 0.9 * price;
        %>
        <table width="100%">
            <tr>
                <td width="20%">
                    <table border="1px" style="border-collapse:collapse;text-align: center;float: right;margin-right: 50px;" >
                        <tr>
                            <td>
                                <p><img src="<%= image%>" style="width: 300px; height: 350px; margin-top: 5px" ></p><br>
                                <p>Mã Sản Phẩm: <%= code%></p><br>
                                <p>Tên Sản Phẩm: <%= name%></p><br>
                                <p>Giá: <span class="old"> <%=price%> VNĐ </span></p><br>
                                <p>Sale: <%= sale%>VND </p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <form action="cart" method="post" style="text-align: center">
                                    <input type="number" name="quantity" value="1"/>
                                    <input type="hidden" value="<%=code%>" name="code"/>
                                    <input type="hidden" value="<%=sale%>" name="price"/>
                                    <input type="submit" value="Buy" id="buyButton"/>
                                </form>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <form action="comment">
                                    Bình luận về sản phẩm này: <br>
                                    <input type="text" name="content"/>
                                    <input type="hidden" value="<%=code%>" name="code"/>
                                    <input type="submit" value="Thêm" id="buyButton1" />
                                </form>
                            </td>
                        </tr>
                    </table>
                            
                </td>
                
                <td width="20%">
                    <table style="">
                        <tr> <th> Thông tin sản phẩm </th> </tr>
                        <tr> <td> - <%=content%>  </td> </tr>
                        <tr> <td>*** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** </td> </tr>
                        <tr>
                            <td>
                                <div style="background-color: #c21e1f;-webkit-border-radius: 10px;padding: 10px 20px"> 
                                    <h3 style="color: #fdcd01"> KHUYẾN MÃI*** </h3>
                                    <p style="color: white"> Tặng thiệp hoặc banner chúc mừng. </p>
                                </div> 
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div style="background-color: #e7ffe2; border-color: #b1dab3;border: 1px solid;-webkit-border-radius: 10px;color: #189001;padding: 10px 20px" >
                                    <h4> Lưu ý: Sản phẩm chỉ có ở Hồ Chí Minh và Hà Nội</h4>
                                    <p> Sản phẩm bạn đang chọn là sản phẩm được thiết kế đặc biệt! </p>
                                    <p> Hiện nay, Hoayeuthuong.com chỉ thử nghiệm cung cấp cho thị trường Tp. Hồ Chí Minh và Tp. Hà Nội</p>
                                    <p> Miễn phí giao hoa khu vực Tp. Hồ Chí Minh tại: Q.1, Q.3, Q.4, Q.5, Q.6, Q.7, Q.8, Q.10, Q.11,
                                        Q. Tân Bình, Q. Bình Thạnh, Q. Phú Nhuận, Q. Tân Phú, Q. Gò Vấp.
                                        Các quận khác vui lòng liên hệ để biết thêm chi tiết (Giá giao sẽ từ 30.000đ-70.000đ). 
                                    </p>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div style="padding-left: 50px;padding: 10px 0px;background-color: #fffcd9;border: 1px solid #d8d297;-webkit-border-radius: 10px;color: #f26922">
                                    <ul style="">
                                        <li> 1. Tặng banner, thiệp (trị giá 20.000đ) miễn phí </li>
                                        <li> 2. Giảm ngay 20.000đ khi Bạn tạo đơn hàng online </li>
                                        <li> 3. Giảm tiếp 3% cho đơn hàng Bạn tạo ONLINE lần thứ 2,
                                            5% cho đơn hàng Bạn tạo ONLINE lần thứ 6 và 10% cho đơn hàng Bạn tạo ONLINE lần thứ 12 (Chỉ áp dụng tại Tp. HCM) </li>
                                        <li>4. Giao miễn phí trong nội thành 63/63 tỉnh </li>
                                        <li> 5. Giao gấp trong vòng 2 giờ </li>
                                        <li> 6. Cam kết 100% hoàn lại tiền nếu Bạn không hài lòng </li>
                                        <li> 7. Cam kết hoa tươi trên 3 ngày </li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-left: 50px;padding: 10px 20px;background-color:#8C0209 ;-webkit-border-radius: 10px;border: 1px solid #d8d297;color: white">
                                Bình luận của khách hàng: <br>
                                <%
                                    ArrayList<String> comments = fdb.getComment(code);
                                    for (String s : comments){
                                %>
                                <p> - <%=s%> </p> <br>
                                <%
                                    }
                                %>    
                            </td>
                        </tr>
                        
                    </table>
                </td>
                
                <td width="10%" style="padding-top: 10px">
                    <img src="images/img1.png" style="width: 260px;height: 290px"><br>
                    <img src="images/img3.jpg" style="width: 260px;height: 290px">
                </td>
            </tr>
        </table>        

        <!-- end content -->

        <!-- start footer -->
        <jsp:include page = "footer.jsp"/>
        <!-- end footer -->
    </body>
</html>

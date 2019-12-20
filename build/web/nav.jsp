<%@page import="entity.Invoice"%>
<%@page import="entity.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<div class="topnav">
    <a class="active" href="home"><i class="fa fa-fw fa-home"></i>Trang Chủ</a>
    <a href="https://hoaonline247.com/blog/cac-chuong-trinh-khuyen-mai-cua-hoa-online-247.html5bec054a819a4e965f8b457c">Chương trình khuyến mại</a>
    <a href="http://kenh14.vn/loai-hoa-vi-dieu-nhu-chua-ca-dai-thien-ha-lung-linh-o-trong-do-20170615003615569.chn">Tin tức</a>
    <a href="#instruction">Hướng dẫn mua hàng online</a>
    <div id="login">
        <form name="Find" action="" method="post" id="mycss">
            <%
                if (session.getAttribute("account") == null){
            %>    
            <a href="login"><i class="fa fa-fw fa-user"></i> Đăng Nhập</a>
            <a href="signUp"><i class="fas fa-fw fa-user-plus"></i> Đăng Ký</a>
            <%
                }else{
                    int size = 0;
                    Account acc = (Account)session.getAttribute("account");
                    if (request.getSession().getAttribute("invoice") != null){
                        Invoice invoice = (Invoice) request.getSession().getAttribute("invoice");
                        size = invoice.getLines().size();
                    }       
            %>
            <a href="cart"> <img src="images/shopping.jpg" style="width: 20px;height: 20px"/>: <%=size%> </a>
            <a href="Profile.jsp">Profile</a>
            <a href="ChangePass.jsp">Change Password</a>
            <a href="logout">Logout</a>
            <%
                }
            %>    
        </form>
    </div> 
</div>

<!-- start header -->
<header>
    <a href="home"><img src="images/banner.jpg"/></a>
    <div id="logo">
        <p style="font-size: 100px"><span class="title">Flower</span> Shop</p>
        <p style="font-size: 30px">Hoa chất lượng cao </p>
    </div>
    <table id="table">
        <tr>
            <td id="hover">
                <a href="#">
                    <img src="images/medal.png" id="icon"/>
                    <div id="info">
                        <p>Giá bán rẻ</br>nhất Việt Nam</p>
                    </div>
                </a>
            </td>
            <td id="hover">
                <a href="#">
                    <img src="images/truck.png" id="icon"/>
                    <div id="info">
                        <p>Giao hàng<br>toàn quốc</p>
                    </div>
                </a>
            </td>
            <td id="hover">
                <a href="#">
                    <img src="images/card.png" id="icon"/>
                    <div id="info">
                        <p>Thanh toán<br>tiện lợi</p>
                    </div>
                </a>
            </td>
            <td id="hover">
                <a href="#">
                    <img src="images/support.png" id="icon"/>
                    <div id="info">
                        <p>Chính sách hỗ<br>trợ linh hoạt</p>
                    </div>
                </a>
            </td>
        </tr>  
    </table>
</header>
<!-- end header --> 


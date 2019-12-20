<%-- 
    Document   : finish
    Created on : Aug 30, 2019, 8:19:07 PM
    Author     : Windows10-Pro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thông tin thanh toán</title>
    </head>
    <body>
        <style>
            #button{
                background-color: #4CAF50;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
        </style>
        
        <script>
            function send1(){
                window.location.assign("cart");
            }
            function send2(){
                window.location.assign("home");
            }
        </script>
    <center>
        <p> <img src="images/tick.jpg" style="width: 100px;height: 100px" /> </p>
        <h3> ĐƠN HÀNG CỦA BẠN ĐÃ ĐƯỢC TIẾP NHẬN</h3>
        <p> Nhân viên của chúng tôi sẽ liên hệ thông báo giao hàng với bạn. </p>
        
        <p>Lưu ý: Nếu bạn đã từng mua ít nhất 1 lần tại FreshCut, bạn đã trở thành khách hàng quen<br>
            thuộc, ở lần đặt hàng tiếp theo bạn sẽ được giảm 10% phí ship toàn quốc. Bạn cần đem theo thẻ của FreshCut<br>
            đến nơi cung cấp sản phẩm/dịch vụ để nhận được dịch vụ giảm giá.
        </p>
        <h3> Cảm ơn bạn đã tin tưởng shop của chúng tôi! </h3>
        
        <table>
            <tr>
                <td> <input type="button" value="Xem lại chi tiết đơn hàng" onclick="send1()" id="button" />  </td>
            </tr>
            <tr>
                <td> <input type="button" value="Quay lại trang chủ" onclick="send2()" id="button" />  </td>
            </tr>
        </table>
        
    </center>
    </body>
</html>

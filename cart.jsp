<!-- �����R�[�hwindows-31j�ɂ��HTML���� -->
<%@page contentType="text/html" pageEncoding="windows-31j" %>
<%@page import="order.nishi.models.ProductEntity" %>
<%@page import="order.nishi.models.CartEntity" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-31j"/>
    <title>�󒍓o�^ - ���i�I��</title>
</head>
<body>
<h2>�󒍏��i�I��</h2>
<form action="./register" method="POST">
    <label for="pcode" class="sr-only"></label>
    <input type="text" name="code" class="form-control" id="pcode" placeholder="���i�R�[�h">
    <label for="quant" class="sr-only"></label>
    <input type="text" name="quantity" class="form-control" id="quant" placeholder="����">
    <button type="submit" class="btn btn-outline-primary">���i�I��</button><br>
</form>

<button type="button" value="link" onClick="location.href='./confirm'">
���i�I���m��
</button><br>

<button type="button" value="link" onClick="location.href='./reset'">
���Z�b�g
</button><br><br>
<button type="button" value="link" onClick="location.href='SearchView1.html'">
 �߂�
</button><br>

<table border="1">
    <caption>�󒍏��i�ꗗ</caption>
    <thead>
    <tr>
        <th>���i�R�[�h</th>
        <th>���i��</th>
        <th>�P��</th>
        <th>����</th>
        <th>�ō����z</th>
    </tr>
    </thead>
        <%
        CartEntity cart = (CartEntity) request.getAttribute("cart");
        if (cart != null) {
            for (int i = 0; i < cart.getArrayTotal(); i++) {
                out.println("<tr>");
                out.println("<td>" + cart.getCode(i) + "</td>");
                out.println("<td>" + cart.getName(i) + "</td>");
                out.println("<td>" + cart.getPrice(i) + "</td>");
                out.println("<td>" + cart.getCount(i) + "</td>");
                out.println("<td>" + cart.getSubTotal(i) + "</td>");
                out.println("</tr>");
            }
            out.println("</table>");

            cart.calcPrice();
            out.println("<p>���v���z: "+cart.price+"�~");
            out.println("����Ŋz: "+cart.tax+"�~");
            out.println("�������z: "+cart.bill+ "�~</p>");
        }
    %>
</table>


    <hr/>

    <table border="1">
        <caption>���i�ꗗ</caption>
        <thead>
        <tr>
            <th>���i�R�[�h</th>
            <th>���i��</th>
            <th>�P��</th>
        </tr>
        </thead>
        <%
            ProductEntity products = (ProductEntity) request.getAttribute("products");
            for (int i = 0; i < products.getArrayTotal(); i++) {
                out.println("<tr>");
                out.println("<td>" + products.getCode(i) + "</td>");
                out.println("<td>" + products.getName(i) + "</td>");
                out.println("<td>" + products.getPrice(i) + "</td>");
                out.println("</tr>");
            }
        %>
    </table>
</body>

</html>
<!-- ΆR[hwindows-31jΙζιHTMLΆ -->
<%@page contentType="text/html" pageEncoding="windows-31j" %>
<%@page import="order.nishi.models.ProductEntity" %>
<%@page import="order.nishi.models.CartEntity" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-31j"/>
    <title>σo^ - €iIπ</title>
</head>
<body>
<h2>σ€iIπ</h2>
<form action="./register" method="POST">
    <label for="pcode" class="sr-only"></label>
    <input type="text" name="code" class="form-control" id="pcode" placeholder="€iR[h">
    <label for="quant" class="sr-only"></label>
    <input type="text" name="quantity" class="form-control" id="quant" placeholder="Κ">
    <button type="submit" class="btn btn-outline-primary">€iIπ</button><br>
</form>

<button type="button" value="link" onClick="location.href='./confirm'">
€iIπmθ
</button><br>

<button type="button" value="link" onClick="location.href='./reset'">
Zbg
</button><br><br>
<button type="button" value="link" onClick="location.href='SearchView1.html'">
 ίι
</button><br>

<table border="1">
    <caption>σ€iκ</caption>
    <thead>
    <tr>
        <th>€iR[h</th>
        <th>€iΌ</th>
        <th>PΏ</th>
        <th>Κ</th>
        <th>Εΰz</th>
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
            out.println("<p>vΰz: "+cart.price+"~");
            out.println("ΑοΕz: "+cart.tax+"~");
            out.println("Ώΰz: "+cart.bill+ "~</p>");
        }
    %>
</table>


    <hr/>

    <table border="1">
        <caption>€iκ</caption>
        <thead>
        <tr>
            <th>€iR[h</th>
            <th>€iΌ</th>
            <th>PΏ</th>
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
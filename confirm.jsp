<%@ page import="order.nishi.models.CustomerEntity" %>
<%@ page import="order.nishi.models.SalesEntity" %>
<%@ page import="order.nishi.models.CartEntity" %>
<!-- ถR[hwindows-31jษๆ้HTMLถ -->
<%@page contentType="text/html" pageEncoding="windows-31j" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-31j"/>
    <title>๓o^ - ๓mF</title>
</head>
<body>
<h2>๓o^</h2>
<%
    if (request.getAttribute("error_msg") != null) {
        out.print(request.getAttribute("error_msg"));
    }
%>
<form action="./confirm" method="POST">
    <label>๓N๚</label>
    <select name="year" id="year">
        <option value="<% out.print(request.getAttribute("year")); %>">
            <% out.print(request.getAttribute("year")); %>
        </option>
    </select>
    <label for="year">N</label>
    <select name="month" id="month">
        <%
            for (int month = 1; month <= 12; month++) {
                out.print("<option value=\"" + month + "\">" + (month) + "</option>");
            }
        %>
    </select>
    <label for="month"></label>
    <select name="day" id="day">
        <%
            for (int day = 1; day <= 31; day++) {
                out.print("<option value=\"" + day + "\">" + day + "</option>");
            }
        %>
    </select>
    <label for="day">๚</label>

    <label for="customer">ฺqผ</label>
    <select name="customer_c" id="customer">
        <%
            CustomerEntity customer = (CustomerEntity) request.getAttribute("customers");
            for (int i=0; i<customer.getArrayTotal(); i++) {
                out.print("<option value=\"" + customer.getCustomC(i) + "\">" + customer.getCustomNam(i) + " (" + customer.getCustomC(i) + ")</option>");
            }
        %>
    </select>

    <label for="sales">Sา</label>
    <select name="sales_c" id="sales">
        <%
            SalesEntity sales = (SalesEntity) request.getAttribute("sales");
            for (int i=0; i<sales.getArrayTotal(); i++) {
                out.print("<option value=\"" + sales.getSalesC(i) + "\">" + sales.getSalesNam(i) + " (" + sales.getSalesC(i) + ")</option>");
            }
        %>
    </select>

    <button type="submit" class="btn btn-outline-primary">o^</button>
</form>

<table border="1">
    <caption>๓คi๊</caption>
    <thead>
    <tr>
        <th>คiR[h</th>
        <th>คiผ</th>
        <th>Pฟ</th>
        <th>ส</th>
        <th>ลเz</th>
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
            out.println("<p>vเz: "+cart.price+"~");
            out.println("ม๏ลz: "+cart.tax+"~");
            out.println("ฟเz: "+cart.bill+ "~</p>");
        }
    %>
</table>

<p><a href="./register">฿้</a></p>

</body>
</html>

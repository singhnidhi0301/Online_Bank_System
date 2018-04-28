 <%
String loginname=request.getParameter("loginid");
%>
<html>
<body>
Welcome:<%=loginname%>
<form action="menu"method="post">
<br><br><br>
<table align="center">
<tr>
<td align="center">
<tr>
<td align="center">
<input type="submit" value="Create Account" name="createaccount">
</td>
</tr>
<tr><td align="center">
<input type="submit" value="Deposit Amount" name="deposite_amount">
</td></tr>
<tr><td align="center">
<input type="submit" value="Withdraw Amount" name ="withdrawamount">
</td></tr>
<tr>
<td align="center">
<input type="submit" value="Mini statement" name="ministatement">
</td>
</tr>
<tr>
<td align="center">
<input type="submit" value="Member list" name="memberlist">
</td>
</tr>
</table>
</form></body></html>
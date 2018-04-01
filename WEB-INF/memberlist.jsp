<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%
	String user=request.getParameter("username");
%>
<html>
<body>
<table width="100%"><tr><td align="left">
Welcome <%=user%>
</td>
</tr></table>
<br><br>
<table border="1" align="center" cellpadding="4" cellspacing="4">
<tr align="center" valign="top">
<td></td>
<td>Account No.</td>
<td>Name</td>
<td>Gender</td>
<td>date</td>
<td>PhoneNo.</td>
<td>Address</td>
<td>Qualification</td>
<td>Balance</td>
<td>Status</td>
</tr>
<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","root");
	Statement st=con.createStatement();
	ResultSet rt=st.executeQuery("select accno,name,gender,date,phoneno,address,qualification,balance,status from account_holder");
	while(rt.next())
	{
		String temp_active="Active";
		if(rt.getInt("status")==0)
		temp_active="Deleted";
		%>
			<tr>
			<td><input type="checkbox"></td>
			<td><%=rt.getString("accno")%></td>
			<td><%=rt.getString("name")%></td>
			<td><%=rt.getString("gender")%></td>
			<td><%=rt.getString("date")%></td>
			<td><%=rt.getString("phoneno")%></td>
			<td><%=rt.getString("address")%></td>
			<td><%=rt.getString("qualification")%></td>
			<td><%=rt.getString("balance")%></td>
			<td><%=temp_active%></td>
			</tr>
		<%
	}
	rt.close();
	st.close();
	con.close();
}
catch(Exception e)
{
	out.print(e);
}
%>
</table></body></html>
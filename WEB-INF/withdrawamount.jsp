<%@page import="java.util.*"%>
<%
	Calendar cal=new GregorianCalendar();
	int day=cal.get(Calendar.DATE);
	int month=cal.get(Calendar.MONTH)+1;
	int year=cal.get(Calendar.YEAR);
	String date=day+"-"+month+"-"+year;
	String user=request.getParameter("username");
%>
<html>
<script>
var xmlhttp=null;
function search_accno()
{
	try
	{
		var accno=document.getElementById("accountno_to_search").value;
		if(accno.length==0)
		return false;
		var url="withdrawamount?accountno_to_search="+accno;
		xmlhttp=new XMLHttpRequest();
		xmlhttp.onreadystatechange=handleServerResponse;
		xmlhttp.open("GET",url,true);
		xmlhttp.send();
	}
	catch(e)
	{
		alert(e);
		return false;
	}
}
function handleServerResponse()
{
	try
	{
		if(xmlhttp.readyState==4)
		{
			if(xmlhttp.status==200)
			{
				alert(xmlhttp.responseText);
				document.getElementById("account_name").value="";
				document.getElementById("account_type").value="";
				document.getElementById("balance").value="";
				document.getElementById("accno").value="";
				
				var xx,j=0;
				var temp;
				var x=xmlhttp.responseXML.documentElement.getElementsByTagName("member");
				for(var i=0;i<x.length;i++)
				{
					xx=x[i].getElementsByTagName("name");
					var name=xx[0].firstChild.nodeValue;
					xx=x[i].getElementsByTagName("type");
					var type=xx[0].firstChild.nodeValue;
					xx=x[i].getElementsByTagName("balance");
					var balance=xx[0].firstChild.nodeValue;
					xx=x[i].getElementsByTagName("accno");
					var vaccno=xx[0].firstChild.nodeValue;
					
					document.getElementById("account_name").value=name;
					document.getElementById("account_type").value=type;
					document.getElementById("balance").value=balance;
					document.getElementById("accno").value=vaccno;
				}
				/*for(var i=0;i<x.length;i++)*/
				xmlhttp=null;
			}
		}
	}
	catch(e)
	{
	    console.log(e);
		alert(e);
	}
}
</script>
<body>
<table width="100%"><tr><td align="left">
Welcome <%=user%>
</td>
<td align="right"> Date <%=date%></td>
</tr></table>
<div align="center">withdraw amount</div>
<table align="center">
<tr><td>Enter Account No.</td>
<td>
<input type="text" onKeyUp="search_accno()" name="accountno_to_search" id="accountno_to_search">
</td></tr></table>
<br>
<br>
<br>
<table align="center">
<tr><td> Account Name</td>
<td>:<input type="text" value="" readonly"true" name="account_name" id="account_name">
</td></tr>
<tr><td>Account type</td>
<td>:
<input type="text" value="" readonly="true" name="account_type" id="account_type">
</td></tr>
<tr><td> Balance </td>
<td>:<input type="text" value="" readonly="true" name="balance" id="balance">
</td></tr>
<tr><td> Account No.</td>
<td>:<input type="text" value="" readonly="true" name="accno" id="accno">
</td></tr>
</table>
<br><br>
<table border="0" align="center" cellpadding="4" cellspacing="4">
<tr>
<td align="left" valign="top">Enter withdraw Amount</td>
<td align="left"  valign="top">:
<input type="text" value="" name="new_withdraw_amount" id="new_withdraw_amount" maxlength="5">
</td>
</tr>
<tr>
<td align="left" valign="top">Remark</td>
<td align="left"  valign="top">:
<textarea id="remark" name="remark" rows="3" cols="25"></textarea></td>
</tr>
<tr>
<td align="left" valign="top">
<input type="button" value="proceed" onClick="withdraw_amount()"></td>
</tr>
</table>
<script type="text/javascript">
function withdraw_amount()
{
	try
	{
		var accno=document.getElementById("accno").value;
		if(Number(accno)==0)
		{
			alert("Please search Account No.");
			document.getElementById("accountno_to_search").focus();
			return false;
		}
		var new_withdraw_amount=document.getElementById("new_withdraw_amount").value;
		if(isNaN(new_withdraw_amount))
		
		{
			alert("Numeric Required");
			document.getElementById("new_withdraw_amount").focus();
			return false;
		}
		new_withdraw_amount=Math.round(new_withdraw_amount);
		document.getElementById("new_withdraw_amount").value=new_withdraw_amount;
		if(Number(new_withdraw_amount)<=0)
		{
			alert("Greater Number Required");
			document.getElementById("new_withdraw_amount").focus();
			return false;
		}
		var con=confirm("Are you sure you want to continue")
		if(con==false)
		return false;
		var url="withdrawamount?accno="+accno;
		url=url+"&new_withdraw_amount="+new_withdraw_amount;
		url=url+"&remark="+document.getElementById("remark").value;
		xmlhttp=new XMLHttpRequest();
		xmlhttp.onreadystatechange=handleServerResponse_withdraw;
		xmlhttp.open("POST",url,true);
		xmlhttp.send();
		}
		catch(e)
		{
			alert(e);
			return false;
		}
	}
function handleServerResponse_withdraw()
{
	try
	{
		if(xmlhttp.readyState==4)
		{
			if(xmlhttp.status==200)
			{
				alert(xmlhttp.responseText);
				document.getElementById("account_name").value="";		
				document.getElementById("account_type").value="";	
				document.getElementById("balance").value="";	
				document.getElementById("accno").value="";	
				document.getElementById("new_withdraw_amount").value="";
				document.getElementById("remark").value="";
				document.getElementById("accountno_to_search").value="";
				xmlhttp=null;
				}
			}
		}
		catch(e)
		{
			alert(e);
		}
	}			
</script></body></html>
<html>
<head>
<script type="text/javascript">
function onsubmitt()
{
	try
	{</head>
<body>
<form method=post action=createaccount onsubmit="return onsubmitt()">
<table>
<tr><td>Name</td>
<td>
<input type ="text" name="name"
id="name" value=""
maxlength="35">
</td></tr>
<tr>
<td> phone No</td>
<td><input type="text" name="phoneno"
id="phoneno" maxLength="12">
</td></tr>
<tr>
<td>accounttype</td>
<td><input type="radio" name="acctype" id="saving_acctype" value="1" checked>saving
<input type="radio" name="acctype" id="current_acctype" value="2">current
</td></tr>
<tr><td>balance</td>
<td>
<input type="text" name="balance" id="balance" maxLength="7">
</td></tr>
<tr>
<td>Gender</td>
<td>
<select name=gender id=gender>
<option value="M">Male
</option>
<option value="F">Female
</option>
<option value="o">Transgender
</option>
</select></td></tr>
<tr>
<td>Qulification</td>
<td>
<input type="checkbox" id="qual_bba" name="qual_bba" value="1">BBA
<input type="checkbox" id="qual_mba" name="qual_mba" value="2">MBA
<input type="checkbox" id="qual_btech" name="qual_btech" value="3">BTECH
</td></tr>
<tr><td>Address</td>
<td>
<textarea rows="4" cols="25"
name="address" id="address"></textarea>
</td></tr>
<tr><td>Date</td>
<td>
<input type="text" name="date" id="date" maxLength="10">
</td></tr>
<tr>
<td><input type="submit" value="submit">
</td></tr>
</table>
</form>
</body>
</html>
		var name=document.getElementById("name").value;
		var phoneno=document.getElementById("phoneno").value;
		var saving_acctype=document.getElementById("saving_acctype").value;
		var current_acctype=document.getElementById("current_acctype").value;
		var balance=document.getElementById("balance").value;
		var gender=document.getElementById("gender").value;
		var qual_bba=document.getElementById("qual_bba").value;
		var qual_mba=document.getElementById("qual_mba").value;
		var qual_btech=document.getElementById("qual_btech").value;
		var address=document.getElementById("address").value;
		var date=document.getElementById("date").value;
		if(name.length<3)
		{
		alert("proper name required");
		document.getElementById("name").focus();
		return false;
		}
			for(var loop=0;loop<name.length;loop++)
			{
				var ch=name.charAt(loop);
				if((ch>='a'&&ch<='z')||(ch>='A'&&ch<='Z')||(ch==' ')||(ch=='.'))
				{
				}
				else
				{
					alert("Invalid name");
					document.getElementById("name").focus();
					return false;
				}
			}
			if(phoneno.length<10||phoneno.length>10)
			{
				alert("number should be in 10");
				document.getElementById("phonemo").focus();
				return false;
			}
			for(var loop=0;loop<phoneno.length;loop++)
			{
				var ch=phoneno.charAt(loop);
				if((ch>='a'&&ch<='z')||(ch>='A'&&ch<='Z')||(ch==' ')||(ch=='.'))
				{
					alert("Invalid nnumber");
					document.getElementById("phoneno").focus();
					return false;
				}
				else
				{
				}
			}
			if(saving_acctype!='1'&&current_acctype!='2')
			{
				alert("please select account type");
					return false;
			}
			if(balance.length<=0)
			{
				alert("please enter amount");
				document.getElementById("balance").focus();
				return false;
			}
			for(var loop=0;loop<balance.length;loop++)
			{
				var ch=balance.charAt(loop);
				if((ch>='a'&&ch<='z')||(ch>='A'&&ch<='Z')||(ch==' ')||(ch<'0'))
				{
					alert("Invalid amount");
					document.getElementById("balance").focus();
					return false;
				}
				else
				{
				}
			}
			/*
			if(qual_bba!='1'&&qual_mba!='2'&&qual_btech!='3')
			{
				alert("please select any qualification");
					return false;
			}*/
			if(address.length<5)
			{
				alert("please enter sufficent address");
				document.getElementById("address").focus();
				return false;
			}
			if(date.length<8)
			{
				alert("please enter correct date");
				document.getElementById("date").focus();
				return false;
			}
			var c=confirm(" Are you sure you want to conitnue");
		if(c==false)
		return false;
		else
		return true;
		}	
		catch(e)
	{
		alert(e);
		console.log(e);
		return false;
	}
	}
</script>

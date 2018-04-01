import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class withdrawamount extends HttpServlet
{
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{
	try
	{
	 	StringBuffer datatosend=new StringBuffer(1024);
	 	datatosend.append("<?xml version=\"1.0\"?>");
	 	datatosend.append("<data>");
	 	String accountno_to_search=request.getParameter("accountno_to_search");
	 	System.out.println(accountno_to_search);
	 	Connection con=null;
	 	Statement st=null;
	 	ResultSet rt=null;
	 	
	 	
	 	Class.forName("com.mysql.jdbc.Driver");
	 	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","root");
	 	st=con.createStatement();
	 	
	 	
	 	rt=st.executeQuery("select name,account_type,balance,accno from account_holder where accno="+accountno_to_search);
	 	while(rt.next())
	 	{
	 		datatosend.append("<member>");
	 		
	 		datatosend.append("<name>").append(rt.getString("name")).append("</name>");
	 		datatosend.append("<type>").append(rt.getString("account_type")).append("</type>");
	 		datatosend.append("<balance>").append(rt.getString("balance")).append("</balance>");
	 		datatosend.append("<accno>").append(rt.getString("accno")).append("</accno>");
	 		datatosend.append("</member>");
	 	}
	 	
	 	
	 	rt.close();
	 	st.close();
	 	con.close();
	 	datatosend.append("</data>");
	 	
	 	response.setContentType("text/xml");
	 	response.setHeader("Cache-Control","no-cache");
	 	response.setHeader("pragma","no-cache");
	 	response.setDateHeader("Expires",0);
	 	
	 	response.getWriter().write(datatosend.toString());
	 	response.getWriter().flush();
	    
	    datatosend=null;
	    
	    }
	    catch(Exception e)
	    {
	    	System.out.println(e);
	    }
}



public void doPost(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException	 
{
	try
	{
		String html_accno=request.getParameter("accno");
		String html_remark=request.getParameter("remark");
		String html_withdraw_amount=request.getParameter("new_withdraw_amount");
		
		Connection con=null;
		Statement st=null;
		ResultSet rt=null;
		   	
	 	Class.forName("com.mysql.jdbc.Driver");
	 	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","root");
	 	st=con.createStatement();
	 	
	 	
	 	StringBuffer query=new StringBuffer();
	 	query.append("update account_holder set balance=balance-").append(html_withdraw_amount);
	 	query.append(" where accno=").append(html_accno);
	 	
	 	st.executeUpdate(query.toString());
	 	
	 	query.delete(0,query.length());
	 	query.append("insert into transcation (accno,date,time,withdraw,deposite,remark)");
	 	query.append("values (").append(html_accno).append(",curdate(),curtime(),");
	 	query.append(html_withdraw_amount).append(",0,'").append(html_remark).append("')");
	 	
	 	
	 	st.executeUpdate(query.toString());
	 	
	 	
	 	response.setContentType("text/xml");
	 	response.setHeader("Cache-Control","no-cache");
	 	response.setHeader("pragma","no-cache");
	 	response.setDateHeader("Expires",0);
	 	
	 	
	 	
	 	response.getWriter().write("Successfully Executed");
	 	response.getWriter().flush();
	 }
	 catch(Exception e)
	 {
	 	System.out.println(e);
	 	
	}
}
	
}	

	 	
	 	
	 		
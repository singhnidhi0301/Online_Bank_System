import javax.servlet.*;
import javax.servlet .http.*;
import java.io.*;
import java.sql.*;
public class login extends HttpServlet
{
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{
	try
	{
		String html_loginid=request.getParameter("loginid");
		String html_loginpwd=request.getParameter("loginpwd");
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con=null;
		Statement st=null;
		ResultSet rt=null;
		con=DriverManager.getConnection	("jdbc:mysql://localhost:3306/bank","root","root");
		st=con.createStatement();
		int found=0;
		rt=st.executeQuery("select username,userid from login");
		while(rt.next())
		{
			String db_loginid=rt.getString("username");
			String db_loginpwd=rt.getString("userid");
			if(db_loginid.equals(html_loginid))
			{
			if(db_loginpwd.equals(html_loginpwd))
			{
				found=1;
				break;
			}
			}
		}
		rt.close();
		st.close();
		con.close();
		PrintWriter out=response.getWriter();
		out.print("<html><body>Message from server<br>");
		out.print("Login id is "+html_loginid+"<br>");
		out.print("login pwd is "+html_loginpwd+"<br>");
		/*if(found==1)
		{
			out.print("<br><br>you are valid user");
		}
		else
		{
			out.print("<br><br>you are invalid user");	
		}
		out.print("</body></html>");*/
		if(found==1)
		{
			RequestDispatcher d=request.getRequestDispatcher("/WEB-INF/menu.jsp");
			d.forward(request,response);
		}
		else
		{
			RequestDispatcher d=request.getRequestDispatcher("/WEB-INF/invalid_user.jsp");
			d.forward(request,response);
		}	
	}
	catch(Exception e)
	{
	 	System.out.println(e);
	}
	}
}
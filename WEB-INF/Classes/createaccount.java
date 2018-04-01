import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
public class createaccount extends HttpServlet
{
	public void doPost(HttpServletRequest request,HttpServletResponse response)
		throws ServletException ,IOException
		{
			try
			{
				String name=request.getParameter("name");
				String phoneno=request.getParameter("phoneno");
				String balance=request.getParameter("balance");
				String gender=request.getParameter("gender");
				String qualification="";
				String bba=request.getParameter("qual_bba");
				String mba=request.getParameter("qual_mba");
				String btech=request.getParameter("qual_btech");
				String account_type=request.getParameter("acctype");
				String loan_balance=null;
				
				if(bba!=null)
				qualification=qualification+bba;
				if(mba!=null)
				qualification=qualification+mba;
				if(btech!=null)
				qualification=qualification+btech;
			
				String address =request.getParameter("address");
				String date=request.getParameter("date");
				
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				Connection con=null;
				Statement st=null;
				ResultSet rt=null;
			
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","root");
				st=con.createStatement();
			
				int accno=0;
				rt=st.executeQuery("select max(accno) from account_holder");
				while(rt.next())
				{
					accno=rt.getInt(1);
				}
				rt.close();
				accno++;
			
				StringBuffer query=new StringBuffer(1024);
				query.append("insert into account_holder (accno,name,phoneno,address,qualification,account_type,loan_balance,");
				query.append("gender,date,balance,status,doj) values (").append(accno).append(",'");
				query.append(name).append("','").append(phoneno).append("','").append(address);
				query.append("','").append(qualification).append("','").append(account_type).append("',0,'");
				query.append(gender).append("','").append(date).append("',");
				query.append(balance).append(",1,curdate())");			
			
			    System.out.println(query.toString());
			
				st.executeUpdate(query.toString());
			
				st.close();
				con.close();
				
				request.setAttribute("accno",accno);
				RequestDispatcher d=request.getRequestDispatcher("/WEB-INF/createaccount_success.jsp");
				d.forward(request,response);
				}
				catch(Exception e)
				{
					System.out.println(e);
				}
			}
}		
									
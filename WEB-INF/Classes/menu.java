import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
public class menu extends HttpServlet
{
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException
	{
		if(request.getParameter("createaccount")!=null)
		{
			RequestDispatcher d=request.getRequestDispatcher("/WEB-INF/createaccount.jsp");
			d.forward(request,response);
			return;
		}
		if(request.getParameter("deposite_amount")!=null)
		{
			RequestDispatcher d=request.getRequestDispatcher("/WEB-INF/deposite_amount.jsp");
			d.forward(request,response);
			return;
		}
		if(request.getParameter("withdrawamount")!=null)
		{
			RequestDispatcher d=request.getRequestDispatcher("/WEB-INF/withdrawamount.jsp");
			d.forward(request,response);
			return;
		}
		if(request.getParameter("ministatement")!=null)
		{
			RequestDispatcher d=request.getRequestDispatcher("/WEB-INF/ministatement.jsp");
			d.forward(request,response);
			return;
		}
		if(request.getParameter("memberlist")!=null)
		{
			RequestDispatcher d=request.getRequestDispatcher																					("/WEB-INF/memberlist.jsp");
			d.forward(request,response);
			return;
		}
	}
}
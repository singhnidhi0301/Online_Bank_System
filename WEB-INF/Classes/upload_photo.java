import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;
import java.util.Date;
import java.util.List;
import java.util.Iterator;
import java.io.File;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.*;


public class upload_photo extends HttpServlet
{
	 public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException                             
     {
     
     String student_id=null;	
      
     
   
      FileItemFactory factory = new DiskFileItemFactory();
      ServletFileUpload upload = new ServletFileUpload(factory);
      List items = null;
      
      Iterator itr = null;
      
      try 
         {   
          items = upload.parseRequest(request);
         
           itr = items.iterator();
            
            while (itr.hasNext()) 
	        {
             FileItem item = (FileItem) itr.next();
                    
                     if (item.isFormField()) /*html form elements*/
	               {
	                  String name = item.getFieldName();
		              String value = item.getString();
		            	
					 		 if(name.equals("student_id"))
				             {
							  student_id=value;  /*this will get html student_id textbox value you can save it in database*/
							  }	 
                   }  
               else
               { 
                  /* image coming from html */
                  
                  String itemName = item.getName();
			      
		          File savedFile = new File("f:\\upload-"+student_id+".jpg");
		          item.write(savedFile);  
		       }
    
             }/*while*/
          
      	
          response.getWriter().print("Successfully Saved");
					          
						            
    } 
     catch(Exception e)
    {
    	System.out.println(e);              
	 }                       
 }  
	
}	









	

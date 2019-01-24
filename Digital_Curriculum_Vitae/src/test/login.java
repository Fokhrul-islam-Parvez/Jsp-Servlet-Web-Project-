package test;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import test.dbConnection;
import test.CheckEmailAndPassword;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/login")


public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			dispector rd=new dispector();
			response.setContentType("text/html");
			String email=request.getParameter("uemail");
			String pass=request.getParameter("upass");
			String databaseName=DatabaseNameAndPassword.getDatabaseName();
			String databasePassword=DatabaseNameAndPassword.getDatabasePassword();
			String query="select * from userregistration where email='"+email+"' and password='"+pass+"'";
		    
		    Connection con = null;
		    Statement st = null;
		    dbConnection dbc=new dbConnection();
	    try {
			
			   
			   con= dbc.setConnection(databaseName,  databasePassword);
			   st=dbc.CreatStatement(con);
			   ResultSet rs= dbc.ExecuteQuery(st,query);  
			   CheckEmailAndPassword checkEP= new CheckEmailAndPassword();
			   
			   int validEmail=0;
			   validEmail=checkEP.checkEmail(rs,email);
		  
			   if(validEmail==1)
			   {
				   int validPassword=0;
				   validPassword=checkEP.checkPassword(rs,pass,request);
			  
				   if(validPassword==1)
				   {
					  
					   
					   PrintWriter out = response.getWriter(); 
						/* out.println("<script src=\"test.jar/jquery.min.js\"></script>");
						 out.print(" <script src=\"test.jar/sweetalert2.all.js\"></script>");
						 out.println("<script>");
						 out.println("$(document).reday(function(){");
						 out.println(" swal(\r\n" + 
						 		"  'Good job!',\r\n" + 
						 		"  'You clicked the button!',\r\n" + 
						 		"  'success'\r\n" + 
						 		")");
						 out.println("});");
						 out.println("</script>");*/
					   out.print("connect");
					   rd.requestDispectorForward(request,response,"home.jsp");
					   
				   } else {
					   
					   rd.requestDispectorInclude(request,response,"index.html");
				                           
				   }
			   } else {
				   
			   rd.requestDispectorInclude(request,response,"index.html");
			                           
		   }
		  
	    } catch (ClassNotFoundException | SQLException e) {
			
	    	e.printStackTrace();
		}
	    finally {
		      try{
			         if(st!=null)
			         {
			        	 try{
			    	         if(con!=null)
			    	        	 dbc.ConnectionClose( st,con);
			    	      }catch(Exception se){
			    	         se.printStackTrace();
			    	      }
			         }
			      }catch(Exception se){
			      }
			}
		
	    dbc.ConnectionClose( st,con);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		

	}


}

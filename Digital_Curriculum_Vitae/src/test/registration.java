package test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/registration")
public class registration extends HttpServlet {
	private static final long serialVersionUID = 8636823945494424643L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		 
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String passWord=request.getParameter("pass");
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String gender=request.getParameter("gender");
		String userID=autoCreateID.createID();
		String dateOfBirth=request.getParameter("dateOfBirth");
		//PrintWriter out=response.getWriter();
		
		String query="INSERT INTO USERREGISTRATION (ID, EMAIL, PASSWORD, FNAME, LNAME, GENDER, BIRTH_DATE) VALUES ('"+userID+"', '"+email+"', '"+passWord+"','"+fname+"','"+lname+"','"+gender+"','"+dateOfBirth+"')";
		String query2="INSERT INTO USER_CONTACT_INFORMATION (ID) VALUES ('"+userID+"')";
		String databaseName=DatabaseNameAndPassword.getDatabaseName();
		String databasePassword=DatabaseNameAndPassword.getDatabasePassword();
		dbConnection dbc=new dbConnection();
		
		
		Connection con = null;
		Statement st = null;
		int rs = 0;
		
		try {
			con = dbc.setConnection(databaseName,  databasePassword);
		    st=dbc.CreatStatement(con);
			rs= dbc.updateQuery( st, query);
		    dbc.updateQuery( st, query2);
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}finally {
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
		if(rs>0)
		{
			    dispector rd=new dispector();
			  rd.requestDispectorForward(request,response,"index.html");
		}

		
		 dbc.ConnectionClose( st,con);
	}

}

package test;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ProfileUpdate")
public class ProfileUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();  
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String gender=request.getParameter("gender");
		String userID=null;
		String religion=request.getParameter("religion");
		String nationality=request.getParameter("nationality");
		String birthDay=request.getParameter("dateOfBirth");
		if(birthDay.equals(""))
		{
			HttpSession session=request.getSession();
			birthDay=(String) session.getAttribute("dateOfBirth");
		}
		
		dbConnection dbc=new dbConnection();
		Connection con = null;
		Statement st = null;
		PreparedStatement ps = null; 
		int rs = 0;
		String databaseName=DatabaseNameAndPassword.getDatabaseName();
		String databasePassword=DatabaseNameAndPassword.getDatabasePassword();
		sessionCreate check=new sessionCreate();
		userID=check.checkSession(request, response);
		try {
			out.print("dbc not null");
			con = dbc.setConnection(databaseName,  databasePassword);
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		
		try {
			String query="UPDATE userregistration set FNAME=?, LNAME=?, GENDER=?, NATIONALITY=?, BIRTH_DATE=?, RELIGION=? WHERE ID=?";		
			ps=con.prepareStatement(query);
			ps.setString(1, fname);
			ps.setString(2, lname);
			ps.setString(3, gender);
			ps.setString(4, nationality);
			ps.setString(5, birthDay); 
			ps.setString(6, religion);
			ps.setString(7, userID);
			rs=ps.executeUpdate();
			ps.close();
		} catch (SQLException e) {
			
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
		
		
		String mobile1=request.getParameter("mobile1");
		String mobile2=request.getParameter("mobile2");
		String mobile3=request.getParameter("mobile3");
		String presentAddress=request.getParameter("presentAddress");
		String permanentAddress=request.getParameter("permanentAddress");
		try {
			String query="UPDATE USER_CONTACT_INFORMATION set MOBILE_1=?, MOBILE_2=?, MOBILE_3=?, PRESENT_ADDRESS=?, PERMANENT_ADDRESS=? WHERE ID=?";	
			ps=con.prepareStatement(query);
			ps.setString(1, mobile1);
			ps.setString(2, mobile2);
			ps.setString(3, mobile3);
			ps.setString(4, presentAddress);
			ps.setString(5, permanentAddress); 
			ps.setString(6, userID);
			rs=ps.executeUpdate();
			ps.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		/*
		String examTital=request.getParameter("exam_title");
		String major=request.getParameter("major");
		String institute=request.getParameter("institute");
		String result=request.getParameter("result");
		String passYear=request.getParameter("passYear");
		String duration=request.getParameter("duration");
		String  rid=request.getParameter("rid");
		
		try {
			String query="UPDATE USER_ACADEMIC_QUELIFICATION set EXAM_TITAL=?,MAJOR=?,INSTITUATE=?, RESULT=?, PASS_YEAR=?, DURATION=? WHERE R_ID=? and S_ID=?";	
			ps=con.prepareStatement(query);
			ps.setString(1, examTital);
			ps.setString(2,  major);
			ps.setString(3, institute);
			ps.setString(4, result);  
			ps.setString(5, passYear);    
			ps.setString(6, duration);
			ps.setString(7, rid);
			ps.setString(8, userID);
			rs=ps.executeUpdate();
			ps.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		*/
		if(rs>0)
		{
			
			
			   dispector rd=new dispector();
			   rd.requestDispectorForward(request,response,"profile.jsp");
		}
		else
			out.print("no connect");
		

	/*
		//FileInputStream fis=ImageProcess.insertImage(request.getParameter("file"));
		File f= new File(request.getParameter("photo"));
		FileInputStream fis= new FileInputStream(f);
			
		try {
			String imagequery="insert into USER_IMAGE values(?,?)";
			ps=con.prepareStatement(imagequery);
			ps.setString(1, userID);
			ps.setBinaryStream(2, fis );
			ps.setBlob(2, fis);
			ps.executeUpdate();
			ps.close();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
	
	*/
		
		 dbc.ConnectionClose( ps,con);
	}

		
		
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

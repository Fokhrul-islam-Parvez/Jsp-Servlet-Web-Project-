package test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AcademicQualificationUpdateAndDelete")
public class AcademicQualificationUpdateAndDelete extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		dbConnection dbc=new dbConnection();
		Connection con = null;
		PreparedStatement ps = null; 
		int rs = 0;
		String databaseName=DatabaseNameAndPassword.getDatabaseName();
		String databasePassword=DatabaseNameAndPassword.getDatabasePassword();
		sessionCreate check=new sessionCreate();
		String userID=check.checkSession(request, response);
		if(dbc!=null)
		try {
			con = dbc.setConnection(databaseName,  databasePassword);
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		String action=request.getParameter("action");
		if(action.equals("Update"))
		{
			
			String examTital=request.getParameter("exam_title");
			String major=request.getParameter("major");
			String institute=request.getParameter("institute");
			String result=request.getParameter("result");
			String passYear=request.getParameter("passYear");
			String duration=request.getParameter("duration");
			String rid=request.getParameter("rid");
			//String query="UPDATE USER_ACADEMIC_QUELIFICATION set EXAM_TITAL=?,MAJOR=?,INSTITUATE=?, RESULT=?, PASS_YEAR=?, DURATION=? WHERE R_ID=? and S_ID=?";	
			String query="UPDATE USER_ACADEMIC_QUELIFICATION SET EXAM_TITAL =?, MAJOR = ?, INSTITUATE =?,RESULT=?, PASS_YEAR =?, DURATION = ? WHERE S_ID =? and R_ID =?";
			try {
				ps=con.prepareStatement(query);
				ps.setString(1, examTital);
				ps.setString(2, major);
				ps.setString(3, institute);
				ps.setString(4, result);
				ps.setString(5, passYear); 
				ps.setString(6, duration);
				ps.setString(7, userID);
				ps.setString(8, rid); 
				rs=ps.executeUpdate();
				ps.close();
				if(rs>0)
				{
					
					
					   dispector rd=new dispector();
					   rd.requestDispectorInclude(request, response, "profileEdit.jsp");
					  
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		else if(action.equals("Delete"))
		{
			String rid=request.getParameter("rid");
			String query="DELETE FROM USER_ACADEMIC_QUELIFICATION  WHERE S_ID =? and R_ID =?";
			try {
				ps=con.prepareStatement(query);
				ps.setString(1, userID);
				ps.setString(2, rid);
				rs=ps.executeUpdate();
				ps.close();
				if(rs>0)
				{
					
					
					   dispector rd=new dispector();
					   rd.requestDispectorInclude(request, response, "profileEdit.jsp");
					  
				}
			} catch (SQLException e) {
				
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		
		
		dbc.ConnectionClose(ps, con);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}

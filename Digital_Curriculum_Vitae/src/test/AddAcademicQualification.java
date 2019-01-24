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

@WebServlet("/AcademicQualification")
public class AddAcademicQualification extends HttpServlet {

	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		dbConnection dbc=new dbConnection();
		Connection con = null;
		Statement st = null;
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
		String examTital=request.getParameter("exam_title");
		String major=request.getParameter("major");
		String institute=request.getParameter("institute");
		String result=request.getParameter("result");
		String passYear=request.getParameter("passYear");
		String duration=request.getParameter("duration");
		String query="INSERT INTO USER_ACADEMIC_QUELIFICATION (EXAM_TITAL, MAJOR, INSTITUATE, RESULT, PASS_YEAR, DURATION, S_ID) VALUES ('"+examTital+"', '"+major+"', '"+institute+"','"+result+"','"+passYear+"','"+duration+"','"+userID+"')"; //(?,?,?,?,?,?,?)"; 
		/*ps=con.prepareStatement(query);
		ps.setString(1, examTital);
		ps.setString(2, major);		ps.setString(3, institute);
		ps.setString(4, result);
		ps.setString(5, passYear); 
		ps.setString(6, duration);
		ps.setString(7, userID);
		rs=ps.executeUpdate();
		ps.close();*/
		st=dbc.CreatStatement(con);
		rs= dbc.updateQuery( st, query);
		if(rs>0)
		{
			
			
			   dispector rd=new dispector();
			   rd.requestDispectorInclude(request, response, "AddAcademicQualification.jsp");
			  
		}
		 
		dbc.ConnectionClose(st, con);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

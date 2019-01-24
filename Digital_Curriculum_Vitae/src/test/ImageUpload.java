package test;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/ImageUpload")
public class ImageUpload extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		dbConnection dbc=new dbConnection();
		Connection con = null;
		Statement st = null;
		PreparedStatement ps = null; 
		String userID=null;
		int rs = 0;
		String databaseName=DatabaseNameAndPassword.getDatabaseName();
		String databasePassword=DatabaseNameAndPassword.getDatabasePassword();
		sessionCreate check=new sessionCreate();
		userID=check.checkSession(request, response);
		
		try {
			con = dbc.setConnection(databaseName,  databasePassword);
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		  PrintWriter out = response.getWriter(); 
		
	       InputStream inputStream = null;	
		   Part filePart = request.getPart("photo");
		   
		  out.print("ok");/*
		    Part filePart=request.getPart("image");// Retrieves <input type="file" name="image">`
		  
	        String filePath = filePart.getSubmittedFileName();//Retrieves complete file name with path and directories 
	        Path p = Paths.get(filePath); //creates a Path object
	        String fileName = p.getFileName().toString();//Retrieves file name from Path object
	        InputStream fileContent = filePart.getInputStream();
		   
		   
		  
		   int  len=(int) filePart.getSize();
			inputStream = filePart.getInputStream();
			
			
			try {
				
				String sql ="insert into USER_IMAGE (ID , IMAGE) VALUES(?,?)"; //"INSERT INTO contacts (first_name, last_name, photo) values (?, ?, ?)";
				ps= con.prepareStatement(sql);
				ps.setString(1, userID);
				
				if (inputStream != null) {
					ps.setBinaryStream(2,inputStream,len );    //.setBlob(2, inputStream);
				}
				else
					out.print("inputStreem is null");
				
			} catch (SQLException ex) {
				ex.printStackTrace();
			} 	
			try {
				if(ps!=null)
				rs=ps.executeUpdate();
				else
					out.print("ps is null");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			*/
		dbc.ConnectionClose( ps,con);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

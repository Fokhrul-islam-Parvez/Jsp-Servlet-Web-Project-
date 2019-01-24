<%@ page import="java.sql.Connection"%>
 <%@ page import="java.sql.ResultSet"%>
 <%@ page import="java.sql.Statement" %>
 <%@ page import="test.sessionCreate"%>
 <%@ page import="test.dbConnection"%>
 <%@ page import="java.sql.SQLException"%>
  <%@ page import="test.sessionCreate"%>
   <%@ page import="test.DatabaseNameAndPassword"%>
<!DOCTYPE html>
  <html>
   <head>
   	<link href="css/style4.css" rel="stylesheet" type="text/css">
    <link href="css/style5.css" rel="stylesheet" type="text/css">  
    <link href="css/style6.css" rel="stylesheet" type="text/css"> 
   </head>
   
   <body>
    <div id="id01" class="modal">
    
    
    
    
    
    
    
   		<header>
 			 <ul class="ullist">
  				 <li class="lilist"><a  class="aa" href="logOut">Logout</a></li>
 				 <li class="lilist"><a  class="aa" href="profile.jsp">Profile</a></li>
  				 <li class="lilist"><a class="aa" href="#">Contact</a></li>
  				 <li class="lilist"><a  class="aa" href="#">About</a></li>
  				 <li class="lilist"><a class="aa" href="home.jsp">Home</a></li>
 			</ul>
 		</header>
 		
		
 <div class="modal-content">	
  
  
  
  
  
  
  
 	
 	<div class="container">
  	 <div class="personal"style="background-color:#f1f1f1"> 
 	 <form action="AcademicQualification" method="post" > 	
 		 <h4 style="background-color:black; color:white; padding:8px; font-family:Verdana, Geneva, sans-serif; font-size: 150%;">Add Academic Qualification</h4>
 	 
  		<table style="width:100%" class="tb">
 			 <tr class="tb">
   				 <th class="tb"  style="padding:8px;" >Exam title</th>
   				 <th class="tb">Major / Group</th> 
   				 <th class="tb">Institution</th>
   				 <th class="tb">Result</th>
    			 <th class="tb">Passing year</th> 
   				 <th class="tb">Duration</th>
 			 </tr>
  			 <tr class="tb">
    			<td class="tb"><input style="border: 0px solid black; width: 110px;" class="tab" required type="text" name="exam_title"></td>
    			<td class="tb"><input style="border: 0px solid black; width: 100px;" class="tab" required type="text" name="major"></td>
    			<td class="tb"><input style=" border: 0px solid black; width: 230px;" class="tab" required type="text" name="institute"></td>
    			<td class="tb"><input style=" border: 0px solid black; width: 90px;"class="tab" required type="text" name="result" ></td>
    			<td class="tb"><input style=" border: 0px solid black; width: 90px;" class="tab" required type="text" name="passYear" ></td>
   				 <td class="tb"><input style=" border: 0px solid black; width: 80px;" class="tab" required type="text" name="duration" ></td>
  			</tr>
  		</table>
  		 <div style="padding: 30px;">
  		 <input type="submit" Value="Submit"style=" border: 1px solid black; width: 100%; background-color: green; color:white; padding:6px; font-family:Verdana, Geneva, sans-serif; font-size: 150%;">    
  	    </div>
  	 </form> 
  	</div>
  	</div>
  	
  	
  	 	
  <div class="container">
  	 <div class="personal"style="background-color:#f1f1f1">
       <h4 style="background-color:black; color:white; padding:8px; font-family:Verdana, Geneva, sans-serif; font-size: 150%;">List of Academic Qualification</h4>
  <table style="width:100%" class="tb">
  <tr>
    <th class="tb"  style="padding:8px;" >Exam title</th>
    <th class="tb">Major / Group</th> 
    <th class="tb">Institution</th>
    <th class="tb">Result</th>
    <th class="tb">Passing year</th> 
    <th class="tb">Duration</th>
  </tr>
  	 	<% 
  	 	
		dbConnection db=new dbConnection();
		Connection con = null;
		Statement st = null;
		int rs = 0;
		String databaseName=DatabaseNameAndPassword.getDatabaseName();
		String databasePassword=DatabaseNameAndPassword.getDatabasePassword();
		sessionCreate check=new sessionCreate();
		String userID=check.checkSession(request, response);
		if(db!=null)
		try {
			con = db.setConnection(databaseName,  databasePassword);
			st=db.CreatStatement(con);
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		  String query2="select * from USER_ACADEMIC_QUELIFICATION where S_ID='"+userID+"'";
		  ResultSet rs2 = null;
		  rs2=db.ExecuteQuery(st, query2);
		  if(rs2!=null)
		  {
			  try {
					 while(rs2.next())
						{
		  out.print("<tr>");
		  out.print("<td class=\"tb\" style=\"padding:8px; text-align: center;\" >");
		  out.print(rs2.getString(2));
		  out.print("</td>");
		  
		  
		  out.print("<td class=\"tb\" style=\"padding:8px; text-align: center;\" >");
		  out.print(rs2.getString(3));
		  out.print("</td>");
		  
		 
		  out.print("<td class=\"tb\" style=\"padding:8px; text-align: center;\">");
		  out.print(rs2.getString(4));
		  out.print("</td>");
		  

		  out.print("<td class=\"tb\" style=\"padding:8px; text-align: center;\">");
		  out.print(rs2.getString(5));
		  out.print("</td>");
		  
		 
		  out.print("<td class=\"tb\" style=\"padding:8px; text-align: center;\">");
		  out.print(rs2.getString(6));
		  out.print("</td>");
		  
		  out.print("<td class=\"tb\" style=\"padding:8px; text-align: center;\">");
		  out.print(rs2.getString(7));
		  out.print("</td>");
		  
		  out.print("</tr>");
						}
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
		}
		  
		  db.ConnectionClose(st, con);
		  %>
  </table>
 </div>
</div>
  	 

  
  
  
  
  
  
  
  
  
 </div>
 <footer >
      <h5>Copyright © 2018 Parvez. All Rights Reserved.</h5>
     </footer>
  </div>
   </body>
  </html>
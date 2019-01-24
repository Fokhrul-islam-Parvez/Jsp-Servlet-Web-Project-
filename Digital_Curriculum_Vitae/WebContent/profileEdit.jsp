<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.Connection"%>
 <%@ page import="java.sql.ResultSet"%>
 <%@ page import="java.sql.Statement" %>
 <%@ page import="test.sessionCreate"%>
 <%@ page import="test.dbConnection"%>
 <%@ page import="java.sql.SQLException"%>
  <%@ page import="test.sessionCreate"%>
   <%@ page import="test.DatabaseNameAndPassword"%>
 
<%!
String userID=null;
Connection con = null;
Statement st = null;
ResultSet rs = null;
String databaseName=DatabaseNameAndPassword.getDatabaseName();
String databasePassword=DatabaseNameAndPassword.getDatabasePassword();
String name="";
String lastName="";
String email="";
String dateOfBirth="";
String gender="";
String religion="";
String nationality="";
String examTital="";
String major="";
String institute="";
double result;
int passYear;
int duration;
String mobile1="";
String mobile2="";
String mobile3="";
String presentAddress="";
String permanentAddress="";

%>
<% 

  sessionCreate check=new sessionCreate();
  userID=check.checkSession(request, response);
  
  
 
  dbConnection db=new dbConnection();
  con=db.setConnection(databaseName, databasePassword);
  st=db.CreatStatement(con);
  
  String query="select * from USERREGISTRATION where ID='"+userID+"'";
  rs=db.ExecuteQuery(st, query);
  if(rs!=null)
  {
	  try {
			 while(rs.next())
				{
				  
				    email = rs.getString(2);
					name=rs.getString(4);
					lastName=rs.getString(5);
					gender=rs.getString(6);
					nationality=rs.getString(7);
					dateOfBirth=rs.getString(8);
					religion=rs.getString(9);					
				}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
  }
   
    if(!dateOfBirth.equals(""))
	session.setAttribute("dateOfBirth", dateOfBirth);
  /*
  String query2="select * from USER_ACADEMIC_QUELIFICATION where ID='"+userID+"'";
  ResultSet rs2 = null;
  rs2=db.ExecuteQuery(st, query2);
 
  
   if(rs2!=null)
  {
	  try {
			 while(rs2.next())
				{
				   
			     examTital=rs2.getString(2);
				 major=rs2.getString(3);
				 institute=rs2.getString(4);
				 result=Double.parseDouble(rs2.getString(5));
				 passYear= Integer.parseInt(rs2.getString(6));
				 duration= Integer.parseInt(rs2.getString(7));
				}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
  }
  */
   
   ResultSet rs3 = null;
   String query3="select * from USER_CONTACT_INFORMATION where ID='"+userID+"'";
   rs3=db.ExecuteQuery(st, query3);
   
   
   if(rs3!=null)
   {
 	  try {
 			 while(rs3.next())
 				{
 				   
 			     mobile1=rs3.getString(2);
 				 mobile2=rs3.getString(3);
 				 mobile3=rs3.getString(4);
 				presentAddress=(rs3.getString(5));
 				permanentAddress=(rs3.getString(6));
 				}
 		} catch (SQLException e) {
 			
 			e.printStackTrace();
 		}
   }
   
  
  %>
  
  
  
  
  
  <!DOCTYPE html>
  <html>
   <head>
   	<link href="css/style4.css" rel="stylesheet" type="text/css">
    <link href="css/style5.css" rel="stylesheet" type="text/css"> 
    <link href="css/style7.css" rel="stylesheet" type="text/css"> 
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
  		<div class="personal"style="background-color:#fefefe ;border: 1px solid #888;"> 
			
     			 <div class="imgcontainer">
     			
         			  <img src="image/apple.jpg" alt="Avatar" class="avatar">
         		
     			 </div>
    		     <div style="text-align:center;">
    		      <form method="post" action="ImageUpload" enctype="multipart/form-data">
      				 <input type="file" name="image"id="image" accept="image/jpg">
      				 <button type="submit" value="Submit">Upload Image</button> 
      			  </form>
    		     </div>
    		     
 <div class="container"> 
  <div class="personal"style="background-color:#f1f1f1">     
    	     
    		 <form action="ProfileUpdate" method="post" >
    			 <h4 style="background-color:black; color:white; padding:8px; font-family:Verdana, Geneva, sans-serif; font-size: 150%;">Personal Information</h4>
    				 <table>
     					  <tr> <td> <label for="fname">Name :</label></td>
      					 	  <td><input type="text" name="fname" value="<% out.println(name); %>"></td></tr>
        				 <tr> <td> <label for="lname">Last name :</label></td>      
       						  <td><input type="text" name="lname" value="<% out.println(lastName); %>"></td></tr>  
       					 <tr> <td>  <label for="gender"><b>Gender</b></label><br></td>
      						  <td> <input class="rad" type="radio" name="gender" id="male" value="Male" checked >Male
     							  <input class="rad" type="radio" name="gender" id="female" value="Female">Female</td></tr>
      		  		     <tr> <td>  <label for="dateOfBirth">Date of birth :</label></td>
      						  <td> <input type="date" name="dateOfBirth" id="myDate" value="<% out.println(dateOfBirth); %>"></td></tr>
       					 <tr> <td>  <label for="religion">Religion :</label></td>
      						  <td><select name="religion">
          							   <option value="Islam">Islam</option>
   									   <option value="hindu">hindu</option>
   								       <option value="Ccristan">Ccristan</option>
   									   <option value="Buddish">Buddish</option>
          						 </select></td></tr>
      					 <tr> <td><label for="nationality">Nationality :</label></td>
      						 <td><input type="text" name="nationality" value="<% out.println(nationality); %>"></td></tr>
        
    				 </table>    
    
   
   			   <h4 style="background-color:black; color:white; padding:8px; font-family:Verdana, Geneva, sans-serif; font-size: 150%;">Contact Information</h4>  
    				<table>  
     				  <tr> <td><label for="mobile1">Mobile number 1 :</label></td>
    					   <td><input type="text" name="mobile1" value="<% out.println(mobile1);  %>"></td></tr>
     				  <tr> <td><label for="mobile2">Mobile number 2 :</label></td>
     					   <td><input type="text" name="mobile2" value="<% out.println(mobile2);  %>"></td></tr>
     				  <tr> <td><label for="mobile3">Mobile number 3 :</label></td>
      				       <td><input type="text" name="mobile3" value="<% out.println(mobile3);  %>"></td></tr>
     				  <tr> <td><label for="presentAddress">Present Address :</label></td>
     		               <td><textarea rows="4" cols="50" name="presentAddress"><% out.println(presentAddress); %>
     						  </textarea></td></tr>
     				  <tr> <td><label for="permanentAddress">Permanent Address :</label></td>
     					   <td><textarea rows="4" cols="50" name="permanentAddress"><% out.println(permanentAddress); %>
    						  </textarea></td></tr>
    			   </table>   
 		 <div id="submit">
  			<input type="submit" name="editProfil" Value="Submit"style=" border: 1px solid black; width: 100%; background-color: #708090;; color:white; padding:6px; font-family:Verdana, Geneva, sans-serif; font-size: 150%;">    
  		</div>
      </form>
    </div>
    </div>
    
    
  <div class="container"> 
  <div class="personal"style="background-color:#f1f1f1">   
   
       <h4 style="background-color:black; color:white; padding:8px; font-family:Verdana, Geneva, sans-serif; font-size: 150%;">Academic Qualification</h4>
       
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
  String query2="select * from USER_ACADEMIC_QUELIFICATION where S_ID='"+userID+"'";
  ResultSet rs2 = null;
  rs2=db.ExecuteQuery(st, query2);
  if(rs2!=null)
  {
	  try {
			 while(rs2.next())
				{
				 String cid="cl"+rs2.getString(2);
				 session.setAttribute(cid, rs2.getString(1));
  out.print("  <form action=\"AcademicQualificationUpdateAndDelete\" method=\"post\" >");
  out.print("<tr>");
  out.print("<td class=\"tb\" style=\"padding:8px; text-align: center;\">");
  out.print("<input style=\"border: 0px solid black;  width: 50px; \" class=\"tab\"  type=\"text\" name=\"exam_title\" value=\""+rs2.getString(2)+"\">");
  //out.print(rs2.getString(2));
  out.print("</td>");
  
  
  out.print("<td class=\"tb\" style=\"padding:8px; text-align: center;\" >");
  out.print("<input style=\"border: 0px solid black;  width: 50px; \" class=\"tab\"  type=\"text\" name=\"major\" value=\""+rs2.getString(3)+"\">");
  //out.print(rs2.getString(3));
  out.print("</td>");
  
 
  out.print("<td class=\"tb\" style=\"padding:8px; text-align: center;\">");
  out.print("<input style=\"border: 0px solid black;  width: 200px; \" class=\"tab\"  type=\"text\" name=\"institute\" value=\""+rs2.getString(4)+"\">");
  //out.print(rs2.getString(4));
  out.print("</td>");
  

  out.print("<td class=\"tb\" style=\"padding:8px; text-align: center;\">");
  out.print("<input style=\"border: 0px solid black;  width: 50px; \" class=\"tab\"  type=\"text\" name=\"result\" value=\""+rs2.getString(5)+"\">");
  //out.print(rs2.getString(5));
  out.print("</td>");
  
 
  out.print("<td class=\"tb\" style=\"padding:8px; text-align: center;\">");
  out.print("<input style=\"border: 0px solid black;  width: 50px; \" class=\"tab\"  type=\"text\" name=\"passYear\" value=\""+rs2.getString(6)+"\">");
  //out.print(rs2.getString(6));
  out.print("</td>");
  
  out.print("<td class=\"tb\" style=\"padding:8px; text-align: center;\">");
  out.print("<input style=\"border: 0px solid black;  width: 10px; \" class=\"tab\"  type=\"text\" name=\"duration\" value=\""+rs2.getString(7)+"\">");
  //out.print(rs2.getString(7));
  out.print("<span disabled style=\"color:white; font-weight:bold\"><input style=\"border: 0px solid black; background: white; width: 0px; \" type=\"text\" name=\"rid\" value=\""+rs2.getString(1) +"\"></span> ");
  out.print("</td>");
  
  out.print("<td class=\"tb\" style=\"padding:8px;  text-align: center;\">");
  out.print("<input type=\"submit\" name=\"action\" Value=\"Update\"style=\" border: 1px solid black; width:70px; background-color: #32CD32;; color:white; padding:2px;  font-size: 100%;\">");
  //out.print(rs2.getString(6));
  out.print("</td>");
  
  out.print("<td class=\"tb\" style=\"padding:8px; text-align: center;\">");
  out.print("<input type=\"submit\" name=\"action\" Value=\"Delete\"style=\" border: 1px solid black; width:70px; background-color: red; color:white; padding:2px; font-size: 100%;\">");
  //out.print(rs2.getString(6));
  out.print("</td>");
  out.print("</tr>");
  out.print("</form>");
  
 
				}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
}
  rs2.close();
  db.ConnectionClose(st, con);
  %>
 <!--   <tr>
    <td class="tb"><input class="tab" type="text" name="exam_title" value="<% out.println(examTital); %>"></td>
    <td class="tb"><input style="border: 0px solid black; width: 100px;" class="tab" type="text" name="major" value="<% out.println(major); %>"></td>
    <td class="tb"><input style=" border: 0px solid black; width: 200px;" class="tab" type="text" name="institute" value="<% out.println(institute); %>"></td>
    <td class="tb"><input style=" border: 0px solid black; width: 80px;"class="tab" type="text" name="result" value="<% out.println(result); %>"></td>
    <td class="tb"><input style=" border: 0px solid black; width: 80px;" class="tab" type="text" name="passYear" value="<% out.println(passYear); %>"></td>
    <td class="tb"><input style=" border: 0px solid black; width: 50px;" class="tab" type="text" name="duration" value="<% out.println(duration); %>"></td>
  </tr>
  -->
  </table>
    </div>
   </div>
     <footer >
      <h5>Copyright © 2018 Parvez. All Rights Reserved.</h5>
     </footer>
      </div>
      

    
 </div>
      </div>
  
   </body>
  </html>
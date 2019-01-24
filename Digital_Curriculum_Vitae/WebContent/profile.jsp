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
String lastName="";
String name="";
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
  
  
  String query="select * from USERREGISTRATION where ID='"+userID+"'";
  dbConnection db=new dbConnection();
  con=db.setConnection(databaseName, databasePassword);
  st=db.CreatStatement(con);
  
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
 
  /*
  String query2="select * from USER_ACADEMIC_QUELIFICATION where ID='"+userID+"'";
  ResultSet rs2 = null;
  rs2=db.ExecuteQuery(st, query2);
 
  /*
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
   <link href="css/style6.css" rel="stylesheet" type="text/css">
    <script>
  function myfunction()
  {
	  document.getElementById('sidebar').classList.toggle('active');
  }

</script>
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
 
 
      <div class="imgcontainer"> 
             <div id="sidebar">
  <div class="toggle-btn" onclick="myfunction()">
  <span></span>
  <span></span>
  <span></span>
  </div>
  <ul>
     <li><a href="profileEdit.jsp">Profile Edit</a></li>
     <li><a href="AddAcademicQualification.jsp">Education</a></li>
     <li>Something</li>
  
  </ul>
   
     </div>
        <img src="image/apple.jpg" alt="Avatar" class="avatar">
      </div>
  
  <div class="container"> 
  <div class="personal"style="background-color:#f1f1f1">          
      <h4 style="background-color:black; color:white; padding:8px; font-family:Verdana, Geneva, sans-serif; font-size: 150%;">Personal Information</h4>   
   <table>
      <tr> <td> <label for="uname">Name :</label></td>
           <td> <output ><% out.println(name); %></output></td></tr>
      <tr> <td> <label for="uname">Last Name :</label></td>
           <td> <output ><% out.println(lastName); %></output></td></tr>
      <tr> <td> <label for="psw">Email :</label></td>
           <td> <output ><% out.println(email); %></output></td></tr>
      <tr> <td> <label for="uname">Gender :</label></td>
           <td><output ><% out.println(gender); %></output></td></tr>
      <tr> <td> <label for="psw">Dath of birth :</label></td>
           <td><output ><% out.println(dateOfBirth); %></output></td></tr>
      <tr> <td> <label for="uname">Religion :</label></td>
           <td><output ><% out.println(religion); %></output></td></tr>
      <tr> <td> <label for="psw">Nationality :</label></td>
           <td> <output ><% out.println(nationality); %></output></td></tr>
   </table>    
</div>
</div>

<div class="container"> 
  <div class="personal"style="background-color:#f1f1f1">  
       <h4 style="background-color:black; color:white; padding:8px; font-family:Verdana, Geneva, sans-serif; font-size: 150%;">Contact Information</h4>
   <table>
      <tr> <td><label for="psw">Email :</label></td>
           <td><output ><% out.println(email); %></output></td></tr>
      <tr> <td> <label for="uname">Mobile number 1 :</label></td>
           <td><output ><% out.println(mobile1); %></output></td></tr>
      <tr> <td> <label for="uname">Mobile number 2 :</label></td>
           <td><output ><% out.println(mobile2); %></output></td></tr>
      <tr> <td> <label for="uname">Mobile number 3 :</label></td>
           <td><output ><% out.println(mobile3); %></output></td></tr>
      <tr> <td> <label for="uname">Present Address :   </label></td>
           <td><textarea rows="4" cols="50" disabled><% out.println(presentAddress); %>
               </textarea></td></tr> 
      <tr> <td> <label for="uname">Permanent Address :   </label></td>
           <td><textarea rows="4" cols="50" disabled><% out.println(permanentAddress); %>
               </textarea></td></tr>
  </table>  
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
       <footer >
 <h5>Copyright © 2018 Parvez. All Rights Reserved.</h5>
 </footer>
     </div> 
      
 <!-- <tr>
    <td class="tb"><output class="tab"name="exam_title"><% out.println( examTital); %></output></td>
    <td class="tb"><output style="width: 100px;" name="major" ><% out.println(major); %></output></td>
    <td class="tb"><output style="width: 200px;" name="institute"><% out.println(institute); %></output></td>
    <td class="tb"><output style="width: 80px;" name="result" ><% out.println(result); %></output></td>
    <td class="tb"><output style="width: 80px;" name="passYear" ><% out.println(passYear); %></output></td>
    <td class="tb"><output style=" width: 50px;" name="duration" ><% out.println(duration); %></output></td>
  </tr> --> 
 
 </div>
 
   </body>
  </html>

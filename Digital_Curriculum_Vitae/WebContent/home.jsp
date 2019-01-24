<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 
 <%@ page import="test.sessionCreate" %>
 <%! String userID=null; %>
 <% sessionCreate check=new sessionCreate();
   userID=check.checkSession(request, response);%>
 
<!DOCTYPE html>
<html>
<head>
<link href="css/style4.css" rel="stylesheet" type="text/css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script>
  function myfunction()
  {
	  document.getElementById('sidebar').classList.toggle('active');
  }

</script>


</head>
<body>
<div class="profile"> 
<header>
  <ul class="ullist">
   <li class="lilist"><a  class="aa" href="logOut">Logout</a></li>
  <li class="lilist"><a  class="aa" href="profile.jsp">Profile</a></li>
   <li class="lilist"><a class="aa" href="#">Contact</a></li>
   <li class="lilist"><a  class="aa" href="#">About</a></li>
   <li class="lilist"><a class="aa" href="#">Home</a></li>
 </ul>
 </header>
 </div>
 <footer>
 <h5>Copyright © 2018 Parvez. All Rights Reserved.</h5>
 </footer>
 </body>
 

</html>
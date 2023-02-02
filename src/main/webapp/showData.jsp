<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Showing data</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<a href="admin.html" style ="margin-top:75px">Go back</a>
<%!
	Connection con = null;
	Statement smt = null;
	ResultSet rs= null;
	public void jspInit(){
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Abc+007-");
			smt = con.createStatement();
		}catch(Exception ee){
			ee.printStackTrace();
		}
	}
	
	public void jspDestroy(){
		try{
			smt.close();
			con.close();
		}catch(Exception ee){
			ee.printStackTrace();
		}
	}
%>

<%
	String qry = "SELECT * FROM test_db";
	rs = smt.executeQuery(qry);
	%>
	<table class = "table table-striped " style="margin-top:100px;">
	<tr><th>Category</th><th>Word</th><th>Hint</th></tr>
	<%
	while(rs.next()){
		%>
			<tr>
				<td> <%= rs.getString("category") %> </td>
				<td> <%= rs.getString("word") %> </td>
				<td> <%= rs.getString("hint") %> </td>
			</tr>
		<%
	}
	%>
		</table>
	<%
%>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
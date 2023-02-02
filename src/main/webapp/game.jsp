<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="java.util.*" import="java.io.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hang-man</title>
    <link rel="stylesheet" href="css/index.css">
</head>

<body>
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
	
	<%
	int i = 0,j=0;
	 ArrayList<ArrayList<String> > lists = new ArrayList<ArrayList<String> >();
	 while(rs.next()){
		 lists.add(new ArrayList<String>());
		 j=0;
		 lists.get(i).add(j,rs.getString("category")); j++;
		 lists.get(i).add(j,rs.getString("word")); j++;
		 lists.get(i).add(j,rs.getString("hint"));
		 i++;
	}
	 
	 String jsArray = "[";
	 for (int k = 0; k < lists.size(); ++k) {
	 	String jsSubArray = "[";
		for (int l = 0; l < lists.get(0).size(); ++l) {
			jsSubArray += "'" + lists.get(k).get(l) + "'";
			if (l != lists.get(0).size() - 1) jsSubArray += ", ";
		}
		jsSubArray += "]";
		if (k != lists.size() - 1) jsSubArray += ", ";
		jsArray += jsSubArray;
	 }
	 jsArray += "]";
	%>
<script>
	const lists = <%= jsArray %>
</script>

	
	 	<div class="wrapper">
        <h1>Hang-man</h1>
        <a href="login.html" style="color: white">Login as admin instead?</a>
        <p>Use the alphabet below to guess the word, or click hint to get a clue. </p>
    </div>
    <div class="wrapper">
        <div id="buttons"></div>
        <div><br><br><br><br><br></div>
        <p id="catagoryName"></p>
        <div id="hold"></div>
        <p id="mylives"></p>
        <p id="clue"><strong>Clue:</strong> </p>
        <canvas id="stickman">Stick man drawing</canvas>
        <div class="container">
            <button id="hint">Hint</button>
            <button id="reset">Play again</button>
        </div>
    </div>
    <script src="index.js"></script>
   
</body>

</html>
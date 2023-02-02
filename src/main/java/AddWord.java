import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/add")
public class AddWord extends HttpServlet {
private static final long serialVersionUID = 1L;
	
	Connection con = null;
	Statement smt = null;
	
	public void init() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Abc+007-");
			smt = con.createStatement();
		}catch(ClassNotFoundException ce) {
			System.out.println(ce);
		}catch(SQLException se) {
			System.out.println(se);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String word = request.getParameter("word");
		String hint = request.getParameter("hint");
		String category = request.getParameter("category");
		
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		//out.println(word+" "+hint+" "+category);
		
		String qry = "INSERT INTO test_db VALUES('"+category+"','"+word+"','"+hint+"')";
		try {
			int i = smt.executeUpdate(qry);
			if(i==1) {
				out.println("<br>Successfully inserted :D");
			} else {
				out.println("<br>Something Wrong :(");
			}
			out.println("<br><a href=\"admin.html\" style=\"color:#545454\">Go back</a>");
			out.println("&nbsp;&nbsp;&nbsp;<a href=\"logout\" style=\"color:#545454\">Logout</a>");
		}catch(Exception e) {
			System.out.println(e);
		}
		
		
		out.println("</body></html>");
		
	}
	
	public void destroy() {
		try {
			smt.close();
			con.close();
		}catch(Exception e) {
			System.out.println(e);
		}
	}

}
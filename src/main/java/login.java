import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public login() {
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		PrintWriter out=response.getWriter();
		out.print("<html><body>");
		String name=request.getParameter("uname");
		String password=request.getParameter("psw");
		String[] checkbox=request.getParameterValues("remember");
		if(name.equals("system")&&password.equals("admin"))
		{
			out.print("you have logged in");
			HttpSession session=request.getSession(true);
			
			session.setAttribute("name",name);
			response.sendRedirect("admin.html");
		}
		else {
			out.print("Invalid username or password");
			out.print("<br><a href=\"login.html\">Go back</a>");
		}
		out.print("</body></html>");
		
	}
	

}
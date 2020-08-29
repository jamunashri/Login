package Register;

import java.io.IOException;
import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class EmployeeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private EmployeeDao employeeDao;
    private Employee employee;

    public void init() {
        employeeDao = new EmployeeDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
       

        Employee employee = new Employee();
        employee.setFirst_name(first_name);
        employee.setLast_name(last_name);
        employee.setUsername(username);
        employee.setPassword(password);
        if(first_name.isEmpty() || last_name.isEmpty() || username.isEmpty()|| password.isEmpty())        {	
        	
        	employee.setError("Fill all the values");
        	request.setAttribute("employee", employee); 
        	//request.setAttribute("errorMessage", "Fill all the values"); 
              RequestDispatcher dispatcher = request.getRequestDispatcher("/register.jsp");
              dispatcher.forward( request, response);
        	
		}
		else
		{
			RequestDispatcher req = request.getRequestDispatcher("registerSuccess.jsp");
			req.forward(request, response);
		}
        try {
            employeeDao.registerEmployee(employee);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
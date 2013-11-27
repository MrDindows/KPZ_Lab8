package Sample;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

/**
 * Created with IntelliJ IDEA.
 * User: Администратор
 * Date: 22.10.13
 * Time: 23:23
 */
@WebServlet(name = "HRManager")
public class HRManager extends HttpServlet {

    protected List<Employee> employees;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String path = request.getPathInfo();

		String target;
		String name = request.getParameter("Name");
		String familyStatus = request.getParameter("FamilyStatus");
		Date birthdayDate = null;
		try {
			birthdayDate = new SimpleDateFormat("yyyy-mm-dd", Locale.ENGLISH).parse(request.getParameter("BirthdayDate"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		String position = request.getParameter("Position");
		Date enrollmentDate = null;
		try {
			enrollmentDate = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH).parse(request.getParameter("EnrollmentDate"));
		} catch (ParseException e) {
			e.printStackTrace();
		}

		if (path == null){
			target = "/viewEmployees.jsp";
		} else if (path.equals("/add")){
			if (name != null &&
					birthdayDate != null &&
					familyStatus != null &&
					enrollmentDate != null &&
					position != null){
				employees.add(new Employee(name, birthdayDate, familyStatus, position ));
				//request.getParameterMap().clear();
				target = "/viewEmployees.jsp";
			} else {
				target = "/addEmployee.jsp";
			}
		} else if (path.equals("/edit")){
			String idParam = request.getParameter("id");
			Employee employeeToDelete = null;
			if (    idParam != null &&
					name != null &&
					birthdayDate != null &&
					familyStatus != null &&
					enrollmentDate != null &&
					position != null){
				Integer id = Integer.parseInt(idParam);
				for (Employee employee : employees){
					if (employee.getId() == id){
						if (request.getParameter("delete")!=null){
							employeeToDelete = employee;
						} else {
							employee.setName(name);
							employee.setBirthdayDate(birthdayDate);
							employee.setEnrollmentDate(enrollmentDate);
							employee.setPosition(position);
							employee.setFamilyStatus(familyStatus);
						}
						break;
					}
				}
				if (employeeToDelete != null) {
					employees.remove(employeeToDelete);
				}
				target = "/viewEmployees.jsp";
			} else {
				target = "editEmployee.jsp";
			}
		} else if (path.equals("/view")){
			target = "/viewEmployees.jsp";
		} else {
			target = "/viewEmployees.jsp";
		}
		request.setAttribute("target", target);
		request.setAttribute("path", path);
		request.setAttribute("employees", employees);
		request.getRequestDispatcher(target).forward(request, response);
	}

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String path = request.getPathInfo();
        String target;
        if (path == null){
            target = "/viewEmployees.jsp";
        } else if (path.equals("/add")){
            target = "/addEmployee.jsp";
        } else if (path.equals("/edit")){
            target = "/editEmployee.jsp";
        } else if (path.equals("/view")){
            target = "/viewEmployees.jsp";
        } else {
            target = "/viewEmployees.jsp";
        }
        request.setAttribute("target", target);
        request.setAttribute("path", path);
		request.setAttribute("employees", employees);
        request.getRequestDispatcher(target).forward(request, response);
    }

    @Override
    public void init() throws ServletException {
        super.init();    //To change body of overridden methods use File | Settings | File Templates.

		employees = new ArrayList<Employee>();
        employees.add(new Employee("Пупкин Василий",new Date(),"Женат", "Директор"));
        employees.add(new Employee("Зайцев Иван", new Date(), "Не женат", "Разработчик"));
        employees.add(new Employee("Пузцов Пётр", new Date(), "В разводе", "Повар"));
        employees.add(new Employee("Молодец Александр", new Date(), "Женат", "Дизайнер"));
    }
}

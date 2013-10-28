package Sample;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Администратор
 * Date: 22.10.13
 * Time: 23:23
 * To change this template use File | Settings | File Templates.
 */
@WebServlet(name = "HRManager")
public class HRManager extends HttpServlet {

    protected List<Employee> Employees;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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
        request.getRequestDispatcher(target).forward(request, response);
    }

    @Override
    public void init() throws ServletException {
        super.init();    //To change body of overridden methods use File | Settings | File Templates.

        Employees = new ArrayList<Employee>();
        Employees.add(new Employee("Пупкин Василий",new Date(),"Женат", "Директор"));
        Employees.add(new Employee("Зайцев Иван",new Date(),"Не женат", "Разработчик"));
        Employees.add(new Employee("Пузцов Пётр",new Date(),"В разводе", "Повар"));
        Employees.add(new Employee("Молодец Александр",new Date(),"Женат", "Дизайнер"));
    }
}

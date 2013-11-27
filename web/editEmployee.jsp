<%@ page import="Sample.Employee" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%--
  Created by IntelliJ IDEA.
  User: Администратор
  Date: 22.10.13
  Time: 23:36
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style.css"/>
</head>
<body>
<h1>Изменить сотрудника</h1>
<form action = "edit" method = "post">
    <div class="datagrid"><table border = "0">
        <tbody>
        <tr>
            <% SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");%>
            <jsp:useBean id="employees" scope="request" type="java.util.List<Sample.Employee>"/>
            <%
                String name = "";
                String position = "";
                String birthdayDate = "";
                String enrollmentDate = "";
                String familyStatus = "";

                String idParam = request.getParameter("id");
                if (idParam == null) {

                } else {
                    Integer id = Integer.parseInt(idParam);
                    Employee employee = null;
                    for (Employee emp: employees) {
                        if (emp.getId() == id) {
                            employee = emp;
                            break;
                        }
                    }
                    if (employee != null) {
                        name = employee.getName();
                        familyStatus = employee.getFamilyStatus();
                        birthdayDate = dateFormat.format(employee.getBirthdayDate());
                        enrollmentDate = dateFormat.format(employee.getEnrollmentDate());
                        position = employee.getPosition();
                    }
                }
            %>
            <td>ФИО</td>
            <td>
                <input type = "text" name = "Name"
                       value = "<%=name%>"
                       size = "70"/>
            </td>
            <input type="hidden" name="id" value="<%=idParam%>">
        </tr>
        <tr>
            <td>Семейное положение</td>
            <td>
                <select name = "FamilyStatus"
                    value = "<%=familyStatus%>">
                    <option value = "Холост">Xолост/не замужем</option>
                    <option value = "Женат">Женат/Замужем</option>
                    <option value = "В разводе">В разводе</option>
                </select>
            </td>
        </tr>

        <tr>
            <td>Дата рождения</td>
            <td>
                <input type="date" name="BirthdayDate"
                       value = "<%=birthdayDate%>"/>
            </td>
        </tr>

        <tr>
            <td>Должность</td>
            <td>
                <input type="text" name="Position"
                       value = "<%=position%>"
                       size = "70"/>
            </td>
        </tr>

        <tr>
            <td>Дата приёма на работу</td>
            <td>
                <input type="date" name="EnrollmentDate"
                       value = "<%=enrollmentDate%>"/>
            </td>
        </tr>
        </tbody>
    </table></div>
    <input class="button" type = "submit" value = "Сохранить изменения"/>
    <input class="button" name="delete" type = "submit" value = "Удалить"/>

</form>
</body>
</html>
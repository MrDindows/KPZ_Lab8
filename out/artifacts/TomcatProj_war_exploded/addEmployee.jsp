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
    <title>Add employee</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style.css"/>
</head>

<body>
<h1>Добавить сотрудника</h1>
<form action = "add" method = "post">
    <div class="datagrid"><table border = "0">
        <thead>
        </thead>
        <tbody>
        <tr>
            <td>ФИО</td>
            <td>
                <input type = "text" name = "Name"
                       value = "<%=((request.getParameter("Name")!=null)?
                        request.getParameter("Name"):"Введите ФИО")%>"
                       size = "70"/>
            </td>
        </tr>
        <tr>
            <td>Семейное положение</td>
            <td>
                <select name = "FamilyStatus"
                        value = "<%=((request.getParameter("FamilyStatus")!=null)?
                        request.getParameter("FamilyStatus"):"")%>"
                        >
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
                       value = "<%=((request.getParameter("BirthdayDate")!=null)?
                        request.getParameter("BirthdayDate"):"")%>"
                        />
            </td>
        </tr>

        <tr>
            <td>Должность</td>
            <td>
                <input  type="text"
                        name="Position"
                        value = "<%=((request.getParameter("Position")!=null)?
                        request.getParameter("Position"):"Введите должность")%>"
                        size = "70"/>
            </td>
        </tr>

        <tr>
            <td>Дата приёма на работу</td>
            <td>
                <input type="date" name="EnrollmentDate"
                       value = "<%=((request.getParameter("EnrollmentDate")!=null)?
                        request.getParameter("EnrollmentDate"):"")%>"/>
            </td>
        </tr>
        </tbody>
    </table></div>
    <input class="button" type = "submit" value = "Добавить"/>

</form>
</body>
</html>
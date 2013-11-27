<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.text.SimpleDateFormat" %>


<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style.css"/>

<%--
  Created by IntelliJ IDEA.
  User: Администратор
  Date: 22.10.13
  Time: 23:35
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
    <title></title>
</head>
<body>

    <% SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");%>

    <jsp:useBean id="employees" scope="request" type="java.util.List<Sample.Employee>"/>
    <div class="datagrid"><table>
        <thead>
            <th>ФИО</th>
            <th>Дата рождения</th>
            <th>Семейное положение</th>
            <th>Дата приёма на работу</th>
            <th>Должность</th>
            <th>Редактировать</th>
        </thead>

        <tbody>
        <% int i = 0; %>
            <c:forEach var="person" items="${employees}">
                <tr class = <%=(i++%2==1)?"alt":""%>>
                    <jsp:useBean id="person" scope="page" type="Sample.Employee"/>
                    <td>${person.name}</td>
                    <td><%=dateFormat.format(person.getBirthdayDate())%></td>
                    <td>${person.familyStatus}</td>
                    <td><%=dateFormat.format(person.getEnrollmentDate())%></td>
                    <td>${person.position}</td>
                    <td><a href=<%="/Lab7/edit?id="+person.getId()%>>Изменить</a></td>
                </tr>
            </c:forEach>
        </tbody>
        <tfoot><tr class = <%=(i%2==1)?"alt":""%>>
            <td colspan="6">
                <div id="paging"><ul><li><a href="${pageContext.request.contextPath}/Lab7/add"><span>Добавить</span></a></li></ul></div>
            </td>
        </tr></tfoot>
    </table></div>
</body>
</html>
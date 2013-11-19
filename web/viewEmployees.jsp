<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Sample.Employee" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.text.SimpleDateFormat" %>


<link rel="stylesheet" type="text/css" href="style.css"/>

<%--
  Created by IntelliJ IDEA.
  User: Администратор
  Date: 22.10.13
  Time: 23:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
    <title></title>
</head>
<body>
    Path: <%=request.getAttribute("path")%> <br>
    Target: <%=request.getAttribute("target")%><br>

    <% SimpleDateFormat dateFormat = new SimpleDateFormat("dd/mm/yyyy");%>

    <jsp:useBean id="employees" scope="request" type="java.util.List<Sample.Employee>"/>
    <table border="1">
        <tr>
            <td><div class="column_caption">ФИО</div></td>
            <td><div class="column_caption">Дата рождения</div></td>
            <td><div class="column_caption">Семейное положение</div></td>
            <td><div class="column_caption">Дата приёма на работу</div></td>
            <td><div class="column_caption">Должность</div></td>
        </tr>
    <c:forEach var="person" items="${employees}">
        <tr>
            <jsp:useBean id="person" scope="page" type="Sample.Employee"/>
            <td>${person.name}</td>
            <td><%=dateFormat.format(person.getBirthdayDate())%></td>
            <td>${person.familyStatus}</td>
            <td><%=dateFormat.format(person.getEnrollmentDate())%></td>
            <td>${person.position}</td>
        </tr>
    </c:forEach>
    </table>
</body>
</html>
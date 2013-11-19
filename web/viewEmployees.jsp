<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="java.sun.com/jstl/core"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Sample.Employee" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>

<%--
  Created by IntelliJ IDEA.
  User: Администратор
  Date: 22.10.13
  Time: 23:35
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title></title>
</head>
<body>
    Path: <%=request.getAttribute("path")%> <br>
    Target: <%=request.getAttribute("target")%>   <br>
    <c:out value = "adasdas"/>
    <%
        ArrayList<Employee> employees = (ArrayList<Employee>) request.getAttribute("employees");
        if (employees == null)
        {
            out.println("FUCK");
        }
        else
        {
            for (Employee employee : employees)
            {
                out.println("LOL" + employee.Name);
            }
        }
    %>
    <c:forEach var="person" items="${pageScope.employees}">
        LAL
        <tr>
            <td>${person.Name}</td>
            <td>${person.FamilyStatus}</td>
            <td>${person.EnrollmentDate}</td>
        </tr>

    </c:forEach>
    <%
        // Create an ArrayList with test data
        ArrayList list = new ArrayList();
        Map author1 = new HashMap();
        author1.put("name", "A");
        author1.put("id", new Integer(1));
        list.add(author1);
        Map author2 = new HashMap();
        author2.put("name", "B");
        author2.put("id", new Integer(2));
        list.add(author2);
        Map author3 = new HashMap();
        author3.put("name", "C");
        author3.put("id", new Integer(3));
        list.add(author3);
        pageContext.setAttribute("authors", list);
    %>
    <br>
    Here are all authors matching your search critera:
    <table>
        <TH>Name</th>
        <TH>Id</th>
        <c:forEach items="${authors}" var="current">
            <tr>
                <td><c:out value="${current.name}" /><td>
                <td><c:out value="${current.id}" /><td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
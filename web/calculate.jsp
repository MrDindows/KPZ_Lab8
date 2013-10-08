<%--
  Created by IntelliJ IDEA.
  User: Администратор
  Date: 08.10.13
  Time: 22:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="style.css"/>
<html>
<head>
    <title></title>
</head>
<body>
    <form action="Lab6">
    A1 = <input type=number name=A1 style="width: 80px;">
    B1 = <input type=number name=B1 style="width: 80px;">
    C1 = <input type=number name=C1 style="width: 80px;">    <br>
    A2 = <input type=number name=A2 style="width: 80px;">
    B2 = <input type=number name=B2 style="width: 80px;">
    C2 = <input type=number name=C2 style="width: 80px;">    <br>
    <input type="submit" value="Рассчитать">
    </form>
    <%
        Object error = request.getAttribute("error");
        Object match = request.getAttribute("match");
        Object parallel = request.getAttribute("parallel");
        if (error!=null && error.equals(true))
        {
            out.println("<a class=\"error\">Введите корректные данные!</a>");
        }
        else if (match!=null && match.equals(true))
        {
            out.println("<a>Плоскости совпадают</a>");
        }
        else if (parallel!=null && parallel.equals(true))
        {
            out.println("<a>Плоскости параллельны</a>");
        }
        else
        {
            Object X = request.getAttribute("X");
            Object Y = request.getAttribute("Y");
            if (X!=null && Y!=null)
            {
                out.println("Прямая пересечения проходит через точку (" + X + ", " + Y + ", 0) " +
                        "и параллельна оси Z.<br>");
            }
        }

    %>
</body>
</html>
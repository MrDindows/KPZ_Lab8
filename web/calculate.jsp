<%--                                           ;
  Created by IntelliJ IDEA.
  User: Администратор
  Date: 08.10.13
  Time: 22:58
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="style.css"/>
<html>
<head>
    <title></title>
</head>
<body>
    <form action="Lab6">
        <label>
            A1 =
            <input type= number name= A1 style="width: 80px;">
        </label>
        <label>
            B1 =
            <input type= number name= B1 style="width: 80px;">
        </label>
        <label>
            C1 =
            <input type= number name= C1 style="width: 80px;">
        </label> <br>
        <label>
            A2 =
            <input type= number name= A2 style="width: 80px;">
        </label>
        <label>
            B2 =
            <input type= number name= B2 style="width: 80px;">
        </label>
        <label>
            C2 =
            <input type= number name= C2 style="width: 80px;">
        </label> <br>
    <input type="submit" value="Рассчитать">
    </form>
    <%
        Object error = request.getAttribute("error");
        Object match = request.getAttribute("match");
        Object parallel = request.getAttribute("parallel");
        if (error != null && error.equals(true)) {
            out.println("<a class=\"error\">Введите корректные данные!</a>");
        } else if (match != null && match.equals(true)) {
            out.println("<a>Плоскости совпадают</a>");
        } else {
            if (parallel != null && parallel.equals(true)) {
                out.println("<a>Плоскости параллельны</a>");
            } else {
                Object X = request.getAttribute("X");
                Object Y = request.getAttribute("Y");
                if (X != null && Y != null) {
                    out.println("Прямая пересечения проходит через точку (" + X + ", " + Y + ", 0) " +
                            "и параллельна оси Z.<br>");
                }
            }
        }

    %>
</body>
</html>
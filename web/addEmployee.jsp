<%--
  Created by IntelliJ IDEA.
  User: Администратор
  Date: 22.10.13
  Time: 23:36
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Plugin tester</title>
</head>

<body>
<h1>Добавить сотрудника</h1>
<form action = "servlet-parameters" method = "GET">
    <table border = "0">

        <tr>
            <td>ФИО</td>
            <td>
                <input type = "text" name = "Name"
                       value = "Введите ФИО" size = "70"/>
            </td>
        </tr>
        <tr>
            <td>Семейное положение</td>
            <td>
                <select name = "FamilyStatus">
                    <option value = "Холост">Xолост/не замужем</option>
                    <option value = "Женат">Женат/Замужем</option>
                    <option value = "В разводе">В разводе</option>
                </select>
            </td>
        </tr>


        <tr>
            <td>Должность</td>
            <td>
                <input type="text" name="Position"
                    value = "Введите должность" size = "70"/>
            </td>
        </tr>

        <tr>
            <td>Дата приёма на работу</td>
            <td>
                <input type="date" name="EnrollmentDate"/>
            </td>
        </tr>
        <tr>
            <td colspan = "2"><input type = "submit" value = "Start test"/></td>
        </tr>
    </table>
</form>
</body>
</html>
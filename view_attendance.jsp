<%-- 
    Document   : view_attendance
    Created on : 7 Oct, 2017, 6:45:37 PM
    Author     : Ayush Malik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/styles.css"/>
        <link rel="icon" type="image/gif" href="Favicon.ico"/>
        <title>View Attendance</title>
    </head>
    <body>
      <h1 align="center">Welcome</h1>
      <p align="center">Faculty:<c:out value="${param.tname}"></c:out></p>
      <p>Subject:<c:out value="${param.subject}"></c:out></p>
      <p>Date:<c:out value="${param.date}"></c:out></p>
      <p>Attendance Type:<c:out value='<%= request.getParameter("attendance_type").toUpperCase() %>'></c:out></p>
        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/attendance"
                           user="root" password="amalik"></sql:setDataSource>
      <c:choose>
          <c:when test="${param.attendance_type=='theory'}">
        <sql:query dataSource="${db}" var="rs">
            select theory_conduct from attendance_2 where  Date=? and Subject_id=?;
            <sql:param value="${param.date}"></sql:param>
            <sql:param value="${param.subject}"></sql:param>
        </sql:query>
      <c:forEach var="row" items="${rs.rows}">
          <c:set var="total" value="${row.theory_conduct}"></c:set>
      </c:forEach>
        <sql:query dataSource="${db}" var="rs1">
            select Roll_no,Name,theory_attend from attendance_1,student where Roll_no=Student_id and Date=? and Subject_id=?;
            <sql:param value="${param.date}"></sql:param>
            <sql:param value="${param.subject}"></sql:param>
        </sql:query>
            <p align="center">List of Students</p>
            <table align="center" border="1">
                <th>Roll Number</th>
                <th>Student Name</th>
                <th>Total(<c:out value="${total}"></c:out>)</th>
            <c:forEach var="row1" items="${rs1.rows}">
            <tr>
                <td><c:out value="${row1.Roll_no}"></c:out></td>
                <td><c:out value="${row1.Name}"></c:out></td>
                <td><c:out value="${row1.theory_attend}"></c:out></td>
            </tr>
            </c:forEach>
            </table>
          </c:when>
            <c:when test="${param.attendance_type=='practical'}">
                     <sql:query dataSource="${db}" var="rs">
            select prac_conduct from attendance_2 where  Date=? and Subject_id=?;
            <sql:param value="${param.date}"></sql:param>
            <sql:param value="${param.subject}"></sql:param>
        </sql:query>
      <c:forEach var="row" items="${rs.rows}">
          <c:set var="total" value="${row.prac_conduct}"></c:set>
      </c:forEach>
        <sql:query dataSource="${db}" var="rs1">
            select Roll_no,Name,prac_attend from attendance_1,student where Roll_no=Student_id and Date=? and Subject_id=?;
            <sql:param value="${param.date}"></sql:param>
            <sql:param value="${param.subject}"></sql:param>
        </sql:query>
            <p align="center">List of Students</p>
            <table align="center" border="1">
                <th>Roll Number</th>
                <th>Student Name</th>
                <th>Total(<c:out value="${total}"></c:out>)</th>
            <c:forEach var="row1" items="${rs1.rows}">
            <tr>
                <td><c:out value="${row1.Roll_no}"></c:out></td>
                <td><c:out value="${row1.Name}"></c:out></td>
                <td><c:out value="${row1.prac_attend}"></c:out></td>
            </tr>
            </c:forEach>
            </table>
                
            </c:when>
            <c:when test="${param.attendance_type=='tut'}">
                <sql:query dataSource="${db}" var="rs">
            select tut_conduct from attendance_2 where  Date=? and Subject_id=?;
            <sql:param value="${param.date}"></sql:param>
            <sql:param value="${param.subject}"></sql:param>
        </sql:query>
      <c:forEach var="row" items="${rs.rows}">
          <c:set var="total" value="${row.tut_conduct}"></c:set>
      </c:forEach>
        <sql:query dataSource="${db}" var="rs1">
            select Roll_no,Name,tut_attend from attendance_1,student where Roll_no=Student_id and Date=? and Subject_id=?;
            <sql:param value="${param.date}"></sql:param>
            <sql:param value="${param.subject}"></sql:param>
        </sql:query>
            <p align="center">List of Students</p>
            <table align="center" border="1">
                <th>Roll Number</th>
                <th>Student Name</th>
                <th>Total(<c:out value="${total}"></c:out>)</th>
            <c:forEach var="row1" items="${rs1.rows}">
            <tr>
                <td><c:out value="${row1.Roll_no}"></c:out></td>
                <td><c:out value="${row1.Name}"></c:out></td>
                <td><c:out value="${row1.tut_attend}"></c:out></td>
            </tr>
            </c:forEach>
            </table>
            </c:when>
       
      </c:choose>  
    </body>
</html>

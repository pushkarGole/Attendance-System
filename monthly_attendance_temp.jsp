<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Monthly Attendance</title>
        <link rel="stylesheet" type="text/css" href="css/styles.css">
        <link rel="icon" type="image/gif" href="Favicon.ico" />
    </head>
    <body>
       <form method="POST"  action="student_home.jsp">
        <h2>Monthly Attendance</h2>
       
        
        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" 
                           url="jdbc:mysql://localhost:3306/new_attendance" 
                           user="root" password="amalik"></sql:setDataSource> 
         
        <sql:query dataSource="${db}" var="results">
          select sum(a1.tut_attend) as tua,sum(a1.prac_attend) as pa,sum(a1.theory_attend) as tha,sum(a2.tut_conduct) as tuc,sum(a2.theory_conduct) as thc,sum(a2.prac_conduct) as pc from ((attendance_1 a1 JOIN attendance_2 a2 on a1.subject_id=a2.subject_id and a1.date=a2.date)) where student_id=? and a1.subject_id=? and month(a2.date)=? and year(a2.date)=?; 
           <sql:param value="${param.stroll_no}"></sql:param>
           <sql:param value="${param.subject}"></sql:param>
           <sql:param value="${param.month}"></sql:param>
           <sql:param value="${param.year}"></sql:param>
          
        </sql:query>
           
          <sql:query dataSource="${db}" var="sub_result">
              select name from subject where subject_id=?;
              <sql:param value="${param.subject}"></sql:param>
          </sql:query>
              <c:forEach var="j" items="${sub_result.rows}">
                  <c:set var="z" value="${j.name}"></c:set>
              </c:forEach>
        
              
              <c:forEach var="row" items="${results.rows}">
               <c:set var="tut_attend" value="${row.tua}"></c:set>
               <c:set var="prac_attend" value="${row.pa}"></c:set>  
               <c:set var="theory_attend" value="${row.tha}"></c:set>  
               <c:set var="tut_conduct" value="${row.tuc}"></c:set>  
               <c:set var="theory_conduct" value="${row.thc}"></c:set>  
               <c:set var="prac_conduct" value="${row.pc}"></c:set> 
             </c:forEach>
         
            
        <div style="padding:15px;margin-left:10px;margin-right:10px";>
        <table style="width:100%;border-spacing:10px">
            <tr>
                <td class="m1">Name:</td>    
                <td class="m2"><c:out value="${param.stname}"></c:out></td>
                <td class="m1">Roll Number:</td>
                <td class="m2"><c:out value="${param.stroll_no}"></c:out></td>
            </tr> 
            <tr>
                <td class="m1">Class:</td>
                <td class="m2"><c:out value="${param.stclass_name}"></c:out></td>
                <td class="m1">Semester:</td>
                <td class="m2"><c:out value="${param.stsemester}"></c:out></td>
            </tr>
            <tr>
                <td class="m1">Year of Admission:</td>
                <td class="m2"><c:out value="${param.styear_of_admission}"></c:out></td>
            </tr>
            <tr>
                <td class="m1">Subject Name</td>
                <td class="m2"><c:out value="${z}"></c:out></td>
                <td class="m1">Subject ID:</td>
                <td class="m2"><c:out value="${param.subject}"></c:out></td>
            </tr>
            <tr>
                <td class="m1">Month:</td>
                <td class="m2"><c:out value="${param.month}"></c:out></td>
                <td class="m1">Year:</td>
                <td class="m2"><c:out value="${param.year}"></c:out></td>
            </tr>            
        
          </table> 
        
         <table style="background-color: #ecf0f1;border:0px;padding:10px;border-radius:10px;" >
                <tr style="border:0px; border-radius:5px;margin-bottom:20px;">
                    <th style="text-align:center;padding:5px;font-size:17px;border:0px;background-color:pink;border-radius: 5px;">Type of Class</th>
                    <th style="text-align:center;padding:5px;font-size:17px;border:0px;border-radius: 5px;" colspan="30">Date</th>
                    <th style="text-align:center;padding:5px;font-size:17px;border:0px;background-color:burlywood;border-radius: 5px;">Total</th>
                </tr>
                <tr>
                   
                <th style="text-align:center;padding:5px;font-size:17px;border:0px;border-radius: 5px;" ></th>
                 <% for(int i=0;i<30;i++){ %>
                    <th style="text-align:center;padding:5px;font-size:17px;border:0px;background-color:white;border-radius: 5px;">20</th>
                <% } %>
                <th style="text-align:center;padding:5px;font-size:17px;border:0px;border-radius: 5px;" ></th>
                    
                </tr>
                
                <tr>
                    <td style="text-align: center;background-color: pink;"class="m2">Theory</td>
                    <% for(int i=0;i<30;i++){ %>
                    <td style="text-align: center;"class="m2" >2/4</td>
                    <% } %>
                
                    <td style="text-align: center;background-color:burlywood;"class="m2">100%</td>
                </tr>  
                    
                <tr>
                    <td style="text-align: center;background-color: pink;"class="m2">Practical</td>
                    <% for(int i=0;i<30;i++){ %>
                    <td style="text-align: center;"class="m2" >2/4</td>
                    <% } %>
                
                    <td style="text-align: center;background-color:burlywood;"class="m2">100%</td>
                </tr>
                <tr>
                    <td style="text-align: center;background-color: pink;"class="m2">Tutorials</td>
                    <% for(int i=0;i<30;i++){ %>
                    <td style="text-align: center;"class="m2" >2/4</td>
                    <% } %>
                
                    <td style="text-align: center;background-color:burlywood;"class="m2">100%</td>
                </tr>
            </table>
                <input type="hidden" value="${param.college}" name="college"/>
       </form>        
        </body>
</html>

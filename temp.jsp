    
        <div style="padding:15px;margin-left:200px;margin-right:200px";>
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
                <td class="m1">Section:</td>
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
        
         <table style="background-color: #ecf0f1;border:0px;padding:10px;border-radius:10px;margin-left:80px;" >
                
             
                <tr style="border:0px; border-radius:5px;margin-bottom:20px;">
                    <th align="center" style="width:px;"></th>
                    <th align="center" style="width:250px;">Theory Attendance</th>
                    <th align="center" style="width:250px">Practical Attendance</th>
                    <th align="center" style="width:250px">Tutorial Attendance</th>
                    
                    
                </tr>
                    
                
                <tr>    
                       <td><c:out value="${z}"></c:out></td>
                        <td style="text-align: center;"class="m2"><c:out value="${theory_attend}"></c:out>/<c:out value="${theory_conduct}"></c:out></td>
                        <td style="text-align: center;"class="m2"><c:out value="${prac_attend}"></c:out>/<c:out value="${prac_conduct}"></c:out></td>
                        <td style="text-align: center;"class="m2"><c:out value="${tut_attend}"></c:out>/<c:out value="${tut_conduct}"></c:out></td>
                </tr>
                 <c:choose>
                    <c:when test="${theory_conduct>0}">
                        <td></td>
                        <td style="text-align:center;width:250px;background-color:pink ;"class="m2"><c:out value="${(theory_attend/theory_conduct)*100}"></c:out>%</td>
                    </c:when>
                    <c:otherwise>
                        <td></td>
                    <td style="text-align:center;width:250px;background-color:pink ;"class="m2">Not Applicable</td>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${prac_conduct>0}">
                    <td style="text-align:center;width:250px;background-color:pink ;"class="m2"><c:out value="${(prac_attend/prac_conduct)*100}"></c:out>%</td>
                    </c:when>
                    <c:otherwise>
                    <td style="text-align:center;width:250px;background-color:pink ;"class="m2">Not Applicable</td>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${tut_conduct>0}">
                    <td style="text-align:center;width:250px;background-color:pink ;"class="m2"><c:out value="${(tut_attend/tut_conduct)*100}"></c:out>%</td>
                    </c:when>
                    <c:otherwise>
                   <td style="text-align:center;width:250px;background-color:pink ;"class="m2">Not Applicable</td>
                   </c:otherwise>
                </c:choose>
            
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
             </table>
        
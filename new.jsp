<%-- 
    Document   : new
    Created on : Oct 29, 2017, 2:22:50 PM
    Author     : pushkar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.net.*" %>
<%@page  import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String mac;
                                    String Datentime;
                                    StringBuilder sb=new StringBuilder();
                                    byte []hw=NetworkInterface.getByInetAddress(InetAddress.getLocalHost()).getHardwareAddress();
                                    for(int i=0;i<hw.length;i++)
                                        sb.append(String.format("%02X%s", hw[i], (i < hw.length - 1) ? "-" : ""));
                                    mac=sb.toString();
                                    Datentime=new java.sql.Date(System.currentTimeMillis())+" "+new java.sql.Time(System.currentTimeMillis());
                                    request.setAttribute("mac",mac);
                                    request.setAttribute("datentime",Datentime);
                                    response.sendRedirect("newjsp.jsp");
            %>
            
    </body>
</html>

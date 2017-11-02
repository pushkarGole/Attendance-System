<%-- 
    Document   : newjsp
    Created on : Oct 28, 2017, 11:00:22 PM
    Author     : pushkar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.net.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            InetAddress it=InetAddress.getByName(request.getRemoteAddr());
            out.print(it.toString());
            StringBuilder sb=new StringBuilder();
            String mac;
            NetworkInterface ni=NetworkInterface.getByInetAddress(it);
            byte []hw;
            if(ni==null)
            {
                out.print("Error 1");
            }
            else
            {
                hw=ni.getHardwareAddress();
                if(hw==null)
                    out.print("Error 2");
                else
                    
            for(int i=0;i<hw.length;i++)
                                        sb.append(String.format("%02X%s", hw[i], (i < hw.length - 1) ? "-" : ""));
                                    mac=sb.toString();
                                    out.print(mac);
            }
            out.print(request.getRemoteAddr());
            
            %>
    </body>
</html>

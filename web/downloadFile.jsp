<%@page import="java.io.PrintWriter"%>
<%
            
            response.setContentType("application/jpg");
            response.setContentLength(10);
            PrintWriter o=response.getWriter();
            o.print("hello Hai");
 %>
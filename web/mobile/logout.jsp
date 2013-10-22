<%-- 
    Document   : logout
    Created on : 6 Mar, 2013, 1:42:14 PM
    Author     : Jasmi
--%>
<%@page import="net.sf.json.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%
        session.invalidate();
        JSONObject JsonOutput = new JSONObject();
        JsonOutput.accumulate("response", "logout_success");
        out.print(JsonOutput);
        %>

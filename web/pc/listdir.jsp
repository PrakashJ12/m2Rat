<%-- 
    Document   : listdir
    Created on : 16 Mar, 2013, 5:20:18 AM
    Author     : Prakash
--%>
<%@page import="vision.testcase.DatabaseCon"%>
<%@page import="net.sf.json.JSON"%>
<%@page import="java.sql.*"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String data = request.getParameter("data").trim();
    JSONObject dataJson = JSONObject.fromObject(data.trim());
    
    
    
%>
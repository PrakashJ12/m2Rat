<%-- 
    Document   : getoutput
    Created on : 11 Mar, 2013, 2:36:33 PM
    Author     : Prakash
--%>

<%@page import="net.sf.json.JSONObject"%>
<%@page import="vision.testcase.DatabaseCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String data = request.getParameter("data").trim();
JSONObject dataJSONObject =JSONObject.fromObject(data);
String cmd_id = dataJSONObject.getString("cmd_id");
DatabaseCon db = new DatabaseCon();
String queryString = "UPDATE `commands` SET cmd_send_state = '1', cmd_ack = '1', cmd_exec = '1' WHERE cmd_id = '"+cmd_id+"'";
db.update(queryString);
%>
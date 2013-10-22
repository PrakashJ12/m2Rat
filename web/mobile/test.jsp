<%@page import="net.sf.json.JSON"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%
        JSONObject jSONObject=new JSONObject();

        jSONObject.accumulate("username", "this is a user name");
        jSONObject.accumulate("password", "visointuxeeee");
        jSONObject.accumulate("mobile", "its_value3");
        jSONObject.accumulate("address", "its_value4");
        out.print(jSONObject);
%>
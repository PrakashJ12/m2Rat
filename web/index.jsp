<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <%
        JSONObject jSONObject=new JSONObject();
        jSONObject.accumulate("firstkey", "its_value");
        jSONObject.accumulate("username", "visointuxeeee");
        jSONObject.accumulate("firstkey3", "its_value3");
        jSONObject.accumulate("firstkey4", "its_value4");
        out.print(jSONObject);
        Object o=jSONObject.get("firstkey");
        //out.println(o);
        JSONArray jSONArray=new JSONArray();
        jSONArray.add("18");
        jSONArray.add("28");
        jSONArray.add("3558");
        //out.println((jSONArray));
        
        %>
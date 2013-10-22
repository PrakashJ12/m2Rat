<%-- 
    Document   : login
    Created on : 6 Mar, 2013, 12:17:10 PM
    Author     : Jasmi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="vision.testcase.DatabaseCon"%>
<%@page import="net.sf.json.JSON"%>
<%@page import="java.sql.*"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>

        <%
        JSONObject jSONObject=new JSONObject();

       // jSONObject.accumulate("firstkey", "its_value");
        // jSONObject.accumulate("username", "visointuxeeee");
        // jSONObject.accumulate("firstkey3", "its_value3");
        // jSONObject.accumulate("firstkey4", "its_value4");
        //out.print(jSONObject);
        
//        String s =request.getParameter("data");
//        JSONObject login=JSONObject.fromObject(s);
//        String username=login.get("username").toString();
//        String password=login.get("password").toString();
        String username=request.getParameter("username").toString();
        String password=request.getParameter("password").toString();
        String loginQuery = "SELECT * FROM userdata WHERE u_name = '"+username+"' AND password = '"+password+"'; ";
        DatabaseCon userLogin=new DatabaseCon();
        ResultSet loginoutput=userLogin.getResult(loginQuery);
        JSONObject JsonOutput = new JSONObject();
        if(loginoutput.next()) {
            session.setAttribute("u_name", username);
            
//            out.println("login_success");
            JsonOutput.accumulate("response", "login_success");
        } else {
//            out.println("login_fail");
            JsonOutput.accumulate("response", "login_fail");
        }
        out.print(JsonOutput);
        
        
%>
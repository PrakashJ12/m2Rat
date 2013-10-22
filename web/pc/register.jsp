<%@page import="vision.testcase.DatabaseCon"%>
<%@page import="net.sf.json.JSON"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <%
        JSONObject jSONObject=new JSONObject();

        jSONObject.accumulate("firstkey", "its_value");
        jSONObject.accumulate("username", "visointuxeeee");
        jSONObject.accumulate("firstkey3", "its_value3");
        jSONObject.accumulate("firstkey4", "its_value4");
        //out.print(jSONObject);
        String s =request.getParameter("register");
        JSONObject jsono=JSONObject.fromObject(s);
        String username=jsono.get("username").toString();
        String password=jsono.get("password").toString();
        String mobile=jsono.get("mobile").toString();
        String email=jsono.get("email").toString();
        
        String newUserQuery = "INSERT INTO `remotecontrol`.`userdata` (`u_name`, `password`, `mobile`, `email`, `registeredDate`) VALUES ('"+username+"', '"+password+"', '"+mobile+"', '"+email+"', CURRENT_TIMESTAMP);";
        DatabaseCon insertUser=new DatabaseCon();
               int output = insertUser.update(newUserQuery);
                if(output==1)
                                       {
        out.println(username+" added to users list");
        
               }
        else
                       {
                   out.println("Inserting user failed");
        }
        %>
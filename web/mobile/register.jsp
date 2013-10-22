<%@page import="vision.testcase.DatabaseCon"%>
<%@page import="net.sf.json.JSON"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%
//        JSONObject jSONObject=new JSONObject();
//        String s =request.getParameter("register");
//        JSONObject jsono=JSONObject.fromObject(s.trim());
//        String username=jsono.get("username").toString();
//        String password=jsono.get("password").toString();
//        String mobile=jsono.get("mobile").toString();
//        String email=jsono.get("email").toString();
        String username = request.getParameter("user_id");
     
//        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String mobile= request.getParameter("mobile");
        String email = request.getParameter("email");
         
        String newUserQuery = "INSERT INTO `remotecontrol`.`userdata` (`u_name`, `password`, `mobile`, `email`, `registeredDate`) VALUES ('"+username+"', '"+password+"', '"+mobile+"', '"+email+"', CURRENT_TIMESTAMP);";
        DatabaseCon insertUser=new DatabaseCon();
               int output = insertUser.update(newUserQuery);
                if(output==1)
                                       {
        out.print("success");
        System.out.println("register success");
               }
        else
                       {
                   out.print("failed");
                    System.out.println("register failed");
        }
        %>
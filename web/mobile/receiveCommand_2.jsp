<%-- 
    Document   : receiveCommand
    Created on : 6 Mar, 2013, 1:43:36 PM
    Author     : Jasmi
    send command as " ?command= " parameter
--%>

<%@page import="vision.testcase.DatabaseCon"%>
<%@page import="systemcontrol.android.Users"%>
<%@page import="java.sql.*"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%
        //out.print(jSONObject);
        String cmdUser;
        String s =request.getParameter("command"); //read command
        JSONObject jsono=JSONObject.fromObject(s); //conver the string to json object
        String cmdtype=jsono.get("command").toString(); //extract data from the json object
        cmdUser=jsono.get("username").toString();
        
       //cmdUser = session.getAttribute("u_name").toString();
        String newUserCmd = "INSERT INTO `remotecontrol`.`commands` (`cmd_time`, `cmd_type`, `cmd_user`, `cmd_send_state`, `cmd_ack`, `cmd_exec`) VALUES (CURRENT_TIMESTAMP, '"+cmdtype+"', '"+cmdUser+"', '0', '0', '3');";
        DatabaseCon insertUser=new DatabaseCon();
               int output = insertUser.update(newUserCmd);
                if(output==1)
              {
        //out.println("cmd_accepted");
        
        String newCmdQuery = "SELECT * FROM `commands` WHERE cmd_user = '"+cmdUser+"' AND cmd_send_state = '0';";
        DatabaseCon userLogin=new DatabaseCon();
        ResultSet newCmd=userLogin.getResult(newCmdQuery);
        if(newCmd.last())
                       {
        JSONObject cmdJson = new JSONObject();
        cmdJson.accumulate("cmd_id", newCmd.getString("cmd_id"));
        out.print(cmdJson);
        
               }
        else
             {
                   out.println("cmd_id_error");
             }
          }
        else
             {
                   out.println("cmd_insert_error");
        }
       
        %>
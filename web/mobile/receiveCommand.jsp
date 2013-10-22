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
//        String cmdUser;
//        String s =request.getParameter("command"); //read command
//        JSONObject jsono=JSONObject.fromObject(s); //conver the string to json object
//        String cmdtype=jsono.get("command").toString(); //extract data from the json object
//        cmdUser=jsono.get("username").toString();
        String cmdtype=request.getParameter("cmd_type");
        String cmdUser=request.getParameter("cmd_user");
        
        String cmd_extra1=null, cmd_extra2=null;
        cmd_extra1 = request.getParameter("cmd_extra1");
        cmd_extra2 = request.getParameter("cmd_extra2");
//        System.out.print(cmd_extra1+cmd_extra2);
        
       //cmdUser = session.getAttribute("u_name").toString();
        String newUserCmd = "INSERT INTO `remotecontrol`.`commands` (`cmd_time`, `cmd_type`, `cmd_user`,`cmd_extra1`, `cmd_extra2`, `cmd_send_state`, `cmd_ack`, `cmd_exec`) VALUES (CURRENT_TIMESTAMP, '"+cmdtype+"', '"+cmdUser+"','"+cmd_extra1+"', '"+cmd_extra2+"', '0', '0', '3');";
        System.out.print(newUserCmd);
        DatabaseCon insertUser=new DatabaseCon();
               int output = insertUser.update(newUserCmd);
                if(output==1)
              {
//        out.println("cmd_accepted");
        
        String newCmdQuery = "SELECT * FROM `commands` WHERE cmd_user = '"+cmdUser+"' AND cmd_send_state = '0';";
        DatabaseCon userLogin=new DatabaseCon();
        ResultSet newCmd=userLogin.getResult(newCmdQuery);
        if(newCmd.next())
                       {
                           newCmd.last();
        JSONObject cmdJson = new JSONObject();
        System.out.print(newCmd.toString());
        String cmd_id1 = newCmd.getString("cmd_id");
        
        cmdJson.accumulate("cmd_id", cmd_id1);
//        cmdJson.accumulate("cmd_id", cmdUser);
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
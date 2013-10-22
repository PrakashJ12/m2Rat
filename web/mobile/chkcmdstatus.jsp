<%-- 
    Document   : chkcmdstatus
    Created on : 11 Mar, 2013, 12:04:57 PM
    Author     : Prakash
--%>
<%@page import="vision.testcase.DatabaseCon"%>
<%@page import="systemcontrol.android.Users"%>
<%@page import="java.sql.*"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
//String data=request.getParameter("cmd_id");
//JSONObject jsonOutput= new JSONObject();
//JSONObject requestJson = JSONObject.fromObject(data);
//String cmd_id=requestJson.get("cmd_id").toString();
String cmd_id=request.getParameter("cmd_id");
String username=request.getParameter("username");
String sqlQuery="SELECT * FROM `commands` WHERE cmd_id = '"+cmd_id+"';";
DatabaseCon statusCheckQuery=new DatabaseCon();
ResultSet statusCheck=statusCheckQuery.getResult(sqlQuery);
JSONObject jsonOutput=new JSONObject();
if(!statusCheck.next())
{
//    out.print("invalid_command_id");
    jsonOutput.accumulate("response", "error-invalid_command_id");
    
}
else
{   String cmd_extra_id = statusCheck.getString("cmd_extra_id");
    String cmd_result = statusCheck.getString("cmd_result");
    String cmd_send_state=statusCheck.getString("cmd_send_state");
    String cmd_exec=statusCheck.getString("cmd_exec");
    if(cmd_send_state.contains("0"))
    {
//        out.print("pc_offline");
        jsonOutput.accumulate("response", "error-pc_offline");
    }
    else if(cmd_exec.contains("0"))
    {
//        out.print("execution_error");
        jsonOutput.accumulate("response", "execution_error");
    }
    else if(cmd_exec.contains("1"))
    {
//        out.print("execution_success");
        jsonOutput.accumulate("response", "execution_success");
        jsonOutput.accumulate("cmd_extra_id", cmd_extra_id);
        jsonOutput.accumulate("cmd_result", cmd_result);
        
        String ackUpdate="UPDATE `commands` SET cmd_ack = '1' WHERE cmd_id = '"+cmd_id+"';";
//        DatabaseCon ackUpdateQuery=new DatabaseCon();
        int ackUpdateResult=statusCheckQuery.update(ackUpdate);
        if(ackUpdateResult<1)
        {
            System.out.println("DB_update_error");
        }
            
    }
    else
    {
//    out.print("unknown_error");    
    jsonOutput.accumulate("response", "unknown_error");
    }
}  
out.print(jsonOutput);
%>
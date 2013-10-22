<%@page import="vision.testcase.DatabaseCon"%>
<%@page import="vision.testcase.JsonHandler"%>
<%@page import="systemcontrol.android.Users"%>
<%@page import="java.sql.*"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%
            //String cmd;
            
        String currentUser;
        
          //String command;
         //currentUser = session.getAttribute("u_id").toString();
         //currentUser = request.getParameter("username");
        
        JsonHandler jsonHandler=new JsonHandler();
        JSONObject requestJson=jsonHandler.getJsonRequest(request);
        currentUser=requestJson.getString("user_id");
//        out.print(currentUser);
        String newCmdQuery = "SELECT * FROM `commands` WHERE cmd_user = '"+currentUser+"' AND cmd_send_state = '0';";
        DatabaseCon userLogin=new DatabaseCon();
        ResultSet newCmd=userLogin.getResult(newCmdQuery);
        
        JSONObject cmdJson = new JSONObject();
        if(newCmd.next())
                       {        
        cmdJson.accumulate("cmd_id", newCmd.getString("cmd_id") );
        cmdJson.accumulate("cmd_type", newCmd.getString("cmd_type"));
        cmdJson.accumulate("cmd_extra1", newCmd.getString("cmd_extra1"));
        cmdJson.accumulate("cmd_extra2", newCmd.getString("cmd_extra2"));
        
        String setSendStat = "UPDATE `commands` SET cmd_send_state = '1' WHERE cmd_id = '"+newCmd.getString("cmd_id")+"' AND cmd_user = '"+currentUser+"'";
        DatabaseCon insertUser=new DatabaseCon();
        insertUser.update(setSendStat);
        }
        else{
            cmdJson.accumulate("cmd_type", "no_commands");
        }
        
        out.print(cmdJson);
        
        
     /*   String s =request.getParameter("command"); //read command
        JSONObject jsono=JSONObject.fromObject(s); //conver the string to json object
        String cmdtype=jsono.get("command").toString(); //extract data from the json object
        cmd=jsono.get("username").toString();
        
       //cmdUser = session.getAttribute("u_name").toString();
        JSONObject jSONObject=new JSONObject();

        jSONObject.accumulate("firstkey", "its_value");
        jSONObject.accumulate("username", "visointuxeeee");
        jSONObject.accumulate("firstkey3", "its_value3");
        jSONObject.accumulate("firstkey4", "its_value4");
        //out.print(jSONObject);
        
        String command=jsono.get("command").toString();
        */
        



        %>
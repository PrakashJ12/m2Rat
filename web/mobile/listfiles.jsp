<%-- 
    Document   : listfiles
    Created on : 16 Mar, 2013, 10:11:20 AM
    Author     : Prakash
--%>

<%@page import="vision.testcase.JsonHandler"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String path = "C:\\Users\\Prakash\\Desktop";
    String requestPath = null;
    requestPath = request.getParameter("path");
    if(requestPath!=null)
    {
       path=requestPath;
//       out.print(path);
    }
    File file=new File(path);
JSONObject fileListJson = new JSONObject();
        File[] listFiles = file.listFiles();
        for(int i=0; i<listFiles.length; i++) {
//            System.out.println("is a directory"+listFiles[i].isDirectory());
//            System.out.println("name "+listFiles[i].getName());
//            System.out.println("length "+listFiles[i].length());
            JSONObject fileJson = new JSONObject();
            String name = "name";
            String isDirectory = "isdirectory";
            String fileLength = "filelength";
            
            fileJson.accumulate(name, listFiles[i].getName());
            fileJson.accumulate(isDirectory, listFiles[i].isDirectory());
            fileJson.accumulate(fileLength, listFiles[i].length());
            
            
            fileListJson.accumulate(""+i, fileJson);
            
        }
        fileListJson.accumulate("path", path);
        out.print(fileListJson);
       
%>
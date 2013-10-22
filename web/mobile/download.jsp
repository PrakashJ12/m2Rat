<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="vision.testcase.DatabaseCon"%>
<%@page import="net.sf.json.JSON"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%
    
    
  String filename = "screenshot.png";
  String filepath = "C:\\Users\\Prakash\\Desktop\\"; 
  response.setContentType("image/png"); 
  response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\""); 
  System.out.println(response.getHeaderNames().toString());
  InputStream fileInputStream = null ;
  String file_id = request.getParameter("file_id");
  String DbQuery="SELECT * FROM `filestore` WHERE file_id = '"+file_id+"';";
  DatabaseCon FileDBQuery = new DatabaseCon();
  ResultSet fileQuery = FileDBQuery.getResult(DbQuery);
  byte[] filebyte = null;
  if(fileQuery.next())
  {
    fileInputStream =  fileQuery.getBinaryStream("file_content");
//      filebyte = fileQuery.getBytes("file_content");
  }
//  FileOutputStream fileopStream = new FileOutputStream(new File(filepath + filename));
//fileopStream.write(filebyte);
  //  
//    File testFile = fileQuery.getBinaryStream("file_content");
  ServletOutputStream outStream = response.getOutputStream();
  
  int i; 
  while ((i=fileInputStream.read()) != -1) {
//    out.write(i); 
      outStream.write(i);
  }
  fileInputStream.close(); 
//  fileopStream.close();
%> 


<%--
<%  
  String filename = "sooraj.txt"; 
  String filepath = "C:\\Users\\Jasmi\\Desktop\\"; 
  response.setContentType("APPLICATION/OCTET-STREAM"); 
  response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\""); 

  java.io.FileInputStream fileInputStream = new java.io.FileInputStream(filepath + filename);
		  
  int i; 
  while ((i=fileInputStream.read()) != -1) {
    out.write(i); 
  } 
  fileInputStream.close(); 
%>
--%>
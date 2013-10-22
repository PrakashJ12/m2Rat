<%  
    
//  String filename = "sooraj.txt";
//    String filename = request.getParameter("file_name"); 
//  String filepath = "C:\\Users\\Jasmi\\Desktop\\"; 
//  String filepath = request.getParameter("cmd_file_path"); 
  String filepath = request.getHeader("cmd_file_path");
  System.out.println("FilePath: "+filepath);
  String filename = request.getHeader("file_name");
  System.out.print("FileName: "+filename);
  filename=filename.toUpperCase();
  if (filename.endsWith("JPG")) {
                            response.setContentType("image/jpeg");
                        }else if (filename.endsWith("JPEG")) {
                            response.setContentType("image/gif");
                        }else if (filename.endsWith("PNG")) {
                            response.setContentType("image/png");
                        }else if (filename.endsWith("GIF")) {
                            response.setContentType("image/gif");
                        } else if (filename.endsWith("PDF")) {
                            response.setContentType("application/pdf");
//                            response.setHeader("Content-Disposition", "inline; filename=\"" + filename + "\"");
                        } else if (filename.endsWith("DOC")) {
                            response.setContentType("application/msword");
//                            response.setHeader("Content-Disposition", "inline; filename=\"" + filename + "\"");
                        }else if (filename.endsWith("DOCX")) {
                            response.setContentType("application/msword");
//                            response.setHeader("Content-Disposition", "inline; filename=\"" + filename + "\"");
                        } else if (filename.endsWith("HTML")) {
                            response.setContentType("text/html");
                        } else if (filename.endsWith("ZIP")) {
                            response.setContentType("application/zip");
//                            response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
                        } else{
                            response.setContentType("APPLICATION/OCTET-STREAM");
                        }
                        
//  response.setContentType("APPLICATION/OCTET-STREAM");
//  response.setContentType("image/jpeg");
  response.setHeader("Content-Disposition","attachment;filename=\"" + filename + "\""); 
  

//  java.io.FileInputStream fileInputStream = new java.io.FileInputStream(filepath + filename);
  java.io.FileInputStream fileInputStream = new java.io.FileInputStream(filepath);
    ServletOutputStream outStream = response.getOutputStream();
    
  
  int i; 
  while ((i=fileInputStream.read()) != -1) {
//    out.write(i); 
      outStream.write(i);
  }
  fileInputStream.close();		  
//  int i; 
//  while ((i=fileInputStream.read()) != -1) {
//    out.write(i); 
//  } 
//  fileInputStream.close(); 
%> 
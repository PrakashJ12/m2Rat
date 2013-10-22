

<%@page import="java.sql.*"%>
<%@page import="vision.testcase.DatabaseCon"%>
<%@page import="javax.print.DocFlavor.STRING"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>



<%-- <%@page import="org.apache.commons.io.*" %> --%>
<%@page import="org.apache.commons.io.*"%>

<%@page import="org.apache.commons.fileupload.FileUploadException"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            if (!isMultipart) {
            } else {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List items = null;
                try {
                    items = upload.parseRequest(request);
                } catch (FileUploadException e) {
                    e.printStackTrace();
                }
                Iterator itr = items.iterator();
               
                JSONObject responseJson = new JSONObject();
                while (itr.hasNext()) {
                    FileItem item = (FileItem) itr.next();
                    if (item.isFormField()) {
                        String name = item.getFieldName();
                        String value = item.getString();
                        System.out.println("Parameters " + name + " value " + value);
                        
                        responseJson.accumulate(name, value);
                        
 
                    } else {
                        try {
 /*                           String itemName = item.getName();
                            File root=File.listRoots()[0];
                            File f = new File(root.getAbsolutePath()+itemName);
                            f.setWritable(true);
                            f.setReadable(true);
                            item.write(f);
  */
                            
                            String filename = FilenameUtils.getName(item.getName());

				InputStream filecontent = item.getInputStream();

				byte[] b = new byte[filecontent.available()];
				filecontent.read(b);
				FileOutputStream fos = new FileOutputStream(
						"C:\\Users\\Jasmi\\Desktop\\Out" + filename);
				fos.write(b);
				fos.close();
                                
                                
                                %>                                
                                <jsp:useBean id="fileupload" class="vision.testcase.DatabaseCon"/>
                                <%
                                
                                String INSERT_PICTURE = "INSERT INTO `remotecontrol`.`filestore` (file_user, file_cmd_id, file_name, file_path, file_type, file_content) values(?,?,?,?,?,?);";
                      PreparedStatement ps = null;
                    

                      //File file = new File("myPhoto.png");
                         File in=new File("C:\\Users\\Jasmi\\Desktop\\Out" + filename);
                      FileInputStream fis = new FileInputStream(in);
                      
                       ps = fileupload.con.prepareStatement(INSERT_PICTURE);
                      ps.setString(1, "file_user");
                      ps.setInt(2, 130);
                      ps.setString(3, "filename");
                      ps.setString(4, "file_path");
                      ps.setString(5, "file_type");
                      ps.setBinaryStream(6, fis, (int) in.length());
                      int check=  ps.executeUpdate();

  
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }
                System.out.print(responseJson);
                response.addHeader("response", responseJson.toString());
                
                
//                Collection<String> headernames = response.getHeaderNames();
//                System.out.print(headernames.toString());
            }
        %>
        
<%--        String fieldname = item.getFieldName();

				String filename = FilenameUtils.getName(item.getName());

				InputStream filecontent = item.getInputStream();

				byte[] b = new byte[filecontent.available()];
				filecontent.read(b);
				FileOutputStream fos = new FileOutputStream(
						"C:\\Users\\Prakash\\Desktop\\Out" + filename);
				fos.write(b);
				fos.close();
				// ... (do your job here)
--%>
<%--
	try {
		String username = "";
		List<FileItem> items = new ServletFileUpload(
				new DiskFileItemFactory()).parseRequest(request);
		for (FileItem item : items) {
			if (item.isFormField()) {
				// Process regular form field (input type="text|radio|checkbox|etc", select, etc).
				String fieldname = item.getFieldName();
				String fieldvalue = item.getString();

				if (fieldname.equals("vsrd")) {
					username = fieldvalue;
				}

				// ... (do your job here)
			} else {
				// Process form file field (input type="file").
				String fieldname = item.getFieldName();

				String filename = FilenameUtils.getName(item.getName());

				InputStream filecontent = item.getInputStream();

				byte[] b = new byte[filecontent.available()];
				filecontent.read(b);
				FileOutputStream fos = new FileOutputStream(
						"C:\\Users\\Prakash\\Desktop\\Out" + filename);
				fos.write(b);
				fos.close();
				// ... (do your job here)
                                
			}
		}
	} catch (FileUploadException e) {
		throw new ServletException("Cannot parse multipart request.", e);
	}
--%>

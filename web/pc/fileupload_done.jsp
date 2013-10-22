

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
                JSONObject response_1 = new JSONObject();
                while (itr.hasNext()) {
                    FileItem item = (FileItem) itr.next();
                    if (item.isFormField()) {
                        String name = item.getFieldName();
                        String value = item.getString();
                        System.out.println("Parameters " + name + " value " + value);
                        
                        response_1.accumulate(name, value);
                        
 
                    } else {
                        try {
//                            String itemName = item.getName();
////                            File root=File.listRoots()[0];
////                            File f = new File(root.getAbsolutePath()+itemName);
//                            f.setWritable(true);
//                            f.setReadable(true);
//                            item.write(f);
                            String filename = FilenameUtils.getName(item.getName());

				InputStream filecontent = item.getInputStream();

				byte[] b = new byte[filecontent.available()];
				filecontent.read(b);
				FileOutputStream fos = new FileOutputStream(
						"C:\\Users\\Prakash\\Desktop\\Out" + filename);
				fos.write(b);
				fos.close();
 
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }
                System.out.print(response_1);
                response.addHeader("response", response_1.toString());
                
                
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

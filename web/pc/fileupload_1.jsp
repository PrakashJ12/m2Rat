

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
						"C:\\Users\\Jasmi\\Desktop\\Out" + filename);
				fos.write(b);
				fos.close();
				// ... (do your job here)
			}
		}
	} catch (FileUploadException e) {
		throw new ServletException("Cannot parse multipart request.", e);
	}
%>
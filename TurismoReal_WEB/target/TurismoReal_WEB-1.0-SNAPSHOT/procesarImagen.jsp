<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.*" %>
<%@ page import="java.io.*" %>
<%
        FileItemFactory file_factory = new DiskFileItemFactory();
        ServletFileUpload servlet_up = new ServletFileUpload(file_factory);
        List items = servlet_up.parseRequest(request);
        String img="";
        for(int i=0;i<items.size();i++){
            FileItem item = (FileItem) items.get(0);
            if (!item.isFormField()){
		File archivo_server = new File
                        ("D:\\PROYECTO\\PTF-TURISMO-REAL-WEB\\TurismoReal_WEB\\src\\main\\webapp\\asset\\img\\"+item.getName());
        		try{
                 item.write(archivo_server);
                }catch(Exception e){}
                img=item.getName();
            }
        }
%>
<jsp:forward page="homeFuncionario.jsp">
    <jsp:param name="img" value="<%=img%>"></jsp:param>
</jsp:forward>

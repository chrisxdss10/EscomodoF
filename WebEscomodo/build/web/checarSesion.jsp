<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession();

    String jsonE = "";
    
    if(sesion.getAttribute("Mail") == null){
        jsonE = "{\"mail\": \"0\", \"tipo\": \"0\"}";
        
    }
    else{
    	String mail = sesion.getAttribute("Mail").toString();
    	String tipo = sesion.getAttribute("Tipo").toString();

    	jsonE = "{\"mail\": \""+ mail +"\", \"tipo\": \""+ tipo +"\"}";
    }

    out.print(jsonE);
    out.flush();
%>

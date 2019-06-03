<%-- 
    Document   : calificarpedido
    Created on : 31/05/2019, 10:30:05 PM
    Author     : Yax
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
	HttpSession sesion = request.getSession();
	
	ldn.Platillo pla = new ldn.Platillo();

	int idPedido = Integer.parseInt(request.getParameter("idP"));
        float cali = Float.parseFloat(request.getParameter("cali"));
        
        pla.calificar(idPedido,cali);
%>

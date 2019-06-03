<%-- 
    Document   : calificarRep
    Created on : 1/06/2019, 01:30:08 AM
    Author     : Yax
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
	HttpSession sesion = request.getSession();
	
	ldn.Pedido ped = new ldn.Pedido();

	int idPedido = Integer.parseInt(request.getParameter("idP"));
        float cali = Float.parseFloat(request.getParameter("cali"));
        
        ped.calificar(idPedido,cali);
%>


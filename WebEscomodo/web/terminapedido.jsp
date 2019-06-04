<%-- 
    Document   : terminapedido
    Created on : 4/06/2019, 12:12:50 AM
    Author     : Yax
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	HttpSession sesion = request.getSession();
	
	ldn.Pedido ped = new ldn.Pedido();

	int idPedido = Integer.parseInt(request.getParameter("idP"));
        int clie = Integer.parseInt(request.getParameter("clie"));
        String fec = request.getParameter("fec");
        String hor = request.getParameter("hor");
        float tot = Float.parseFloat(request.getParameter("tot"));
        String lug = request.getParameter("lug");
        
        ped.updatear(clie,fec,hor,tot,lug,7);
%>

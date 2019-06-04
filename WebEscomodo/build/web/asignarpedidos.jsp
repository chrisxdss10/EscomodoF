<%-- 
    Document   : asignarpedidos
    Created on : 3/06/2019, 11:32:27 PM
    Author     : Yax
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
	HttpSession sesion = request.getSession();
        String mail = sesion.getAttribute("Mail").toString();
	
	ldn.Pedido ped = new ldn.Pedido();

	int idPedido = Integer.parseInt(request.getParameter("idP"));
        int clie = Integer.parseInt(request.getParameter("clie"));
        String fec = request.getParameter("fec");
        String hor = request.getParameter("hor");
        float tot = Float.parseFloat(request.getParameter("tot"));
        String lug = request.getParameter("lug");
        
        ped.asignar(idPedido,mail);
        ped.updatear(clie,fec,hor,tot,lug,6);
%>

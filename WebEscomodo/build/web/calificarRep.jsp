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
        int clie = Integer.parseInt(request.getParameter("clie"));
        String fec = request.getParameter("fec");
        String hor = request.getParameter("hor");
        float tot = Float.parseFloat(request.getParameter("tot"));
        String lug = request.getParameter("lug");
        
        ped.calificar(idPedido,cali);
        ped.actualizarR(idPedido);
        ped.updatear(clie,fec,hor,tot,lug,7);
%>


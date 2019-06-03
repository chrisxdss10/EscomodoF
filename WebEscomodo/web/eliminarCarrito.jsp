<%-- 
    Document   : eliminarCarrito
    Created on : 01-jun-2019, 20:17:18
    Author     : chistopher
--%>

<%@page import="ldn.Platillo"%>
<%@page import="ldn.Pedido"%>
<%@page import="ldn.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    HttpSession sesion = request.getSession();
    String jsonE="";
    int idP=Integer.parseInt((String)request.getParameter("idP"));
    
    Cliente c= new Cliente(sesion.getAttribute("Mail").toString());
    Pedido p= new Pedido();
    Platillo platillo= new Platillo(idP);
    String r= p.eliminarCarrito(c.getId(), idP, platillo.getIdOrigen());
    if(r.equals("Eliminado")){
        jsonE = "{\"estado\": \"removed\"}";
        out.print(jsonE);
        out.flush();
    }
%>
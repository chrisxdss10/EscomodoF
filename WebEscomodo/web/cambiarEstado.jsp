<%-- 
    Document   : cambiarEstado
    Created on : 02-jun-2019, 12:26:59
    Author     : chistopher
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="ldn.Cliente"%>
<%@page import="ldn.Pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession();
    String jsonE="";
    
    int idEst= Integer.parseInt(request.getParameter("idEst"));
    float pt= Float.parseFloat(request.getParameter("pt"));
    String l= (String)request.getParameter("l");
    int est= Integer.parseInt(request.getParameter("est"));
    
    System.out.println(idEst+"."+pt+"."+l+"."+est);
    Pedido p= new Pedido();
    Cliente c= new Cliente((sesion.getAttribute("Mail").toString()));
    java.util.Calendar cal = java.util.Calendar.getInstance();
    Date fecha = cal.getTime();
    DateFormat hourFormat = new SimpleDateFormat("HH:mm:ss");
    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
    String r;
    
    if(est==3){
        p.actualizarEstado(c.getId(), idEst, dateFormat.format(fecha), hourFormat.format(fecha), pt, l, est);
        r=p.actualizarEstado(c.getId(), idEst, dateFormat.format(fecha), hourFormat.format(fecha), pt, l, 5);
        if(r.equals("Lista de espera")){
            jsonE = "{\"estado\": \"ok\"}";
            out.print(jsonE);
            out.flush();
        }
    }
    


%>

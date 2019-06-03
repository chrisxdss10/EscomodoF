<%-- 
    Document   : agregarFavorito
    Created on : 26-may-2019, 20:31:01
    Author     : chistopher
--%>

<%@page import="ldn.Platillo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="ldn.Pedido"%>
<%@page import="ldn.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession();
    String jsonE="";
    int idP=Integer.parseInt((String)request.getParameter("idP"));
    if(sesion.getAttribute("Mail") == null){
        jsonE = "{\"estado\": \"false\"}";
        out.print(jsonE);
        out.flush();
    }
    else{
        String currentClass= (String)request.getParameter("currentClass");
        if(currentClass.equals("far fa-heart")){//corazón vacío
            Cliente c= new Cliente((sesion.getAttribute("Mail").toString()));
            Pedido p= new Pedido();
            Platillo platillo= new Platillo(idP);
            java.util.Calendar cal = java.util.Calendar.getInstance();
            Date fecha = cal.getTime();
            DateFormat hourFormat = new SimpleDateFormat("HH:mm:ss");
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
            String r= p.insertarPedido(c.getId(), idP, dateFormat.format(fecha), hourFormat.format(fecha), platillo.getPrecio(),
            1, platillo.getOrigen(),2,"Favoritos");
            
            if(r.equals("Agregado a favoritos")){
                jsonE = "{\"estado\": \"added\"}";
                out.print(jsonE);
                out.flush();
            }
        }
        else if(currentClass.equals("fas fa-heart")){//corazón lleno
            Cliente c= new Cliente(sesion.getAttribute("Mail").toString());
            Pedido p= new Pedido();
            Platillo platillo= new Platillo(idP);
            String r= p.eliminarFav(c.getId(), idP, platillo.getIdOrigen());
            if(r.equals("Eliminado")){
                jsonE = "{\"estado\": \"removed\"}";
                out.print(jsonE);
                out.flush();
            }
        }
    }
%>
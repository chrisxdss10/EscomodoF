<%-- 
    Document   : vaciarCarrito
    Created on : 01-jun-2019, 22:31:02
    Author     : chistopher
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ldn.Platillo"%>
<%@page import="ldn.Pedido"%>
<%@page import="ldn.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    HttpSession sesion = request.getSession();
    String jsonE="";
    int idP=Integer.parseInt(request.getParameter("idP").toString());
    int cantidad=Integer.parseInt((String)request.getParameter("cantidad"));
    String instrucciones= (String)request.getParameter("instrucciones");
    Platillo plato= new Platillo(idP);
    
    ArrayList <Pedido> carrito= Pedido.getCarrito(sesion.getAttribute("Mail").toString());
    Cliente c= new Cliente(sesion.getAttribute("Mail").toString());
    Pedido p;
    Platillo platillo;
    int i=carrito.size()-1;
    while(i>=0){
        p=carrito.get(i);
        platillo= new Platillo(p.getComida());
        System.out.println(p.eliminarCarrito(c.getId(), platillo.getId(), platillo.getIdOrigen()));;
        i--;
    }
    
    
    if(i==-1){
        p= new Pedido();
        java.util.Calendar cal = java.util.Calendar.getInstance();
        Date fecha = cal.getTime();
        DateFormat hourFormat = new SimpleDateFormat("HH:mm:ss");
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
        String r= p.insertarCarrito(c.getId(), idP, dateFormat.format(fecha), hourFormat.format(fecha), plato.getPrecio(),
        cantidad, plato.getOrigen(),1,instrucciones);

        if(r.equals("Agregado")){
            jsonE = "{\"estado\": \"removed\"}";
            out.print(jsonE);
            out.flush();
        }
    }
%>

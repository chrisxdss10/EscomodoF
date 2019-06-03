<%-- 
    Document   : agregarCarrito
    Created on : 26-may-2019, 3:00:24
    Author     : chistopher
--%>

<%@page import="ldn.Establecimiento"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="ldn.Platillo"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="ldn.Pedido"%>
<%@page import="ldn.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession();
    String jsonE="";
    int idP=Integer.parseInt((String)request.getParameter("idP"));
    int cantidad=Integer.parseInt((String)request.getParameter("cantidad"));
    String instrucciones= (String)request.getParameter("instrucciones");
    Platillo platillo= new Platillo(idP);
    
    if(sesion.getAttribute("Mail") == null){
        jsonE = "{\"estado\": \"false\"}";
        out.print(jsonE);
        out.flush();
    }
    else{
        Cliente c= new Cliente((sesion.getAttribute("Mail").toString()));
        Pedido p= new Pedido();
        String esVacio=Pedido.isCartEmpty(c.getId());
        if(esVacio.equals("Empty")){
            java.util.Calendar cal = java.util.Calendar.getInstance();
            Date fecha = cal.getTime();
            DateFormat hourFormat = new SimpleDateFormat("HH:mm:ss");
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
            String r= p.insertarCarrito(c.getId(), idP, dateFormat.format(fecha), hourFormat.format(fecha), platillo.getPrecio(),
            cantidad, platillo.getOrigen(),1,instrucciones);

            if(r.equals("Agregado")){
                jsonE = "{\"estado\": \"added\"}";
                out.print(jsonE);
                out.flush();
            }
        }
        else if(platillo.esCarrito(c.getId()).equals("true")){
            System.out.println("1");
            jsonE = "{\"estado\": \"repeated\"}";
            out.print(jsonE);
            out.flush();
        }
        else{
            if(Integer.parseInt(esVacio)==platillo.getIdOrigen()){
                System.out.println("2");
                System.out.println(platillo.esCarrito(c.getId()));
                java.util.Calendar cal = java.util.Calendar.getInstance();
                Date fecha = cal.getTime();
                DateFormat hourFormat = new SimpleDateFormat("HH:mm:ss");
                DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
                String r= p.insertarCarrito(c.getId(), idP, dateFormat.format(fecha), hourFormat.format(fecha), platillo.getPrecio(),
                cantidad, platillo.getOrigen(),1,instrucciones);

                if(r.equals("Agregado")){
                    jsonE = "{\"estado\": \"added\"}";
                    out.print(jsonE);
                    out.flush();
                }
            }
            else{
                Establecimiento e= new Establecimiento(Integer.parseInt(esVacio));
                jsonE = "{\"estado\": \""+e.getNombre()+"\"}";
                out.print(jsonE);
                out.flush();
            }
        }
        
    }


%>

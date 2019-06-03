<%-- 
    Document   : crearElementosFavs
    Created on : 31-may-2019, 1:25:35
    Author     : chistopher
--%>

<%@page import="ldn.Pedido"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession();
    int index=Integer.parseInt(request.getParameter("numItemsDisplayed"));

    ArrayList <Pedido>pedidos=Pedido.getFavoritos((String)sesion.getAttribute("Mail"));
    if(pedidos.size()==0){
        out.println("</div>");
        out.println("<div class=\"col s6 offset-s3 center\">");
        out.println("<h3>&iexcl;Wow, que vac&iacute;o! <br>Elija sus productos favoritos <a href=\"productos.html\">aqu&iacute;</a>&nbsp;<i class=\"far fa-grin-squint-tears\"></i></h3>");
        out.println("</div>");
    }
    else{    
        Pedido a;
        int cantidadDesplegar=12;
        int cantidad=pedidos.size();
        int restantes=pedidos.size()-index;
        if(restantes !=0){
            int max=0;
            if(restantes>cantidadDesplegar)
                max=cantidadDesplegar;
            else
                max=restantes;

                for (int i=index+1; i <= (max+index); i++) {
                    a=pedidos.get(i-1);
                    out.println("<tr class=\"generated\">");
                    out.println("<td><img src=\"images/"+a.getHora()+"\" alt=\"P\" class=\"circle mini\"></td>");
                    out.println("<td>"+a.getComida()+"</td>");
                    out.println("<td>"+a.getPrecio()+" MXN</td>");
                    out.println("<td class=\"grey-text\">Agregado el "+a.getFecha()+"</td>");
                    out.println("<td><button class=\"btn-flat right add\" data-namee=\""+a.getComida()+"\"data-button-id="+(int)a.getTotal()+">"
                            + "<i class=\"fas fa-shopping-cart\"></i></button></td>");
                    out.println("<td><button class=\"btn-flat close remove\" data-button-id="+(int)a.getTotal()+
                            "><i class=\"fas fa-times\"></i></button></td>");
                    out.println("</tr>");
                }
                if(max==cantidadDesplegar){
                    out.println("<input type='hidden' data-continue='true' id='continue'>");    
                }
                else{
                    out.println("<input type='hidden' data-continue='false' id='continue'>");
                }

        }
    }
    
%>

<%-- 
    Document   : crearElementos
    Created on : 18-may-2019, 1:36:29
    Author     : chistopher
--%>

<%@page import="ldn.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ldn.Platillo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    HttpSession sesion = request.getSession();
    int tipo=0;
    Cliente c=null;
    if(sesion.getAttribute("Mail")!=null){
        tipo = Integer.parseInt(session.getAttribute("Tipo").toString());
        c= new Cliente(sesion.getAttribute("Mail").toString());
    }
    
    int index=Integer.parseInt(request.getParameter("numItemsDisplayed"));
    
    ArrayList <Platillo>platillos=Platillo.getPlatillos();
    Platillo a;
    int cantidadDesplegar=12;
    int cantidad=platillos.size();
    int restantes=platillos.size()-index;
    if(restantes !=0){
        int max=0;
        if(restantes>cantidadDesplegar)
            max=cantidadDesplegar;
        else
            max=restantes;

            for (int i=index+1; i <= (max+index); i++) {
                a=platillos.get(i-1);
                out.println("<div class=\"col s12 m6 l4\">");
                out.println("<div class=\"card small sticky-action\" data-product="+a.getId()+" data-nameE="+a.getNombre()+">");
                out.println("<div class=\"card-image\">");
                out.println("<img class=\"activator\" src="+a.getFoto()+"></div>");
                out.println("<div class=\"card-content\">");
                out.println("<span class=\"card-title\">"+a.getNombre());
                if(tipo == 1){
                    if(a.esFavorito(c.getId()).equals("true")){
                        out.println("<button class=\"btn-flat right fav\" data-button-id="+a.getId()+"><i class=\"fas fa-heart\"></i></button>");
                    }
                    else if(a.esFavorito(c.getId()).equals("false")){
                        out.println("<button class=\"btn-flat right fav\" data-button-id="+a.getId()+"><i class=\"far fa-heart\"></i></button>");
                    }
                    out.println("<button class=\"btn-flat right add\" data-namee=\""+a.getNombre()+"\"data-button-id="+a.getId()+"><i class=\"fas fa-shopping-cart\"></i></button>");
                }
                else if(tipo==0){
                    out.println("<button class=\"btn-flat right fav\" data-button-id="+a.getId()+"><i class=\"far fa-heart\"></i></button>");
                    out.println("<button class=\"btn-flat right add\" data-namee="+a.getNombre()+"data-button-id="+a.getId()+"><i class=\"fas fa-shopping-cart\"></i></button>");
                }
                out.println("</span></div><div class=\"card-action\">");
                out.println("<span class=\"grey-text\">"+a.getValoracion()+"<i class=\"fas fa-star\"></i><span class=\"right\">"+a.getPrecio()+" MXN</span></span>");
                out.println("</div>");
                out.println("<div class=\"card-reveal\">");
                out.println("<span class=\"card-title\">"+a.getNombre()+"<i class=\"right fas fa-times\"></i></span>");
                out.println("<p>"+a.getDescripcion()+"</p>");
                out.println("<h6 class=\"left header grey-text\"><strong>"+a.getOrigen()+"</strong></h6>");
                out.println("</div></div></div>");
            }
            if(max==cantidadDesplegar){
                out.println("<input type='hidden' data-continue='true' id='continue'>");    
            }
            else{
                out.println("<input type='hidden' data-continue='false' id='continue'>");
            }
            
    }
    
%>

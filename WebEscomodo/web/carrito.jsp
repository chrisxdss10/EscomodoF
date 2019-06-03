<%-- 
    Document   : carrito
    Created on : 24-may-2019, 1:20:18
    Author     : chistopher
--%>

<%@page import="ldn.Platillo"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ldn.Pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Compra</title>
    <script type="text/javascript" src="libs/jquery-3.1.1/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js" ></script>
    <script src="libs/materialize/js/materialize.min.js"></script>
    <script type="text/javascript" src="js/carrito.js"></script>
    <script src="libs/jquery-confirm/js/jquery-confirm.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link href="libs/materialize/css/materialize.min.css" rel="stylesheet">
    <link href="libs/jquery-confirm/css/jquery-confirm.css" rel="stylesheet">
    <link rel="stylesheet" href="css/carrito.css">
    <link href="css/mainPage.css" rel="stylesheet" type="text/css"/>
    <link href="css/nvBar.css" rel="stylesheet" type="text/css"/>
    <link href="css/foot.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="js/nvBar.js"></script>
    <script type="text/javascript" src="js/foot.js"></script>
    <link rel="shortcut icon" type="image/x-icon" href="images/solo-logo-naranja.png" />
    <link href="libs/validetta/validetta.css" rel="stylesheet" type="text/css" media="screen">
    <script type="text/javascript" src="libs/validetta/validetta.js"></script>
    <script src="libs/validetta/validetta-es.js" type="text/javascript"></script>
</head>
<body>
	<div class = "row">
				<nav>
				    <div class="nav-wrapper">

				      <a href="#" data-target="small-sidenav" class="sidenav-trigger">
				      	<i class="fas nav-fas fa-bars"></i>
				      </a>

				      <ul id="nav-mobile" class="left hide-on-med-and-down">
				        <li><a href="productos.html" class = "white-text">Escomida</a></li>
				        <li><a href="establecimientos.html" class = "white-text">Escomercio</a></li>
				      </ul>

				      <ul class="right hide-on-med-and-down show-on-large">

			      		<li><a href="carrito.jsp" class="showOnCli carr"><i class="fas nav-fas fa-shopping-cart white-text"></i></a></li>
			      		<li><a href="login.jsp" class="waves-effect waves-light btn btn-login-nav">Log In</a></li>
			      		<li><a href="#" id="btn-user-nav" data-target="user-sidenav" class="sidenav-trigger"><i class="fas nav-fas fa-user white-text"></i></a></li>

					  </ul>

				      <a href="mainPage.jsp" class="brand-logo center">
				      	<img src="https://drive.google.com/uc?id=1-33i2fj72T0A40dxfZpDGTfWMyGbwj63" class = "responsive-img" id = "logo">
				      </a>

				      <ul class="sidenav" id="small-sidenav">
				      	<li><a class = "orange-text showOnCli showOnRep showOnCom" id="btn-verPerfil-s"><i class="fas nav-fas fa-user-circle orange-text"></i>Ver Perfil</a></li>
					    <li><a href="productos.html" class = "orange-text"><i class="fas nav-fas fa-pizza-slice orange-text"></i>Escomida</a></li>
				        <li><a href="establecimientos.html" class = "orange-text"><i class="fas nav-fas fa-coffee orange-text"></i>Escomercio</a></li>
				        <li><a class = "orange-text showOnCli showOnRep" id="btn-hist-nav-s"><i class="fas nav-fas fa-history orange-text"></i>Historial de Pedidos</a></li>
				        <li><a href="carrito.jsp" class="orange-text showOnCli carr"><i class="fas nav-fas fa-shopping-cart orange-text"></i>Carrito</a></li>
				         <li><a href="favoritos.jsp" class="orange-text showOnCli" id="btn-fav-nav"><i class="fas nav-fas fa-heart orange-text"></i>Favoritos</a></li>
				         <li><a href="#" class="orange-text showOnCli" id="btn-eval-nav"><i class="fas nav-fas fa-star orange-text"></i>Evaluar</a></li>
			      		<li><a href="login.jsp" class="waves-effect waves-light btn btn-login-nav">Log In</a></li>
                                        <li><a href="#" class="waves-effect waves-light btn cerrar-ses">Cerrar Sesi&oacute;n</a></li>
			      	  </ul>

			      	  <ul class="sidenav" id="user-sidenav">
					    <li><a class = "orange-text showOnCli showOnRep showOnCom" id="btn-verPerfil"><i class="fas nav-fas fa-user-circle orange-text"></i>Ver Perfil</a></li>
				        <li><a class = "orange-text showOnCli showOnRep" id="btn-hist-nav"><i class="fas nav-fas fa-history orange-text"></i>Historial de Pedidos</a></li>
				        <li><a href="carrito.jsp" class="orange-text showOnCli"><i class="fas nav-fas fa-shopping-cart orange-text"></i>Carrito</a></li>
				        <li><a href="favoritos.jsp" class="orange-text showOnCli" id="btn-fav-nav"><i class="fas nav-fas fa-heart orange-text"></i>Favoritos</a></li>
				        <li><a href="#" class="orange-text showOnCli" id="btn-eval-nav"><i class="fas nav-fas fa-star orange-text"></i>Evaluar</a></li>
                                        <li><a href="#" class="waves-effect waves-light btn cerrar-ses">Cerrar Sesi&oacute;n</a></li>
			      	  </ul>

				    </div>
				</nav>
			</div>
	<div class="my_container">
		<div class="section"><h3 class="header left-align">Compra</h3></div>
		<hr class="sound_waves-text">
		<div class="section items">
            <div class="row">
            	<div class="col s12 m6 l6">
                    
				        <tbody>
                                          <%
                                            HttpSession sesion = request.getSession();
                                            int num=0; 

                                            if(sesion.getAttribute("Mail") != null){
                                                ArrayList<Pedido> carrito =Pedido.getCarrito(sesion.getAttribute("Mail").toString());
                                                float total=0f;
                                                if(carrito.size()>0){
                                                    Pedido a=carrito.get(0);
                                                    Platillo b= new Platillo(a.getComida());
                                                    DecimalFormat formato = new DecimalFormat("#.00");
                                                    out.println("<div class=\"responsive-table table-status-sheet\">");
                                                    out.println("<table class=\"highlight centered\">");
                                                    out.println("<thead><tr>");
                                                    out.println("<th>Cantidad</th>");
                                                    out.println("<th>Producto</th>");
                                                    out.println("<th>Precio</th>");
                                                    out.println("<th>Eliminar</th></tr></thead>");

                                                    for (int i = 0; i < carrito.size(); i++) {
                                                        a= carrito.get(i);
                                                        b=new Platillo(a.getComida());
                                                        out.println("<tr>");
                                                        out.println("<td>"+a.getCantidad()+"</td>");
                                                        out.println("<td>"+a.getComida()+"</td>");
                                                        out.println("<td>"+a.getPrecio()*a.getCantidad()+" MXN</td>");
                                                        out.println("<td><button class=\"btn-flat remove\" "
                                                            + "data-button-id="+b.getId()+"><i class=\"fas fa-times\"></i></button></td>");
                                                        out.println("</tr>");
                                                        total=total+(a.getPrecio()*a.getCantidad());
                                                    }
                                                    
                                                    out.println("</tbody></table></div>");
                                                    out.println("<p class=\"header grey-text sub\">Subtotal: "+total+" MXN</p>"
                                                            + "<p class=\"header\">Total: "+formato.format(total*(1.1))+" MXN</p></div>");
                                                    out.println("<form class=\"col  s12 m5 offset-m1 l5 offset-l1\" name=\"form\" id=\"form1\">");
                                                    out.println("<div class=\"col s12\"><span class=\"grey-text one-line\">Tu pedido de</span><br>");
                                                    out.println("<h5 class=\"header left\">"+a.getComercio()+"</h5></div>");
                                                    out.println("<div class=\"input-field col s12\">1. Describa el lugar de entrega");
                                                    out.println("<input placeholder=\"Ejm. Sal&oacute;n 1012\" id=\"lugar1\" name=\"lugar\" type=\"text\" autocomplete=\"off\" data-validetta=\"required\">");
                                                    out.println("</div><div class=\"input-field col s12\">2. Elija la forma de pago <div class=\"row\">");
                                                    out.println("<div class=\"col s12 m6\"><p><label>");
                                                    out.println("<input class=\"with-gap\" name=\"pago\" id=\"efectivo1\" type=\"radio\" checked />");
                                                    out.println("<span for=\"efectivo\">Efectivo</span></label></p></div><div class=\"col s12 m6\">");
                                                    out.println("<p><label><input class=\"with-gap\" name=\"pago\" id=\"paypal1\" type=\"radio\"/>");
                                                    out.println("<span>Paypal</span></label></p></div></div></div>"); 
                                                    out.println("<div class=\"input-field col s12\">3. Confirmar compra<div class=\"row\">");
                                                    out.println("<div class=\"col s12\"><button type=\"submit\" id=\"btn-confirmar\"class=\"btn-pay\" data-button-id='"+b.getIdOrigen()+"'data-pt="+formato.format(total*(1.1))+">Pagar en efectivo</button>");
                                                    out.println("</div><div class=\"col s12\">");
                                                    out.println("</div></div></div></form>");    
                                                    
                                                    out.println("<form class=\"col  s12 m5 offset-m1 l5 offset-l1\" name=\"form\" id=\"form2\" display=\"none\" method=\"post\" action=\"https://www.sandbox.paypal.com/cgi-bin/webscr\">"); 
                                                    out.println("<input type=\"hidden\" name=\"upload\" value=\"1\">"); 
                                                    out.println("<input type=\"hidden\" name=\"return\" value=\"http://localhost:8084/WebEscomodo/compraExitosa.html\">"); 
                                                    out.println("<input type=\"hidden\" name=\"cancel_return\" value=\"http://localhost:8084/WebEscomodo/compraError.jsp\">");
                                                    out.println("<input type=\"hidden\" name=\"cmd\" value=\"_cart\">"); 
                                                    out.println("<input type=\"hidden\" name=\"business\" value=\"crayds.mail@gmail.com\">"); 
                                                    out.println("<input type=\"hidden\" name=\"currency_code\" value=\"MXN\">");
                                                    for (int i = 0; i < carrito.size(); i++) {
                                                        num=i+1;
                                                        a= carrito.get(i);
                                                        b=new Platillo(a.getComida());
                                                        out.println("<input type=\"hidden\" name=\"item_name_"+num+"\" value=\""+a.getComida()+"\">");
                                                        out.println("<input type=\"hidden\" name=\"amount_"+num+"\" value=\""+b.getPrecio()+"\">");
                                                        out.println("<input type=\"hidden\" name=\"quantity_"+num+"\" value=\""+a.getCantidad()+"\">");
                                                        out.println("<input type='hidden' name='item_number' value='"+b.getId()+"'>");
                                                    }
                                                        out.println("<input type=\"hidden\" name=\"item_name_"+(num+1)+"\" value=\"Comisi&oacute;n\">");
                                                        out.println("<input type=\"hidden\" name=\"amount_"+(num+1)+"\" value=\""+formato.format(total*(0.1))+"\">");
                                                        out.println("<input type=\"hidden\" name=\"quantity_"+(num+1)+"\" value=\"1\">");
                                                        out.println("<input type='hidden' name='item_number' value='0'>");
                                                    out.println("<div class=\"col s12\"><span class=\"grey-text one-line\">Tu pedido de</span><br>"); 
                                                    out.println("<h5 class=\"header left\">"+a.getComercio()+"</h5>"); 
                                                    out.println("</div>"); 
                                                    out.println("<div class=\"input-field col s12\">1. Describa el lugar de entrega"); 
                                                    out.println("<input placeholder=\"Ejm. Sal&oacute;n 1012\" id=\"lugar2\" name=\"lugar2\" type=\"text\" autocomplete=\"off\" data-validetta=\"required\">"); 
                                                    out.println("</div>"); 
                                                    out.println("<div class=\"input-field col s12\">2. Elija la forma de pago ");
                                                    out.println("<div class=\"row\">");            
                                                    out.println("<div class=\"col s12 m6\"><p><label>");                
                                                    out.println("<input class=\"with-gap\" name=\"pago\" id=\"efectivo2\" type=\"radio\" checked />");                
                                                    out.println("<span for=\"efectivo\">Efectivo</span></label></p>");                
                                                    out.println("</div>");                
                                                    out.println("<div class=\"col s12 m6\">");                
                                                    out.println("<p><label><input class=\"with-gap\" name=\"pago\" id=\"paypal2\" type=\"radio\"/>");                
                                                    out.println("<span>Paypal</span></label></p>");                    
                                                    out.println("</div>");                
                                                    out.println("</div>");                
                                                    out.println("</div>");                    
                                                    out.println("<div class=\"input-field col s12\">3. Confirmar compra");                
                                                    out.println("<div class=\"row\">");
                                                    out.println("<div class=\"col s12\"><button id=\"btn-paypal\"class=\"btn-pay\" data-button-id='"+b.getIdOrigen()+"'data-pt="+formato.format(total*(1.1))+">Confirmar Compra</button></div>");
                                                    out.println("<button id=\"send-paypal\" display=\"none\" class=\"btn-paypal\" type=\"submit\"><img src=\"https://www.paypalobjects.com/webstatic/es_MX/mktg/logos-buttons/redesign/btn_13.png\" alt=\"PayPal Credit\" /></button>");                    
                                                    out.println("</div>");                        
                                                    out.println("</div>");                            
                                                    out.println("</form>");                                                 
                                                }  
                                                else{
                                                    out.println("</div>");
                                                    out.println("<div class=\"col s6 offset-s3 center\">");
                                                    out.println("<h3>&iexcl;Wow, que vac&iacute;o! <br>Agregue productos al carrito <a href=\"productos.html\">aqu&iacute;</a>&nbsp;<i class=\"far fa-grin-squint-tears\"></i></h3>");
                                                    out.println("</div>");
                                                }
                                            }
                                            else{
                                                out.println("</div>");
                                                out.println("<div class=\"col s6 offset-s3 center\">");
                                                out.println("<h3>Inicie sesión para crear un pedido <a href=\"login.jsp\">aqu&iacute;</a>&nbsp;<i class=\"far fa-grin-squint-tears\"></i></h3>");
                                                out.println("</div>");
                                            }
                                            
                                          %>
            </div>
		</div>
	</div>
        
    <footer class="page-footer">
     <div class="container">
            <div class="row footerRow">
              <div class="col l6 s12 logoDiv">
                <img src="https://drive.google.com/uc?id=1-33i2fj72T0A40dxfZpDGTfWMyGbwj63" class = "responsive-img valign-wrapper align-center" id = "logoFooter">
              </div>
              <div class="col l4 offset-l2 s12">
                <h4 class="white-text">Contacto</h4>

                <ul class = "contacts-big">

                  <li>
                    <i class="fab fa-facebook-square white-text"></i>
                    <a class="white-text" href="#!">Facebook</a>
                  </li>
                  <li>
                    <i class="fab fa-twitter white-text"></i>
                    <a class="white-text" href="#!">Twitter</a>
                  </li>
                  <li>
                    <i class="fab fa-instagram white-text"></i>
                    <a class="white-text" href="#!">Instagram</a>
                  </li>

                </ul>

                <ul class = "contacts-small">

                  <li>
                    <i class="fab fa-facebook-square white-text"></i>
                    <i class="fab fa-twitter white-text"></i>
                    <i class="fab fa-instagram white-text"></i>
                  </li>

                </ul>

              </div>
            </div>
          </div>

          <div class="footer-copyright">
            <div class="container white-text">
              &copy; 2019 CRAYDS
            </div>
          </div>

  </footer>
    <script src="libs/materialize/js/materialize.min.js"></script>
</body>
</html>

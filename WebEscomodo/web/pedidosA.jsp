<%-- 
    Document   : historialP
    Created on : 29/05/2019, 12:33:26 AM
    Author     : Yax
--%>
<%@page import="ldn.Pedido"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sesion = request.getSession();
    
    String mail = sesion.getAttribute("Mail").toString();
    int tipo = Integer.parseInt(sesion.getAttribute("Tipo").toString());    

                       ArrayList <Pedido>pedidos=Pedido.getListaPedidos(mail);
                       Pedido a; 
                    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Escomodo</title>
        <%if(mail==null || tipo != 3){%>
                <script>window.location.replace("mainPage.html");</script>
        <%}%>
        
        <link type="text/css" rel="stylesheet" href="libs/materialize/css/materialize.min.css"  media="screen,projection"/>

	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">

	<script type="text/javascript" src="libs/materialize/js/materialize.min.js"></script>
	<script src="libs/jquery-3.1.1/jquery-3.1.1.min.js"></script>

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>

	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>

	<link href="css/mainPage.css" rel="stylesheet">
	<link href="css/nvBar.css" rel="stylesheet">
	<link href="css/foot.css" rel="stylesheet">
        <link href="css/perfil.css" rel="stylesheet">

	<script type="text/javascript" src="js/nvBar.js"></script>
	<script type="text/javascript" src="js/foot.js"></script>
        <script type="text/javascript" src="js/pedidos.js"></script>
    </head>
    <body>
        <div>
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
                            <li><a href="#" class="waves-effect waves-light btn cerrar-ses">Cerrar Sesión</a></li>
                      </ul>

                      <ul class="sidenav" id="user-sidenav">
                                <li><a class = "orange-text showOnCli showOnRep showOnCom" id="btn-verPerfil"><i class="fas nav-fas fa-user-circle orange-text"></i>Ver Perfil</a></li>
                            <li><a class = "orange-text showOnCli showOnRep" id="btn-hist-nav"><i class="fas nav-fas fa-history orange-text"></i>Historial de Pedidos</a></li>
                            <li><a href="carrito.jsp" class="orange-text showOnCli"><i class="fas nav-fas fa-shopping-cart orange-text"></i>Carrito</a></li>
                            <li><a href="favoritos.jsp" class="orange-text showOnCli" id="btn-fav-nav"><i class="fas nav-fas fa-heart orange-text"></i>Favoritos</a></li>
                            <li><a href="#" class="orange-text showOnCli" id="btn-eval-nav"><i class="fas nav-fas fa-star orange-text"></i>Evaluar</a></li>
                            <li><a href="#" class="waves-effect waves-light btn cerrar-ses">Cerrar Sesión</a></li>
                      </ul>

                        </div>
                    </nav>
            </div>
        </div>
        
        <div class="row rowMarginS center-align"> 
            <span class="flow-text">
                Pedidos disponibles
            </span>
        </div>
        <div class="row rowMarginS">
              <ul class="collapsible">
                <%
                for(int n = 0; n< pedidos.size(); n++){
                   a = pedidos.get(n);
                   int cli = a.getCliente();
                   int id = a.getIdPed();
                   String com = a.getComercio();
                   float tot = a.getTotal();
                   String fecha = a.getFecha();
                   String hora = a.getHora();
                   String lugar = a.getLugar();
                   
                   ldn.Cliente clien = new ldn.Cliente(cli);
                   String cName= clien.getNombre();
                   String cNum = clien.getTel();
                   String cFoto = clien.getFoto();
                   ArrayList <Pedido> pedidoG=Pedido.existe(com, fecha, hora, tot, lugar);
                   int totalP = pedidoG.size();
                   a = pedidoG.get(0);
                   int primero = a.getIdPed();
                    %>
                <li>
                  <%if (id == primero){%>  
                  <div class="collapsible-header">
                     <table class="striped">
                        <thead>
                          <tr>
                              <th class="col s2 m1 l1"><i class="fas fa-hamburger"></i></th>
                              <th class="col s10 m5 l5"><%=com%></th>
                              <th class="col s3 m2 l2">Hora: <%=hora%></th>
                              <th class="col s3 m2 l2"><span class="new badge carnito" data-badge-caption="productos"><%= totalP%></span></th>
                              <th class="col s3 m2 l2"><span><button class="waves-effect waves-light btn-small amber"><i class="medium fas fa-utensils"></i>Tomar pedido</button></span></th>
                          </tr>
                        </thead>
                     </table>
                  </div>
                  <div class="collapsible-body">
                      <table class="striped">
                          <thead>
                              <tr class="valign-wrapper">
                                  <th class="col l2"><span><img src='images/default.png' class='circle responsive-img z-depth-3'/></span></th>
                                  <th class="col l3"><span> Cliente: <%=cName%></span></th>
                                  <th class="col l3"><span><i class="fas fa-phone"></i> Contacto: <%=cNum%></span></th>
                                  <th class="col l3"><span><i class="fas fa-map-marker-alt"></i> Lugar de entrega: <%=lugar%></span></th>
                              </tr>
                          </thead>
                      </table>
                      <table>
                        <thead>
                          <tr>
                              <th>Producto</th>
                              <th>Precio individual</th>
                              <th>Cantidad</th>
                              <th>Total producto</th>
                              <th>Especificaciones</th>
                          </tr>
                        </thead>
                        <tbody>
                         <% for(int k = 0; k<totalP; k++){
                            a = pedidoG.get(k);
                         %>
                          <tr>
                            <td><%=a.getComida()%></td>
                            <td><%=a.getPrecio()%></td>
                            <td><%=a.getCantidad()%></td>
                            <td><%=a.getTotal()%></td>
                            <td><%=a.getEspecif(a.getIdPed())%></td>
                          </tr>
                         <%}%>
                         <tr>
                            <td><span>Total Pedido</span></td>
                            <td></td>
                            <td></td>
                            <td><%=tot%></td>
                            <td></td>
                          </tr>
                      </table>
                  </div>
                </li>
                <%
                }
             } %>
              </ul>
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
            	© 2019 CRAYDS
            </div>
          </div>
	</footer>
 <script type="text/javascript" src="libs/materialize/js/materialize.min.js"></script>
    </body>
</html>

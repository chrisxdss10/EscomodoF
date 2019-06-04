<%-- 
    Document   : perfilR
    Created on : 22/05/2019, 02:23:40 PM
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
    ldn.Repartidor rep = new ldn.Repartidor(mail);
    String Nombre = rep.getNombre();
    String Tel = rep.getTel();
    String Horario = rep.getHorario();
    String Foto = rep.getFoto();
    String Valoracion = rep.getValoracion();
    int np = rep.NPedidos(mail);
    

                       ArrayList <Pedido>pedidos=Pedido.getListaPedidosA(mail);
                       Pedido a; 
    
%>
<html>
    <head>
        <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

	<title>Escomodo</title>
        <%if(mail==null){%>
                <script>window.location.replace("mainPage.html");</script>
        <%}%>

	<meta name='viewport' content='width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no'/>
	<meta name="description" content="">
	<meta name="keywords" content="">
	
	<link type="text/css" rel="stylesheet" href="libs/materialize/css/materialize.min.css"  media="screen,projection"/>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        
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
        <script type="text/javascript" src="js/asignar.js"></script>
        
        <link rel="shortcut icon" type="image/x-icon" href="images/solo-logo-naranja.png" />
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
                <li><a href="#" class="waves-effect waves-light btn cerrar-ses">Cerrar Sesión</a></li>
                </ul>

                <ul class="sidenav" id="user-sidenav">
              <li><a class = "orange-text showOnCli showOnRep showOnCom" id="btn-verPerfil"><i class="fas nav-fas fa-user-circle orange-text"></i>Ver Perfil</a></li>
                <li><a class = "orange-text showOnCli showOnRep" id="btn-hist-nav"><i class="fas nav-fas fa-history orange-text"></i>Historial de Pedidos</a></li>
                <li><a href="carrito.jsp" class="orange-text showOnCli"><i class="fas nav-fas fa-shopping-cart orange-text"></i>Carrito</a></li>
                <li><a href="favoritos.jsp" class="orange-text showOnCli" id="btn-fav-nav"><i class="fas nav-fas fa-heart orange-text"></i>Favoritos</a></li>
                <li><a href="#" class="waves-effect waves-light btn cerrar-ses">Cerrar Sesión</a></li>
                </ul>

            </div>
        </nav>
    </div>
        <div>
            <div class="row rowMarginT">
                <div class = "col s6 m4 l2 offset-s3 offset-m4 offset-l5">
                    <div>
                        <img src="images/img_repartidor/<%=Foto%>" class='circle responsive-img z-depth-3'/>
                    </div>
                </div>
                <div class="col s2 m2 l4"></div>
                <%if(tipo == 3){%>
                <div class = "col s1 m2 l1">
                    <a href="editarRepartidor.jsp" class="btn-floating btn-large"><span><i class="small material-icons">edit</i></span></a>
                </div>
                <%}%>
            </div>
            <div class="row rowMarginT">
                <div class = "col s12 m12 l4 push-l4 center-align">
                    <span class="center-align letradeIMPAKTO"><%=Nombre%></span>
                </div>
                <div class = "col s6 m6 l4 pull-l4 center-align">
                  <span class="center-align letradeIMPAKTO"><%=np%> <br> </span>
                  <span class="noIMPAKTO">Pedidos completados</span>
                </div>  
                <div class = "col s6 m6 l4 center-align">
                    <br>
                    <span class="letradeIMPAKTO"><%=Valoracion%><i class="medium fas fa-star "></i></span>
                </div>
            </div>
            <div class="row">
                <div class="col s6 m6 l4"><div class = "divider"></div></div>
                <div class="col l4 center-align">
                </div>
                <div class="col s6 m6 l4"><div class = "divider"></div></div>
            </div>
            <%if(tipo == 3){%>  
                <div class = "row rowMarginT">
                    <div class = "col s12 m6 l6" align="center">
                            <a href="pedidosA.jsp" class="waves-effect waves-light btn-large" href=" ">Pedidos disponibles</a>
                    </div>
                    <div class = "col s12 m6 l6" align="center">
                            <a href="pedidosH.jsp" class="waves-effect waves-light btn-large" href=" ">Historial pedidos</a>
                    </div>
                </div>
            <%}%>
        </div> 
        <div class="row rowMarginS center-align"> 
            <span class="flow-text">
                Pedidos activos
            </span>
        </div>
        <div class="row rowMarginS">
              <ul class="collapsible">
                <%
                int tamaño = pedidos.size();
                if(tamaño==0){
                %>
                 <div class="row rowMarginS center-align"> 
                    <span class="flow-text">
                        No hay pedidos activos, atiende <a href="pedidosA.jsp">uno</a>
                    </span>
                </div> 
                <%
                } else{
                for(int n = 0; n< tamaño; n++){
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
                   ArrayList <ldn.Pedido> pedidoG=ldn.Pedido.existe(com, fecha, hora, tot, lugar);
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
                              <th class="col s3 m2 l2"><span>
                                      <button class="waves-effect waves-light btn-small amber term" data-cli="<%=cli%>" data-com="<%=com%>" data-fecha="<%=fecha%>"  data-tot="<%=tot%>" data-hora="<%=hora%>" data-lugar=" <%=lugar%>" data-iddd="<%=id%>">
                                          <i class="medium fas fa-utensils"></i>Terminar pedido
                                      </button></span></th>
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
             } }%>
              </ul>
            </div> 
        <footer class="page-footer rowMarginT">
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

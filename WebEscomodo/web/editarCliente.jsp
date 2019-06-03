<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
	HttpSession sesion = request.getSession();
	
        
	ldn.Cliente cliente = new ldn.Cliente(sesion.getAttribute("Mail").toString());
	//ldn.Repartidor repartidor = new ldn.Repartidor();

	String mensaje = "";
        
	String nom = cliente.getNombre();
	String bol = cliente.getBoleta();
        sesion.setAttribute("Boleta", bol);
	String email = cliente.getEmail();
	String tel = cliente.getTel();
	String foto = cliente.getFoto();
	//String img = "";

	String acc = request.getParameter("acc") == null ? "0" : request.getParameter("acc");
       
        if(acc.equals("1"))
        {
            String msj = "";
            String cnombre  = request.getParameter("nombre");
            String cemail  = request.getParameter("email");
            String ctel  = request.getParameter("tel");
            String acont  = request.getParameter("acont");
            String contra  = request.getParameter("contra");
        
            ldn.Cliente cte = new ldn.Cliente();
            msj = cte.cambios(cnombre, bol, cemail, ctel, acont, contra);
            
            response.sendRedirect("perfilC.jsp");
            
        }
        
        


%>


<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

	<title>Escomodo</title>

	<meta name='viewport' content='width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no'/>
	<meta name="description" content="">
	<meta name="keywords" content="">
	
	<link type="text/css" rel="stylesheet" href="libs/materialize/css/materialize.min.css"  media="screen,projection"/>

	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">

	<script type="text/javascript" src="libs/materialize/js/materialize.min.js"></script>
	<script src="libs/jquery-3.1.1/jquery-3.1.1.min.js"></script>

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>

	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>

	<link href="css/registro.css" rel="stylesheet">
	<link href="css/nvBar.css" rel="stylesheet">
	<link href="css/foot.css" rel="stylesheet">

	<script type="text/javascript" src="js/registro.js"></script>
	<script type="text/javascript" src="js/editarCliente.js"></script>
	<script type="text/javascript" src="js/nvBar.js"></script>
	<script type="text/javascript" src="js/foot.js"></script>
        
        <link rel="shortcut icon" type="image/x-icon" href="images/solo-logo-naranja.png" />

</head>

<body>
	<header>
	</header>

	<main>
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

			<div class = "row">
				<div class = "col s12 m12 l12 center-align">
					<h1>
						Actualizar datos
					</h1>
				</div>
			</div>

			<div class="row">
                            
                <div class = "container" id="div-registro">


                        <div class = "row">
                            <div class="col s12 m12 l12 center-align">
                                <img src="images/img_cliente/<%=foto%>" class="responsive-img" id="foto-insert">  
                                <a class="btn-floating btn-small waves-effect waves-light red" href="SubirImagen.jsp"><i class="fa fa-pen"></i></a>
                            </div>

                        </div>
                    <form action="?acc=1" method="POST" id="form-actualizar" name="form-actualizar">
                        <div class="row">
                            <div class="col s12 m10 l8 offset-l2 offset-m1">
	                            <div class="input-field">
	                              <i class="prefix fas fa-user"></i>
                                      <input id="nombre" name="nombre" type="text" class="validate" value="<%=nom%>">
	                              <label for="nombre">Nombre Completo</label>
	                            </div>
	                        </div>
	                </div>

	                <div class="row">
	                        <div class="col s12 m12 l6">
	                            <div class="input-field">
	                            	<i class="prefix fas fa-id-card"></i>
                                        <input disabled id="boleta" name="boleta" type="text" class="validate" value="<%=bol%>">
	                                <label for="boleta">No. de Boleta</label>
	                            </div>
                            </div>
                                <div class="col s12 m12 l6">
                                    <div class="input-field">
                        		  <i class="prefix fas fa-phone"></i>
	                              <input id="tel" name="tel" type="text" class="validate" value="<%=tel%>">
	                              <label for="tel">Número de Teléfono</label>
	                            </div>
                        	</div>               
	                        
                        </div>

                        <div class = "row">

                        	<div class="col s12 m12 l6">
                        		<div class="input-field">
                        		  <i class="prefix fas fa-envelope"></i>
	                              <input id="email" name="email" type="text" class="validate" value="<%=email%>">
	                              <label for="email">Correo Electrónico</label>
	                            </div>
                        	</div>
                                <div class="col s12 m12 l6">
                                    <a class="waves-effect waves-light btn show">Cambiar contrase&ntilde;a</a>
                        	</div>
                                <div class="col s12 m12 l6 psw">
                                    <div class="input-field">
                        		  <i class="prefix fas fa-lock"></i>	
                                          <input id="acont" name="acont" type="password" class="validate cc" value="sc">
                                          <label for="acont">Contraseña anterior</label>
	                            </div>
                        	</div>

                        </div>

                        <div class = "row">

                        	<div class="col s12 m12 l6 psw">
                        		<div class="input-field">
                        		  <i class="prefix fas fa-lock"></i>
                                          <input id="contra" name="contra" type="password" class="validate cc" value="sc">
	                              <label for="contra">Contraseña nueva</label>
	                            </div>
                        	</div>

                        	<div class="col s12 m12 l6 psw">
                        		<div class="input-field">
                        		  <i class="prefix fas fa-lock"></i>	
	                              <input id="contra2" type="password" class="validate cc" value="sc">
	                              <label for="contra2">Confirma la contraseña nueva</label>
	                            </div>
                        	</div>

                        </div>


                        <div class="row">
                        	
                        	<div class="col s12 m12 l12 center-align">
                        		<button class="btn-large waves-effect waves-light" type="submit" name="action">Actualizar datos
								    <i class="fas fa-user-edit"></i>
								</button>
                        	</div>

                        </div>
                        
                    </form>
             
				</div>

		</div>


	</main>

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


<script type="text/javascript" src="libs/materialize/js/materialize.min.js"></script>
</body>

</html>

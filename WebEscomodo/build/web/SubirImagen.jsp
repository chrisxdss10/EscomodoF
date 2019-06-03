<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
	HttpSession sesion = request.getSession();
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

	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous"/>

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
						Actualizar imagen
					</h1>
				</div>
			</div>

			<div class="row">
                            
                    <div class = "container" id="div-registro">


                        <form id="subirimagen" name="subirimagen" method="POST" enctype="multipart/form-data" action="<%if(sesion.getAttribute("Tipo").toString().equals("1")){%>SubirImagenCliente<%}else if(sesion.getAttribute("Tipo").toString().equals("3")){%>SubirImagenRepartidor<%}else{%>SubirImagenEstablecimiento<%}%>">
                        <div class = "row">
                            <div class="col s12 m12 l12 center-align">
                                <img src="images/img_cliente/<%=sesion.getAttribute("Boleta").toString()%>.jpg" class="responsive-img" id="foto-insert">  
                            </div>
                            <div class="file-field input-field col s12 m12 l6 center-align">
                                <div class="btn">
                                  <span>Imagen</span>
                                  <input type="file" id="img" name="img" accept="image/*">
                                </div>
                                <div class="file-path-wrapper">
                                  <input class="file-path validate" type="text">
                                </div>
                                <button class="btn-large waves-effect waves-light" type="submit" name="action">Subir imagen
                                    <i class=""></i>
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

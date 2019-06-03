<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
	HttpSession sesion = request.getSession();
	
	ldn.Cliente cliente = new ldn.Cliente();
	ldn.Repartidor repartidor = new ldn.Repartidor();

	String mensaje = "";

	String nom = request.getParameter("nombre") == null ? "" : request.getParameter("nombre");
	String bol = request.getParameter("boleta") == null ? "" : request.getParameter("boleta");
	String email = request.getParameter("email") == null ? "" : request.getParameter("email");
	String tel = request.getParameter("tel") == null ? "" : request.getParameter("tel");
	String contra = request.getParameter("contra") == null ? "" : request.getParameter("contra");
	//String img = "";
	String horario = "";

	String acc = request.getParameter("acc") == null ? "0" : request.getParameter("acc");

	if (acc.equals("1")) {

		mensaje = cliente.registrar(nom, bol, email, tel, contra);

		if(mensaje.equals("Has sido registrado")){
			sesion.setAttribute("Mail", email);
            sesion.setAttribute("Tipo", "1");

            %><script> alert("<%=mensaje%>"); </script><%

            response.sendRedirect("mainPage.jsp");
		}

	} 

	if (acc.equals("2")){

		String dia1 = request.getParameter("dia1") == null ? "" : request.getParameter("dia1");
		String dia2 = request.getParameter("dia2") == null ? "" : request.getParameter("dia2");
		String dia3 = request.getParameter("dia3") == null ? "" : request.getParameter("dia3");
		String dia4 = request.getParameter("dia4") == null ? "" : request.getParameter("dia4");
		String dia5 = request.getParameter("dia5") == null ? "" : request.getParameter("dia5");
		String dia6 = request.getParameter("dia6") == null ? "" : request.getParameter("dia6");
		String dia7 = request.getParameter("dia7") == null ? "" : request.getParameter("dia7");
		String dia8 = request.getParameter("dia8") == null ? "" : request.getParameter("dia8");
		String dia9 = request.getParameter("dia9") == null ? "" : request.getParameter("dia9");
		String dia10 = request.getParameter("dia10") == null ? "" : request.getParameter("dia10");

		String hI1 = request.getParameter("horaInicio1") == null ? "" : request.getParameter("horaInicio1") + "-";
		String hI2 = request.getParameter("horaInicio2") == null ? "" : request.getParameter("horaInicio2") + "-";
		String hI3 = request.getParameter("horaInicio3") == null ? "" : request.getParameter("horaInicio3") + "-";
		String hI4 = request.getParameter("horaInicio4") == null ? "" : request.getParameter("horaInicio4") + "-";
		String hI5 = request.getParameter("horaInicio5") == null ? "" : request.getParameter("horaInicio5") + "-";
		String hI6 = request.getParameter("horaInicio6") == null ? "" : request.getParameter("horaInicio6") + "-";
		String hI7 = request.getParameter("horaInicio7") == null ? "" : request.getParameter("horaInicio7") + "-";
		String hI8 = request.getParameter("horaInicio8") == null ? "" : request.getParameter("horaInicio8") + "-";
		String hI9 = request.getParameter("horaInicio9") == null ? "" : request.getParameter("horaInicio9") + "-";
		String hI10 = request.getParameter("horaInicio10") == null ? "" : request.getParameter("horaInicio10") + "-";

		String hF1 = request.getParameter("horaFin1") == null ? "" : request.getParameter("horaFin1");
		String hF2 = request.getParameter("horaFin2") == null ? "" : request.getParameter("horaFin2");
		String hF3 = request.getParameter("horaFin3") == null ? "" : request.getParameter("horaFin3");
		String hF4 = request.getParameter("horaFin4") == null ? "" : request.getParameter("horaFin4");
		String hF5 = request.getParameter("horaFin5") == null ? "" : request.getParameter("horaFin5");
		String hF6 = request.getParameter("horaFin6") == null ? "" : request.getParameter("horaFin6");
		String hF7 = request.getParameter("horaFin7") == null ? "" : request.getParameter("horaFin7");
		String hF8 = request.getParameter("horaFin8") == null ? "" : request.getParameter("horaFin8");
		String hF9 = request.getParameter("horaFin9") == null ? "" : request.getParameter("horaFin9");
		String hF10 = request.getParameter("horaFin10") == null ? "" : request.getParameter("horaFin10");

		if(dia1!=""){
			horario = dia1 + hI1 + hF1;
		}
		if(dia2!=""){
			horario = horario + dia2 + hI2 + hF2;
		}
		if(dia3!=""){
			horario = horario + dia3 + hI3 + hF3;
		}
		if(dia4!=""){
			horario = horario + dia4 + hI4 + hF4;
		}
		if(dia5!=""){
			horario = horario + dia5 + hI5 + hF5;
		}
		if(dia6!=""){
			horario = horario + dia6 + hI6 + hF6;
		}
		if(dia7!=""){
			horario = horario + dia7 + hI7 + hF7;
		}
		if(dia8!=""){
			horario = horario + dia8 + hI8 + hF8;
		}
		if(dia9!=""){
			horario = horario + dia9 + hI9 + hF9;
		}
		if(dia10!=""){
			horario = horario + dia10 + hI10 + hF10;
		}

		mensaje = repartidor.registrar(nom, bol, email, tel, horario, contra);

		if(mensaje.equals("Has sido registrado")){
			sesion.setAttribute("Mail", email);
            sesion.setAttribute("Tipo", "3");

            %><script> alert("<%=mensaje%>"); </script><%

            response.sendRedirect("mainPage.jsp");
		}

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

	<link href="libs/validetta/validetta.css" rel="stylesheet" type="text/css" media="screen">

	<script type="text/javascript" src="libs/validetta/validetta.js"></script>
	<script src="libs/validetta/validetta-es.js" type="text/javascript"></script>

	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>

	<link href="css/registro.css" rel="stylesheet">
	<link href="css/nvBar.css" rel="stylesheet">
	<link href="css/foot.css" rel="stylesheet">

	<script type="text/javascript" src="js/registro.js"></script>
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
						¡Forma Parte de Escomodo!
					</h1>
				</div>
			</div>

			<div class="row">
                            
                <div class = "container" id="div-registro">

                    <form action="?acc=1" method="POST" id="form-registro">
                    
                        <div class = "row">
                            <div class="col s12 m12 l12 center-align">
                            	<img src="images/default.png" class="responsive-img" id="foto-insert">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col s12 m10 l8 offset-l2 offset-m1">
	                            <div class="input-field">
	                              <i class="prefix fas fa-user"></i>
	                              <input id="nombre" name="nombre" type="text" class="counter" data-validetta="required,maxLength[60]" data-length="60">
	                              <label for="nombre">Nombre Completo</label>
	                            </div>
	                        </div>
	                    </div>

	                    <div class="row">
	                        <div class="col s12 m12 l6">
	                            <div class="input-field">
	                            	<i class="prefix fas fa-id-card"></i>
	                                <input id="boleta" name="boleta" type="text" class="counter" data-validetta="required,maxLength[10],number" data-length="10">
	                                <label for="boleta">No. de Boleta</label>
	                            </div>
                            </div>
	                        
                            <div class="col s11 m11 l5 vertical-margin">
                            	 <div class="switch center-align">
								    <label>
								      <a id="eo">Escomensal</a>
								      <input type="checkbox" id="input-switch">
								      <span class="lever"></span>
								      <a id="e8">Escom8</a>
								    </label>
								 </div>
                            </div>

                            <div class="col s1 m1 l1 vertical-margin">
                            	<i class="fas fa-question-circle"></i>
                            </div>
	                        
                        </div>

                        <div class = "row">

                        	<div class="col s12 m12 l6">
                        		<div class="input-field">
                        		  <i class="prefix fas fa-envelope"></i>
	                              <input id="email" name="email" type="text" class="counter" data-validetta="required,maxLength[40],email" data-length="40">
	                              <label for="email">Correo Electrónico</label>
	                            </div>
                        	</div>

                        	<div class="col s12 m12 l6">
                        		<div class="input-field">
                        		  <i class="prefix fas fa-phone"></i>
	                              <input id="tel" name="tel" type="text" class="counter" data-validetta="required,maxLength[20],number" data-length="20">
	                              <label for="tel">Número de Teléfono</label>
	                            </div>
                        	</div>

                        </div>

                        <div class = "row">

                        	<div class="col s12 m12 l6">
                        		<div class="input-field">
                        		  <i class="prefix fas fa-lock"></i>
	                              <input id="contra" name="contra" type="password" class="counter" data-validetta="required,maxLength[16]" data-length="16">
	                              <label for="contra">Contraseña</label>
	                            </div>
                        	</div>

                        	<div class="col s12 m12 l6">
                        		<div class="input-field">
                        		  <i class="prefix fas fa-lock"></i>
	                              <input id="contra2" type="password" class="counter" data-validetta="required,maxLength[16],equalTo[contra]" data-length="16">
	                              <label for="contra2">Confirma la Contraseña</label>
	                            </div>
                        	</div>

                        </div>

                        <div id="soloEscom8">
                        <div class="row">
                        	<h5>Horario de Reparto</h5>
                        </div>

                        
                        <div class="row">
                        	<div id="horario1">
	                        	<div class="col s10 offset-s1 m10 offset-m1 l4 offset-l1">
	                        		<div class="input-field">
									    <select class="e8Required" name="dia1" data-validetta="">
									      <option value="" disabled selected>Elíge un día</option>
									      <option value="L">Lunes</option>
									      <option value="M">Martes</option>
									      <option value="W">Miércoles</option>
									      <option value="J">Jueves</option>
									      <option value="V">Viernes</option>
									    </select>
									    <label>Día</label>
									</div>
	                        	</div>
	                        	

	                    		<div class="col s2 offset-s2 m2 l1 center-align vertical-margin">
	                    			<p>De</p>
	                    		</div>

	                    		<div class="col s6 m4 l2">
	                    			<div class="input-field">
	                    				<input id="horaInicio1" name="horaInicio1" type="text" class="timepicker e8Required" data-validetta="">
	                    				<label for="horaInicio1"> Hora de Inicio </label>
	                    			</div>
	                    		</div>

	                    		<div class="col s2 offset-s2 m1 l1 center-align vertical-margin">
	                    			<p>A</p>
	                    		</div>

	                    		<div class="col s6 m4 l2">
	                    			<div class="input-field">
	                    				<input id="horaFin1" name="horaFin1" type="text" class="timepicker e8Required" data-validetta="">
	                    				<label for="horaFin1"> Hora de Final </label>
	                    			</div>
	                    		</div>
                    		</div>

                    		<div class="col s1 m1 l1 center-align vertical-margin">
                            	<i class="fas fa-plus"></i>
                            </div>

                        </div>

                        <div class="row">
                        	<div id="horario2"><!---------------------------------------------------->
	                        	<div class="col s10 offset-s1 m10 offset-m1 l4 offset-l1">
	                        		<div class="input-field">
									    <select  name="dia2"><!---------------------------------------->
									      <option value="" disabled selected>Elíge un día</option>
									      <option value="L">Lunes</option>
									      <option value="M">Martes</option>
									      <option value="W">Miércoles</option>
									      <option value="J">Jueves</option>
									      <option value="V">Viernes</option>
									    </select>
									    <label>Día</label>
									</div>
	                        	</div>
	                        	

	                    		<div class="col s2 offset-s2 m2 l1 center-align vertical-margin">
	                    			<p>De</p>
	                    		</div>

	                    		<div class="col s6 m4 l2">
	                    			<div class="input-field">
	                    				<input id="horaInicio2" name="horaInicio2" type="text" class="timepicker"><!---->
	                    				<label for="horaInicio2"> Hora de Inicio </label><!---------->
	                    			</div>
	                    		</div>

	                    		<div class="col s2 offset-s2 m1 l1 center-align vertical-margin">
	                    			<p>A</p>
	                    		</div>

	                    		<div class="col s6 m4 l2">
	                    			<div class="input-field">
	                    				<input id="horaFin2" name="horaFin2" type="text" class="timepicker"><!------>
	                    				<label for="horaFin2"> Hora de Final </label><!------------->
	                    			</div>
	                    		</div>
                    		

	                    		<div class="col s1 m1 l1 center-align vertical-margin">
	                            	<i class="fas fa-minus" id="minus2"></i><!-------------------------->
	                            </div>
	                        </div>
                        </div>

                        <div class="row">
                        	<div id="horario3"><!---------------------------------------------------->
	                        	<div class="col s10 offset-s1 m10 offset-m1 l4 offset-l1">
	                        		<div class="input-field">
									    <select  name="dia3"><!---------------------------------------->
									      <option value="" disabled selected>Elíge un día</option>
									      <option value="L">Lunes</option>
									      <option value="M">Martes</option>
									      <option value="W">Miércoles</option>
									      <option value="J">Jueves</option>
									      <option value="V">Viernes</option>
									    </select>
									    <label>Día</label>
									</div>
	                        	</div>
	                        	

	                    		<div class="col s2 offset-s2 m2 l1 center-align vertical-margin">
	                    			<p>De</p>
	                    		</div>

	                    		<div class="col s6 m4 l2">
	                    			<div class="input-field">
	                    				<input id="horaInicio3" name="horaInicio3" type="text" class="timepicker"><!---->
	                    				<label for="horaInicio3"> Hora de Inicio </label><!---------->
	                    			</div>
	                    		</div>

	                    		<div class="col s2 offset-s2 m1 l1 center-align vertical-margin">
	                    			<p>A</p>
	                    		</div>

	                    		<div class="col s6 m4 l2">
	                    			<div class="input-field">
	                    				<input id="horaFin3" name="horaFin3" type="text" class="timepicker"><!------>
	                    				<label for="horaFin3"> Hora de Final </label><!------------->
	                    			</div>
	                    		</div>
                    		

	                    		<div class="col s1 m1 l1 center-align vertical-margin">
	                            	<i class="fas fa-minus" id="minus3"></i><!-------------------------->
	                            </div>
                            </div>

                        </div>

                        <div class="row">
                        	<div id="horario4"><!---------------------------------------------------->
	                        	<div class="col s10 offset-s1 m10 offset-m1 l4 offset-l1">
	                        		<div class="input-field">
									    <select  name="dia4"><!---------------------------------------->
									      <option value="" disabled selected>Elíge un día</option>
									      <option value="L">Lunes</option>
									      <option value="M">Martes</option>
									      <option value="W">Miércoles</option>
									      <option value="J">Jueves</option>
									      <option value="V">Viernes</option>
									    </select>
									    <label>Día</label>
									</div>
	                        	</div>
	                        	

	                    		<div class="col s2 offset-s2 m2 l1 center-align vertical-margin">
	                    			<p>De</p>
	                    		</div>

	                    		<div class="col s6 m4 l2">
	                    			<div class="input-field">
	                    				<input id="horaInicio4" name="horaInicio4" type="text" class="timepicker"><!---->
	                    				<label for="horaInicio4"> Hora de Inicio </label><!---------->
	                    			</div>
	                    		</div>

	                    		<div class="col s2 offset-s2 m1 l1 center-align vertical-margin">
	                    			<p>A</p>
	                    		</div>

	                    		<div class="col s6 m4 l2">
	                    			<div class="input-field">
	                    				<input id="horaFin4" name="horaFin4" type="text" class="timepicker"><!------>
	                    				<label for="horaFin4"> Hora de Final </label><!------------->
	                    			</div>
	                    		</div>
                    		

	                    		<div class="col s1 m1 l1 center-align vertical-margin">
	                            	<i class="fas fa-minus" id="minus4"></i><!-------------------------->
	                            </div>
	                        </div>

                        </div>

                        <div class="row">
                        	<div id="horario5"><!---------------------------------------------------->
	                        	<div class="col s10 offset-s1 m10 offset-m1 l4 offset-l1">
	                        		<div class="input-field">
									    <select  name="dia5"><!---------------------------------------->
									      <option value="" disabled selected>Elíge un día</option>
									      <option value="L">Lunes</option>
									      <option value="M">Martes</option>
									      <option value="W">Miércoles</option>
									      <option value="J">Jueves</option>
									      <option value="V">Viernes</option>
									    </select>
									    <label>Día</label>
									</div>
	                        	</div>
	                        	

	                    		<div class="col s2 offset-s2 m2 l1 center-align vertical-margin">
	                    			<p>De</p>
	                    		</div>

	                    		<div class="col s6 m4 l2">
	                    			<div class="input-field">
	                    				<input id="horaInicio5" name="horaInicio5" type="text" class="timepicker"><!---->
	                    				<label for="horaInicio5"> Hora de Inicio </label><!---------->
	                    			</div>
	                    		</div>

	                    		<div class="col s2 offset-s2 m1 l1 center-align vertical-margin">
	                    			<p>A</p>
	                    		</div>

	                    		<div class="col s6 m4 l2">
	                    			<div class="input-field">
	                    				<input id="horaFin5" name="horaFin5" type="text" class="timepicker"><!------>
	                    				<label for="horaFin5"> Hora de Final </label><!------------->
	                    			</div>
	                    		</div>
                    		

	                    		<div class="col s1 m1 l1 center-align vertical-margin">
	                            	<i class="fas fa-minus" id="minus5"></i><!-------------------------->
	                            </div>
                            </div>

                        </div>

                        <div class="row">
                        	<div id="horario6"><!---------------------------------------------------->
	                        	<div class="col s10 offset-s1 m10 offset-m1 l4 offset-l1">
	                        		<div class="input-field">
									    <select  name="dia6"><!---------------------------------------->
									      <option value="" disabled selected>Elíge un día</option>
									      <option value="L">Lunes</option>
									      <option value="M">Martes</option>
									      <option value="W">Miércoles</option>
									      <option value="J">Jueves</option>
									      <option value="V">Viernes</option>
									    </select>
									    <label>Día</label>
									</div>
	                        	</div>
	                        	

	                    		<div class="col s2 offset-s2 m2 l1 center-align vertical-margin">
	                    			<p>De</p>
	                    		</div>

	                    		<div class="col s6 m4 l2">
	                    			<div class="input-field">
	                    				<input id="horaInicio6" name="horaInicio6" type="text" class="timepicker"><!---->
	                    				<label for="horaInicio6"> Hora de Inicio </label><!---------->
	                    			</div>
	                    		</div>

	                    		<div class="col s2 offset-s2 m1 l1 center-align vertical-margin">
	                    			<p>A</p>
	                    		</div>

	                    		<div class="col s6 m4 l2">
	                    			<div class="input-field">
	                    				<input id="horaFin6" name="horaFin6" type="text" class="timepicker"><!------>
	                    				<label for="horaFin6"> Hora de Final </label><!------------->
	                    			</div>
	                    		</div>
                    		

	                    		<div class="col s1 m1 l1 center-align vertical-margin">
	                            	<i class="fas fa-minus" id="minus6"></i><!-------------------------->
	                            </div>
                            </div>

                        </div>

                        <div class="row">
                        	<div id="horario7"><!---------------------------------------------------->
	                        	<div class="col s10 offset-s1 m10 offset-m1 l4 offset-l1">
	                        		<div class="input-field">
									    <select  name="dia7"><!---------------------------------------->
									      <option value="" disabled selected>Elíge un día</option>
									      <option value="L">Lunes</option>
									      <option value="M">Martes</option>
									      <option value="W">Miércoles</option>
									      <option value="J">Jueves</option>
									      <option value="V">Viernes</option>
									    </select>
									    <label>Día</label>
									</div>
	                        	</div>
	                        	

	                    		<div class="col s2 offset-s2 m2 l1 center-align vertical-margin">
	                    			<p>De</p>
	                    		</div>

	                    		<div class="col s6 m4 l2">
	                    			<div class="input-field">
	                    				<input id="horaInicio7" name="horaInicio7" type="text" class="timepicker"><!---->
	                    				<label for="horaInicio7"> Hora de Inicio </label><!---------->
	                    			</div>
	                    		</div>

	                    		<div class="col s2 offset-s2 m1 l1 center-align vertical-margin">
	                    			<p>A</p>
	                    		</div>

	                    		<div class="col s6 m4 l2">
	                    			<div class="input-field">
	                    				<input id="horaFin7" name="horaFin7" type="text" class="timepicker"><!------>
	                    				<label for="horaFin7"> Hora de Final </label><!------------->
	                    			</div>
	                    		</div>
	                    		
	                    		<div class="col s1 m1 l1 center-align vertical-margin">
	                            	<i class="fas fa-minus" id="minus7"></i><!-------------------------->
	                            </div>

                            </div>

                        </div>

                        <div class="row">
                        	<div id="horario8"><!---------------------------------------------------->
	                        	<div class="col s10 offset-s1 m10 offset-m1 l4 offset-l1">
	                        		<div class="input-field">
									    <select  name="dia8"><!---------------------------------------->
									      <option value="" disabled selected>Elíge un día</option>
									      <option value="L">Lunes</option>
									      <option value="M">Martes</option>
									      <option value="W">Miércoles</option>
									      <option value="J">Jueves</option>
									      <option value="V">Viernes</option>
									    </select>
									    <label>Día</label>
									</div>
	                        	</div>
	                        	

	                    		<div class="col s2 offset-s2 m2 l1 center-align vertical-margin">
	                    			<p>De</p>
	                    		</div>

	                    		<div class="col s6 m4 l2">
	                    			<div class="input-field">
	                    				<input id="horaInicio8" name="horaInicio8" type="text" class="timepicker"><!---->
	                    				<label for="horaInicio8"> Hora de Inicio </label><!---------->
	                    			</div>
	                    		</div>

	                    		<div class="col s2 offset-s2 m1 l1 center-align vertical-margin">
	                    			<p>A</p>
	                    		</div>

	                    		<div class="col s6 m4 l2">
	                    			<div class="input-field">
	                    				<input id="horaFin8" name="horaFin8" type="text" class="timepicker"><!------>
	                    				<label for="horaFin8"> Hora de Final </label><!------------->
	                    			</div>
	                    		</div>
                    		

	                    		<div class="col s1 m1 l1 center-align vertical-margin">
	                            	<i class="fas fa-minus" id="minus8"></i><!-------------------------->
	                            </div>
                            </div>

                        </div>

                        <div class="row">
                        	<div id="horario9"><!---------------------------------------------------->
	                        	<div class="col s10 offset-s1 m10 offset-m1 l4 offset-l1">
	                        		<div class="input-field">
									    <select  name="dia9"><!---------------------------------------->
									      <option value="" disabled selected>Elíge un día</option>
									      <option value="L">Lunes</option>
									      <option value="M">Martes</option>
									      <option value="W">Miércoles</option>
									      <option value="J">Jueves</option>
									      <option value="V">Viernes</option>
									    </select>
									    <label>Día</label>
									</div>
	                        	</div>
	                        	

	                    		<div class="col s2 offset-s2 m2 l1 center-align vertical-margin">
	                    			<p>De</p>
	                    		</div>

	                    		<div class="col s6 m4 l2">
	                    			<div class="input-field">
	                    				<input id="horaInicio9" name="horaInicio9" type="text" class="timepicker"><!---->
	                    				<label for="horaInicio9"> Hora de Inicio </label><!---------->
	                    			</div>
	                    		</div>

	                    		<div class="col s2 offset-s2 m1 l1 center-align vertical-margin">
	                    			<p>A</p>
	                    		</div>

	                    		<div class="col s6 m4 l2">
	                    			<div class="input-field">
	                    				<input id="horaFin9" name="horaFin9" type="text" class="timepicker"><!------>
	                    				<label for="horaFin9"> Hora de Final </label><!------------->
	                    			</div>
	                    		</div>
                    		

	                    		<div class="col s1 m1 l1 center-align vertical-margin">
	                            	<i class="fas fa-minus" id="minus9"></i><!-------------------------->
	                            </div>
                            </div>

                        </div>

                        <div class="row">
                        	<div id="horario10"><!---------------------------------------------------->
	                        	<div class="col s10 offset-s1 m10 offset-m1 l4 offset-l1">
	                        		<div class="input-field">
									    <select  name="dia10"><!---------------------------------------->
									      <option value="" disabled selected>Elíge un día</option>
									      <option value="L">Lunes</option>
									      <option value="M">Martes</option>
									      <option value="W">Miércoles</option>
									      <option value="J">Jueves</option>
									      <option value="V">Viernes</option>
									    </select>
									    <label>Día</label>
									</div>
	                        	</div>
	                        	

	                    		<div class="col s2 offset-s2 m2 l1 center-align vertical-margin">
	                    			<p>De</p>
	                    		</div>

	                    		<div class="col s6 m4 l2">
	                    			<div class="input-field">
	                    				<input id="horaInicio10" name="horaInicio1" type="text" class="timepicker"><!---->
	                    				<label for="horaInicio10"> Hora de Inicio </label><!---------->
	                    			</div>
	                    		</div>

	                    		<div class="col s2 offset-s2 m1 l1 center-align vertical-margin">
	                    			<p>A</p>
	                    		</div>

	                    		<div class="col s6 m4 l2">
	                    			<div class="input-field">
	                    				<input id="horaFin10" name="horaFin1" type="text" class="timepicker"><!------>
	                    				<label for="horaFin10"> Hora de Final </label><!------------->
	                    			</div>
	                    		</div>
                    		

	                    		<div class="col s1 m1 l1 center-align vertical-margin">
	                            	<i class="fas fa-minus" id="minus10"></i><!-------------------------->
	                            </div>
                            </div>

                        </div>

                        	

                    	</div>

                        <div class="row">
                        	
                        	<div class="col s12 m12 l12 center-align">
                        		<button class="btn-large waves-effect waves-light" type="submit" name="action">Registrarse
								    <i class="fas fa-user-plus"></i>
								</button>
                        	</div>

                        </div>
                        
                    </form>
             
				</div>

		</div>


	</main>

	<footer class = "page-footer">

	  <div class="container">
        <div class="row">
          <div class="col l6 s12">
            <h5 class="white-text">Footer Content</h5>
            <p class="white-text text-lighten-4">You can use rows and columns here to organize your footer content.</p>
          </div>
          <div class="col l4 offset-l2 s12">
            <h5 class="white-text">Contacto</h5>
            <ul>
              <li><a class="white-text" href="#!">Facebook</a></li>
              <li><a class="white-text" href="#!">Twitter</a></li>
              <li><a class="white-text" href="#!">Instagram</a></li>
              <li><a class="white-text" href="#!">Escom</a></li>
            </ul>
          </div>
        </div>
      </div>

      <div class="footer-copyright">
        <div class="container white-text">
        &copy; 2019 CRAYDS
        <a class="white-text text-lighten-4 right" href="#!">More Links</a>
        </div>
      </div>

	</footer>

<script type="text/javascript" src="libs/materialize/js/materialize.min.js"></script>
</body>

</html>

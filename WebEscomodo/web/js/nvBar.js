$(document).ready(
	function(){

		$('#small-sidenav').sidenav({
			preventScrolling: false,
			edge: 'left'
		});

		$('#user-sidenav').sidenav({
			preventScrolling: false,
			edge: 'right'
		});

		$.ajax({
			method: "post",
			url: "checarSesion.jsp",
			success: function(resp){
				var Jresp=$.parseJSON(resp);
				var mail = Jresp["mail"];
				var tipo = Jresp["tipo"];

				//$.alert(mail, tipo);

				if(mail == "0"){
					$(".btn-login-nav").show();
					$("#btn-user-nav").hide();
					$(".showOnRep").hide();
					$(".showOnCli").hide();
					$(".showOnCom").hide();
					$(".cerrar-ses").hide();
					$(".carr").show();
				} else {
					$(".btn-login-nav").hide();
					$("#btn-user-nav").show();

					$(".showOnRep").hide();
					$(".showOnCli").hide();
					$(".showOnCom").hide();

					if(tipo == "1"){
						$("#btn-verPerfil").attr("href", "perfilC.jsp");
						$("#btn-verPerfil-s").attr("href", "perfilC.jsp");
						$("#btn-hist-nav").attr("href", "perfilC.jsp");
						$("#btn-hist-nav-s").attr("href", "perfilC.jsp");
						$(".showOnCli").show();

					} else if(tipo == "2"){
						$("#btn-verPerfil").attr("href", "menu.jsp");
						$("#btn-verPerfil-s").attr("href", "menu.jsp");
						$(".showOnCom").show();

					} else if (tipo == "3") {
						$("#btn-verPerfil").attr("href", "perfilR.jsp");
						$("#btn-verPerfil-s").attr("href", "perfilR.jsp");
						$("#btn-hist-nav").attr("href", "perfilR.jsp");
						$("#btn-hist-nav-s").attr("href", "perfilR.jsp");
						$(".showOnRep").show();
					}
				}

			}
		});

		$(".cerrar-ses").on("click", function(){
			$.ajax({
				method: "post",
				url: "cerrarSession.jsp",
				success: function(res){
					window.location.replace("mainPage.jsp");
				}
			});

		});

	}
);
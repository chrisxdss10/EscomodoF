$(document).ready(
	function(){
		var eo = $("a#eo");
		var e8 = $("a#e8");
		var swch = $("label input#input-switch");

		var q = $("i.fa-question-circle");

		var plus = $("i.fa-plus");
		var solo8 = $("div#soloEscom8");
		var n = 1;

		var form = $("form#form-registro");

		$('.counter').characterCounter();

		form.validetta({
			showErrorMessages : true,
			display : 'bubble',
			bubblePosition: 'bottom',
  			bubbleGapLeft: 40,
  			bubbleGapTop: 5,
  			realTime : true,
  			onValid : function(){

  			}
		});

		if(swch.prop('checked')){
			//Cuando es Escom8
			eo.css('color', '#9C9C9C');
			e8.css('color', '#F54828');

			solo8.show();

			form.removeAttr('action');
			form.attr('action', '?acc=2');

			$(".e8Required").removeAttr('data-validetta');
			$(".e8Required").attr('data-validetta','required');

		} else {
			//Cuando es Escomensal
			eo.css('color', '#F54828');
			e8.css('color', '#9C9C9C');

			solo8.hide();

			form.removeAttr('action');
			form.attr('action', '?acc=1');

			$(".e8Required").removeAttr('data-validetta');
			$(".e8Required").attr('data-validetta','');
		}

		swch.on("click", function(){
			if(swch.prop('checked')){
				//Cuando es Escom8
				eo.css('color', '#9C9C9C');
				e8.css('color', '#F54828');

				form.removeAttr('action');
				form.attr('action', '?acc=2');

				solo8.show();

				$(".e8Required").removeAttr('data-validetta');
				$(".e8Required").attr('data-validetta','required');

			} else {
				//Cuando es Escomensal
				eo.css('color', '#F54828');
				e8.css('color', '#9C9C9C');

				solo8.hide();

				form.removeAttr('action');
				form.attr('action', '?acc=1');

				$(".e8Required").removeAttr('data-validetta');
				$(".e8Required").attr('data-validetta','');
			}
		});


		q.on("click", function(){
			$.alert({
			    title: '<div class="center-align"><h3>Escomensal</h3></div>',
			    content: '<div class="center-align"><img src="https://drive.google.com/uc?id=16Rcxa1Px6EJj6enn6ncbPAzMPu77KWeb"'+
			    'class = "responsive-img"></div><div class="center-align"><p>Un Escomensal es un usuario que podrá hacer pedidos, ' +
			    'calificar platillos y calificar repartidores a través de Escomodo.</p></div>',
			    boxWidth: '50%',
			    type: 'orange',
			    theme: 'material',
    			useBootstrap: false,
				buttons: {
			        Next: {
			        	text: 'Siguente',
			            btnClass: 'btn-red',
			            action: function(){
			            	$.alert({
							    title: '<div class="center-align"><h3>Escom8</h3></div>',
							    content: '<div class="center-align"><img src="https://drive.google.com/uc?id=1awvSanjZDgLaT8aWCkBMTqHehdJffe_E"'+
							    'class = "responsive-img" id="img-escom8"></div><div class="center-align"><p>Un Escom8 es un usuario que podrá '+
							    'ver los pedidos de los Escomensales y aceptarlos para poder repartirlos, al mismo tiempo que puede recibir su '+
							    'pago correspondiente a su servicio.',
							    boxWidth: '50%',
							    type: 'orange',
							    theme: 'material',
				    			useBootstrap: false,
								buttons: {
							        Entendido:{
							        	text: 'Entendido',
							        	btnClass: 'btn-red',
							        	action: function(){
							        	}
							        },
								}
							});
			            }
			        },

			        Entendido: function () {
			        },
			     	
				}
			});
		});

		$('select').formSelect();
		$('.timepicker').timepicker({twelveHour: false});

		$("#horario2").hide();
		$("#horario3").hide();
		$("#horario4").hide();
		$("#horario5").hide();
		$("#horario6").hide();
		$("#horario7").hide();
		$("#horario8").hide();
		$("#horario9").hide();
		$("#horario10").hide();

		plus.on("click", function(){
			n=n+1;
			switch(n){
				case 2:
					$("#horario2").show();
					break;
				case 3:
					$("#horario3").show();
					break;
				case 4:
					$("#horario4").show();
					break;
				case 5:
					$("#horario5").show();
					break;
				case 6:
					$("#horario6").show();
					break;
				case 7:
					$("#horario7").show();
					break;
				case 8:
					$("#horario8").show();
					break;
				case 9:
					$("#horario9").show();
					break;
				case 10:
					$("#horario10").show();
					break;
			}
		});

		$("i#minus2").on("click", function(){ $("#horario2").hide() });
		$("i#minus3").on("click", function(){ $("#horario3").hide() });
		$("i#minus4").on("click", function(){ $("#horario4").hide() });
		$("i#minus5").on("click", function(){ $("#horario5").hide() });
		$("i#minus6").on("click", function(){ $("#horario6").hide() });
		$("i#minus7").on("click", function(){ $("#horario7").hide() });
		$("i#minus8").on("click", function(){ $("#horario8").hide() });
		$("i#minus9").on("click", function(){ $("#horario9").hide() });
		$("i#minus10").on("click", function(){ $("#horario10").hide() });




	}
);
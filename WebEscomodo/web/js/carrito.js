$(document).ready(function(){

	$("#form2").hide();

	$(document).on("click", "#efectivo1", function () {	 
		$("#form1").show();
		$("#form2").hide();
                $("#efectivo2").prop("checked",true);
                $('#lugar2').text($('#lugar1').text());
	});

	$(document).on("click", "#paypal1", function () {	 
		$("#form1").hide();
		$("#form2").show();
                $("#paypal2").prop("checked",true);
                $('#lugar2').text($('#lugar1').text());
                $("#send-paypal").hide();
	});
        
        $(document).on("click", "#efectivo2", function () {	 
		$("#form1").show();
		$("#form2").hide();
                $("#efectivo1").prop("checked",true);
                $('#lugar1').text($('#lugar2').text());
	});

	$(document).on("click", "#paypal2", function () {	 
		$("#form1").hide();
		$("#form2").show();
                $("#paypal1").prop("checked",true);
                $('#lugar1').text($('#lugar2').text());
                $("#send-paypal").hide();
	});
        
        $("#form1").validetta({
                showErrorMessages : true,
                display : 'bubble',
                bubblePosition: 'bottom',
                bubbleGapLeft: 40,
                bubbleGapTop: 5,
                realTime : true,
                onValid : function(e){
                    var idEst= $("#btn-confirmar").attr("data-button-id");
                    var pt=$("#btn-confirmar").attr("data-pt");
                    var l=$("#lugar1").val();
                    var est=3;
                    e.preventDefault();
                     $.ajax({
                        method:"post",
                        url:"cambiarEstado.jsp",
                        data: jQuery.param({ idEst: idEst, pt: pt, 
                            l: l, est: est}),
                        success:function(resp){
                            var Jresp=$.parseJSON(resp);
                            if(Jresp["estado"]=="ok"){
                                $(location).attr('href',"compraExitosa.html");
                            }
                        },
                        error:function(){
                            $.alert({
                                title: 'Error en el servidor, int&eacute;ntelo m&aacute;s tarde',
                                content: '',
                                boxWidth: '400px',
                                type: 'orange',
                                theme: 'material',
                                useBootstrap: false,
                                buttons: {
                                    Entendido:{
                                        text: 'Entendido',
                                        btnClass: 'btn-red',
                                    },
                                }
                            });
                        }
                    });
                }
        });
        
        $("#form2").validetta({
                showErrorMessages : true,
                display : 'bubble',
                bubblePosition: 'bottom',
                bubbleGapLeft: 40,
                bubbleGapTop: 5,
                realTime : true,
                onValid : function(e){
                    var idEst= $("#btn-paypal").attr("data-button-id");
                    var pt=$("#btn-paypal").attr("data-pt");
                    var l=$("#lugar2").val();
                    var est=3;
                    e.preventDefault();
                     $.ajax({
                        method:"post",
                        url:"cambiarEstado.jsp",
                        async:true,
                        data: jQuery.param({ idEst: idEst, pt: pt, 
                            l: l, est: est}),
                        success:function(resp){
                            var Jresp=$.parseJSON(resp);
                            if(Jresp["estado"]=="ok"){
                                console.log("ok");
                                $("#btn-paypal").hide();
                                $("#lugar2").removeAttr("data-validetta");
                                $("#send-paypal").show();
                                
                            }
                        },
                        error:function(){
                            $.alert({
                                title: 'Error en el servidor, int&eacute;ntelo m&aacute;s tarde',
                                content: '',
                                boxWidth: '400px',
                                type: 'orange',
                                theme: 'material',
                                useBootstrap: false,
                                buttons: {
                                    Entendido:{
                                        text: 'Entendido',
                                        btnClass: 'btn-red',
                                    },
                                }
                            });
                        }
                    });
                }
        });
        
        $(document).on("click", ".remove", function(){
            $.ajax({
                method:"post",
                url:"eliminarCarrito.jsp",
                data: jQuery.param({ idP: $(this).attr("data-button-id")}),
                success:function(resp){
                    var Jresp=$.parseJSON(resp);
                    if(Jresp["estado"]=="removed"){
                        $.alert({
                            title: 'Producto retirado del pedido',
                            type: 'orange',
                            content: '',
                            icon: 'fas fa-utensils',
                            theme: 'material',
                            useBootstrap: false,
                            boxWidth: '400px',
                            buttons: {
                                Ok:{
                                    text: 'Ok',
                                    btnClass: 'btn-red',
                                },
                            },
                            onDestroy: function () {
                                location.reload();
                            },
                        });
                    }
                },
                error:function(){
                    $.alert({
                        title: 'Error en el servidor, int&eacute;ntelo m&aacute;s tarde',
                        content: '',
                        boxWidth: '400px',
                        type: 'orange',
                        theme: 'material',
                        useBootstrap: false,
                        buttons: {
                            Entendido:{
                                text: 'Entendido',
                                btnClass: 'btn-red',
                            },
                        }
		    });
                }
            })
        });
        
        $(document).on("click", "#btn-paypal", function(){
            
        });
});
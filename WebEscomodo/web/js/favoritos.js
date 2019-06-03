$(document).ready(function(){
   
    //funcion que checa el scroll de la página, verifica cuando se encuentra el "elem"
        function isScrolledIntoView(elem){
            if(elem.length>0){
                var docViewTop = $(window).scrollTop();
                var docViewBottom = docViewTop + $(window).height();
                var elemTop = $(elem).offset().top;
                var elemBottom = elemTop + $(elem).height();
                return ((elemBottom >= docViewTop) && (elemTop <= docViewBottom) && (elemBottom <= docViewBottom) && (elemTop >= docViewTop));
            }
        }
        //función que crea los elementos del tipo ".card.small.sticky-action"
        //por medio de ajax se imprime todo lo establecido en crearElementos.jsp
        function createElements(){
            var numItemsDisplayed = $('tr.generated').length;
            $('tr.scrollCreator').addClass('delete');
                $('tr').removeClass('scrollCreator');
                $.ajax({
                    method:"post",
                    url:"crearElementosFavs.jsp",
                    data:"numItemsDisplayed="+numItemsDisplayed,
                    success:function(resp){
                        $("tbody").append(resp);
                        if($("#continue").attr("data-continue")=="true"){
                            $("tbody").append("<tr class=\"scrollCreator\"></tr>");
                            $(".delete").remove();
                        }
                    },
                    error:function(){
                        $("div.my_container").append("<h3 class='header'>Error en el servidor, int&eacute;ntelo m&aacute;s tarde :(</h3>");
                    }
                    
                });    
        }
        
        function animacionCarrito(eltoDrag, target, shake){
            var cantidad= parseInt($(".minus").parent().children("p:first").text(),10);
            var imgclone = eltoDrag.clone()
            .offset({
                top: eltoDrag.offset().top,
                left: eltoDrag.offset().left
            })
            .css({
                'opacity': '0.5',
                'position': 'absolute',
                'height': eltoDrag.height() /2,
                'width': eltoDrag.width() /2,
                'z-index': '100'
            })
            .appendTo($('body'))
            .animate({
                'top': target.offset().top + 10,
                'left': target.offset().left + 15,
                'height': eltoDrag.height() /2,
                'width': eltoDrag.width() /2
            }, 1000, 'easeInOutExpo');

            if (shake) {
                setTimeout(function () {
                    target.effect("shake", {
                    times: 2
                }, 200);

                }, 1500);
            }

            imgclone.animate({
                'width': 0,
                'height': 0
            }, function () {
            $(this).detach()
            });
        }
        
        $(document).on("click", ".remove", function(){
            $.ajax({
                method:"post",
                url:"eliminarFavorito.jsp",
                data: jQuery.param({ idP: $(this).attr("data-button-id")}),
                success:function(resp){
                    var Jresp=$.parseJSON(resp);
                    if(Jresp["estado"]=="removed"){
                        $.alert({
                            title: 'Producto retirado de favoritos',
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
        
        
        /*!
            * jQuery lightweight Fly to
            * Author: @ElmahdiMahmoud
            * Licensed under the MIT license
        */
        $(document).on("click", ".add", function(){
            var elName=$(this).attr("data-namee");
            var idP=$(this).attr("data-button-id");
            var target=$("#cart");
            var shake=true;
            var eltoDrag = $(this).closest("tr.generated").find("img").eq(0);
            $.ajax({
                method: "post",
                url: "checarSesion.jsp",
                success: function(resp){
                        var Jresp=$.parseJSON(resp);
                        var mail = Jresp["mail"];
                        var tipo = Jresp["tipo"];


                        if(mail == "0" && tipo=="0"){
                            $.alert({
                                title: 'Error',
                                content: 'Debe iniciar sesi&oacute;n para crear un pedido',
                                boxWidth: '400px',
                                type: 'orange',
                                theme: 'material',
                                useBootstrap: false,
                                buttons: {
                                    Entendido:{
                                        text: 'Deseo iniciar sesi&oacute;n',
                                        btnClass: 'btn-red',
                                        action: function(){
                                            $(location).attr('href',"login.jsp");
                                        }
                                    },
                                    Cancelar:{
                                        text:'Cancelar'
                                    }
                                }
                            });
                        } else if(tipo == "1"){
                            if (eltoDrag) {
                                $.confirm({
                                    title: '<h4 class="header sound_waves_text">'+elName+'</h4>',
                                    type: 'orange',
                                    icon: 'fas fa-utensils',
                                    content: '<hr><div class="col s12"><div class="section"><h5 class'+
                                    '="header">Instrucciones especiales: </h5></div><div class="section">'+
                                    '<textarea id="textarea1" class="my_Area" autofocus></textarea></div>'+
                                    '<h5 class="one-line">Cantidad:</h5><button class="ultrasonic_motion btn-flat plus"'+
                                    ' data-button-id="'+elName+'"><i class="fas fa-plus"></i></button><p '+
                                    'class="flow-text one-line cantidad" data-q-id="'+elName+'">1</p><button'+
                                    ' class="ultrasonic_motion btn-flat minus"'+
                                    ' data-button-id="'+elName+'"><i class="fas fa-minus"></i></button></div>',
                                    buttons: {
                                        confirmar: {
                                            text: 'Confirmar',
                                            btnClass: 'btn-red',
                                            action: function(){
                                                var cantidad=$(".cantidad").text();
                                                var instrucciones=$("#textarea1").val();
                                                $.ajax({
                                                    method:"post",
                                                    url:"agregarCarrito.jsp",
                                                    data: jQuery.param({ idP:idP , cantidad:cantidad, instrucciones: instrucciones}),
                                                    success:function(resp){
                                                        var Jresp=$.parseJSON(resp);
                                                        if(Jresp["estado"]=="added"){
                                                            $.alert({
                                                                title: '&iexcl;Producto agregado!',
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
                                                                    animacionCarrito(eltoDrag, target, shake);
                                                                },
                                                            });
                                                        }
                                                        else if(Jresp["estado"]=="repeated"){
                                                            $.alert({
                                                                title: "Elemento no agregado",
                                                                type: 'orange',
                                                                content: 'El producto ya est&aacute; en el carrito',
                                                                icon: 'fas fa-utensils',
                                                                theme: 'material',
                                                                useBootstrap: false,
                                                                boxWidth: '400px',
                                                                buttons: {
                                                                    nuevo:{
                                                                        text: 'Crear nuevo pedido',
                                                                        btnClass: 'btn-red',
                                                                        action:function(){
                                                                            $.ajax({
                                                                                method:"post",
                                                                                url:"vaciarCarrito.jsp",
                                                                                data: jQuery.param({ idP:idP , cantidad:cantidad, instrucciones: instrucciones}),
                                                                                success: function(resp){
                                                                                     var Jresp=$.parseJSON(resp);
                                                                                        if(Jresp["estado"]=="removed"){
                                                                                            if(Jresp["estado"]=="added"){
                                                                                            $.alert({
                                                                                                title: '&iexcl;Producto agregado!',
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
                                                                                                    animacionCarrito(eltoDrag, target, shake);
                                                                                                },
                                                                                            });
                                                                                        }
                                                                                        }
                                                                                        else{
                                                                                            $.alert({
                                                                                                title: 'No se ha completado la operación',
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
                                                                    },
                                                                    cancelar:{
                                                                        text:'Cancelar'
                                                                    }
                                                                }
                                                            });
                                                        }
                                                        else{
                                                            $.alert({
                                                                title: "Elemento no agregado",
                                                                type: 'orange',
                                                                content: 'Ya tiene un pedido en '+Jresp["estado"]+ ". &iquest;Desea eliminarlo?",
                                                                icon: 'fas fa-utensils',
                                                                theme: 'material',
                                                                useBootstrap: false,
                                                                boxWidth: '400px',
                                                                buttons: {
                                                                    nuevo:{
                                                                        text: 'Crear nuevo pedido',
                                                                        btnClass: 'btn-red',
                                                                        action:function(){
                                                                            $.ajax({
                                                                                method:"post",
                                                                                url:"vaciarCarrito.jsp",
                                                                                data: jQuery.param({ idP:idP , cantidad:cantidad, instrucciones: instrucciones}),
                                                                                success: function(resp){
                                                                                     var Jresp=$.parseJSON(resp);
                                                                                        if(Jresp["estado"]=="removed"){
                                                                                            if(Jresp["estado"]=="added"){
                                                                                            $.alert({
                                                                                                title: '&iexcl;Producto agregado!',
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
                                                                                                    animacionCarrito(eltoDrag, target, shake);
                                                                                                },
                                                                                            });
                                                                                        }
                                                                                        }
                                                                                        else{
                                                                                            $.alert({
                                                                                                title: 'No se ha completado la operación',
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
                                                                    },
                                                                    cancelar:{
                                                                        text:'Cancelar'
                                                                    }
                                                                }
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
                                                }); 
                                            }
                                        },
                                        cancelar: function () {
                                            $.alert({
                                                title: "Elemento no agregado",
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
                                                }
                                            });
                                        },
                                    }
                                });
                            }
                        }  
                }
            }); 
        });
        
        $(document).on("click",".plus",function(){
            var platillo = $(this).attr("data-button-id");
            var cantidad= parseInt($(this).parent().children("p:first").text(),10);
            $(this).parent().children("p:first").text(cantidad+1)
        });

        $(document).on("click",".minus",function(){
            var platillo = $(this).attr("data-button-id");
            var cantidad= parseInt($(this).parent().children("p:first").text(),10);
            if(cantidad>1){
            	$(this).parent().children("p:first").text(cantidad-1)
            }
        });
        
        createElements();
        
        
});
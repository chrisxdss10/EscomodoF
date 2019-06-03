$(document).ready(function(){
//FUNCIONES
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
            var numItemsDisplayed = $('.card.small.sticky-action').length;
            var cad = document.getElementById("busqueda").value;
            $('div.scrollCreator').addClass('delete');
                $('div').removeClass('scrollCreator');
                $.ajax({
                    method:"post",
                    url:"crearElementosSearchE.jsp",
                    data:jQuery.param({ numItemsDisplayed: numItemsDisplayed, cad : cad}),
                    success:function(resp){
                        $(".row.establecimientos").append(resp);
                        if($("#continue").attr("data-continue")=="true"){
                            $("div.my_container").append("<div class=\"scrollCreator\"></div>");
                            $(".delete").remove();
                        }
                    },
                    error:function(){
                        $("div.my_container").append("<h3 class='header'>Error en el servidor, int&eacute;ntelo m&aacute;s tarde :(</h3>");
                    }
                    
                });    
        }

        
//JQUERY    
        
        $(window).scroll(function() {    
            if(isScrolledIntoView($('.scrollCreator'))){
                createElements();
            }    
        });
        

	$(document).on("mouseenter",".activator",function(){
  		$(this).css("cursor", "pointer");
  	});
        
        

    
    //LLAMADAS A FUNCIONES
        createElements();

});
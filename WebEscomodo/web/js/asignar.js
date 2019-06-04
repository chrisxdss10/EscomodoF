/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function(){
    $(document).on("click", ".tom", function(){
        var idPed=$(this).attr("data-iddd");
        var cli=$(this).attr("data-cli");
        var com=$(this).attr("data-com");
        var fecha=$(this).attr("data-fecha");
        var hora=$(this).attr("data-hora");
        var total=$(this).attr("data-tot");
        var lugar=$(this).attr("data-lugar");
            $.confirm({
                    title: '',
                    icon: 'fas fa-hotdog',
                    content: '<br><div class="row center-align"><span class="col s12 m12 l12 flow-text">Tomar pedido</span></div>'+
                                '<br> <br> \n\
                                <div class="row center-align">Recuerde no tardar mucho tiempo en su entrega, los escomensales lo esperan.</div> <br><br>',
                    buttons: {
                    Ok: function calificarPlatillo(){
//                    alert(idPed);
//                    alert(cli);
//                    alert(com);
//                    alert(fecha);
//                    alert(hora);
//                    alert(total);
//                    alert(lugar);
                    $.ajax({
                        type:"POST",
                        url: "asignarpedidos.jsp",
                        data: jQuery.param({idP: idPed, clie: cli, come :com, fec: fecha, hor: hora, tot: total, lug:lugar}),
                    success:function(){
                        window.location.replace("perfilR.jsp");
                    },
                    error:function(){
                        alert("error");
                    }
                    });
                    },
                    cancelar: function () {
                        $.alert({
                            title: "",
                            content: '<br><div class="row center-align"><span class="col s12 m12 l12 flow-text">Recuerda que puedes tomar cualquier pedido</span></div>',
                            icon: 'fas fa-bacon',
                            theme: 'material',
                            useBootstrap: false,
                            boxWidth: '400px'
                        });
                    }
                    }

                });
    });
    $(document).on("click", ".term", function(){
            var idPed=$(this).attr("data-iddd");
            var cli=$(this).attr("data-cli");
            var com=$(this).attr("data-com");
            var fecha=$(this).attr("data-fecha");
            var hora=$(this).attr("data-hora");
            var total=$(this).attr("data-tot");
            var lugar=$(this).attr("data-lugar");
            $.confirm({
                    title: '',
                    icon: 'fas fa-hotdog',
                    content: '<br><div class="row center-align"><span class="col s12 m12 l12 flow-text">PEDIDO COMPLETADO</span></div>'+
                                '<br> <br><div class="row center-align">Buen trabajo, un pedido más.\n\
            Busca más pedidos disponibles</div><br><br>',
                    buttons: {
                    Ok: function terminarPedido() {
                    $.ajax({
                        type:"POST",
                        url: "terminapedido.jsp",
                        data: jQuery.param({ idP: idPed, clie: cli, come :com, fec: fecha, hor: hora, tot: total, lug:lugar  }),
                    success:function(){
                        $('[data-iddd="'+idPed+'"]').hide();
                        window.location.replace("pedidosA.jsp");
                    },
                    error:function(){
                        alert("error");
                    }
                    });
                    },
                    cancelar: function () {
                        
                    }
                    }

                });
    });
});


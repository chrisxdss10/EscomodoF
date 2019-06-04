/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.collapsible');
    var instances = M.Collapsible.init(elems);
});
$(document).ready(function(){
    var val;
    $(document).on("click", ".cal", function(){
        var idPed=$(this).attr("data-iddd");
            $.confirm({
                    title: '',
                    icon: 'fas fa-hotdog',
                    content: '<br><div class="row center-align"><span class="col s12 m12 l12 flow-text">Califica este platillo:</span></div>'+
                                '<br> <br> <div class="row center-align">'+
                                '<i id="cookie1" class="fa fa-5x fa-cookie cookie1"></i>'+
                                '<i id="cookie2" class="fa fa-5x fa-cookie cookie2"></i>'+
                                '<i id="cookie3" class="fa fa-5x fa-cookie cookie3"></i>'+
                                '<i id="cookie4" class="fa fa-5x fa-cookie cookie4"></i>'+
                                '<i id="cookie5" class="fa fa-5x fa-cookie cookie5"></i>'+
                            '</div><br><br>',
                    buttons: {
                    Ok: function calificarPlatillo(){
                    $.ajax({
                        type:"POST",
                        url: "calificarpedido.jsp",
                        data: jQuery.param({ idP: idPed , cali: val}),
                    success:function(){
                        $('[data-iddd="'+idPed+'"]').hide();
                        $.alert({
                            title: "",
                            content: '<br><div class="row center-align"><span class="col s12 m12 l12 flow-text">Gracias, tu opinión es tomada en cuenta</span></div>',
                            icon: 'fas fa-pizza-slice',
                            theme: 'material',
                            useBootstrap: false,
                            boxWidth: '400px'
                        });
                    },
                    error:function(){
                        alert("error");
                    }
                    });
                    },
                    cancelar: function () {
                        $.alert({
                            title: "",
                            content: '<br><div class="row center-align"><span class="col s12 m12 l12 flow-text">Califica en otro momento, tu opinión es importante</span></div>',
                            icon: 'fas fa-bacon',
                            theme: 'material',
                            useBootstrap: false,
                            boxWidth: '400px'
                        });
                    }
                    }

                });
    });
    $(document).on("click", ".valR", function(){
            var idPed=$(this).attr("data-idd");
            var cli=$(this).attr("data-cli");
            var com=$(this).attr("data-com");
            var fecha=$(this).attr("data-fecha");
            var hora=$(this).attr("data-hora");
            var total=$(this).attr("data-tot");
            var lugar=$(this).attr("data-lugar");
            $.confirm({
                    title: '',
                    icon: 'fas fa-hotdog',
                    content: '<br><div class="row center-align"><span class="col s12 m12 l12 flow-text">Califica tu experiencia con el repartidor:</span></div>'+
                                '<br> <br> <div class="row center-align">'+
                                '<i id="cookie1" class="fa fa-5x fa-cookie cookie1"></i>'+
                                '<i id="cookie2" class="fa fa-5x fa-cookie cookie2"></i>'+
                                '<i id="cookie3" class="fa fa-5x fa-cookie cookie3"></i>'+
                                '<i id="cookie4" class="fa fa-5x fa-cookie cookie4"></i>'+
                                '<i id="cookie5" class="fa fa-5x fa-cookie cookie5"></i>'+
                            '</div><br><br>',
                    buttons: {
                    Ok: function calificarRepartidor() {
                    $.ajax({
                        type:"POST",
                        url: "calificarRep.jsp",
                        data: jQuery.param({idP: idPed, cali: val, clie: cli, come :com, fec: fecha, hor: hora, tot: total, lug:lugar}),
                    success:function(){
                        $('[data-idd="'+idPed+'"]').hide();
                        $.alert({
                            title: "",
                            content: '<br><div class="row center-align"><span class="col s12 m12 l12 flow-text">Gracias, tu opinión es tomada en cuenta</span></div>',
                            icon: 'fas fa-pizza-slice',
                            theme: 'material',
                            useBootstrap: false,
                            boxWidth: '400px'
                        });
                    },
                    error:function(){
                        alert("error");
                    }
                    });
                    },
                    cancelar: function () {
                        $.alert({
                            title: "",
                            content: '<br><div class="row center-align"><span class="col s12 m12 l12 flow-text">Califica en otro momento, tu opinión es importante</span></div>',
                            icon: 'fas fa-bacon',
                            theme: 'material',
                            useBootstrap: false,
                            boxWidth: '400px'
                        });
                    }
                    }

                });
    });
    $(document).on("click",".cookie1", function(){
            document.getElementById('cookie1').className="fas fa-cookie-bite fa-5x cookie1";
            document.getElementById('cookie2').className="fas fa-cookie fa-5x cookie2";
            document.getElementById('cookie3').className="fas fa-cookie fa-5x cookie3";
            document.getElementById('cookie4').className="fas fa-cookie fa-5x cookie4";
            document.getElementById('cookie5').className="fas fa-cookie fa-5x cookie5";
            val= 1;
    });
    $(document).on("click",".cookie2", function(){
            document.getElementById('cookie1').className="fas fa-cookie-bite fa-5x cookie1";
            document.getElementById('cookie2').className="fas fa-cookie-bite fa-5x cookie2";
            document.getElementById('cookie3').className="fas fa-cookie fa-5x cookie3";
            document.getElementById('cookie4').className="fas fa-cookie fa-5x cookie4";
            document.getElementById('cookie5').className="fas fa-cookie fa-5x cookie5";
            val = 2;
    });
    $(document).on("click",".cookie3", function(){
            document.getElementById('cookie1').className="fas fa-cookie-bite fa-5x cookie1";
            document.getElementById('cookie2').className="fas fa-cookie-bite fa-5x cookie2";
            document.getElementById('cookie3').className="fas fa-cookie-bite fa-5x cookie3";
            document.getElementById('cookie4').className="fas fa-cookie fa-5x cookie4";
            document.getElementById('cookie5').className="fas fa-cookie fa-5x cookie5";
            val = 3;
    });
    $(document).on("click",".cookie4", function(){
            document.getElementById('cookie1').className="fas fa-cookie-bite fa-5x cookie1";
            document.getElementById('cookie2').className="fas fa-cookie-bite fa-5x cookie2";
            document.getElementById('cookie3').className="fas fa-cookie-bite fa-5x cookie3";
            document.getElementById('cookie4').className="fas fa-cookie-bite fa-5x cookie4";
            document.getElementById('cookie5').className="fas fa-cookie fa-5x cookie5";
            val = 4;
    });
    $(document).on("click",".cookie5", function(){
            document.getElementById('cookie1').className="fas fa-cookie-bite fa-5x cookie1";
            document.getElementById('cookie2').className="fas fa-cookie-bite fa-5x cookie2";
            document.getElementById('cookie3').className="fas fa-cookie-bite fa-5x cookie3";
            document.getElementById('cookie4').className="fas fa-cookie-bite fa-5x cookie4";
            document.getElementById('cookie5').className="fas fa-cookie-bite fa-5x cookie5";
            val = 5;
    });
    $(document).on("mouseenter",".cookie1", function(){
            document.getElementById('cookie1').className="fas fa-cookie-bite fa-5x cookie1";
            document.getElementById('cookie2').className="fas fa-cookie fa-5x cookie2";
            document.getElementById('cookie3').className="fas fa-cookie fa-5x cookie3";
            document.getElementById('cookie4').className="fas fa-cookie fa-5x cookie4";
            document.getElementById('cookie5').className="fas fa-cookie fa-5x cookie5";
            val = 1;
    });
    $(document).on("mouseenter",".cookie2", function(){
            document.getElementById('cookie1').className="fas fa-cookie-bite fa-5x cookie1";
            document.getElementById('cookie2').className="fas fa-cookie-bite fa-5x cookie2";
            document.getElementById('cookie3').className="fas fa-cookie fa-5x cookie3";
            document.getElementById('cookie4').className="fas fa-cookie fa-5x cookie4";
            document.getElementById('cookie5').className="fas fa-cookie fa-5x cookie5";
            val = 2;
    });
    $(document).on("mouseenter",".cookie3", function(){
            document.getElementById('cookie1').className="fas fa-cookie-bite fa-5x cookie1";
            document.getElementById('cookie2').className="fas fa-cookie-bite fa-5x cookie2";
            document.getElementById('cookie3').className="fas fa-cookie-bite fa-5x cookie3";
            document.getElementById('cookie4').className="fas fa-cookie fa-5x cookie4";
            document.getElementById('cookie5').className="fas fa-cookie fa-5x cookie5";
            val = 3;
    });
    $(document).on("mouseenter",".cookie4", function(){
            document.getElementById('cookie1').className="fas fa-cookie-bite fa-5x cookie1";
            document.getElementById('cookie2').className="fas fa-cookie-bite fa-5x cookie2";
            document.getElementById('cookie3').className="fas fa-cookie-bite fa-5x cookie3";
            document.getElementById('cookie4').className="fas fa-cookie-bite fa-5x cookie4";
            document.getElementById('cookie5').className="fas fa-cookie fa-5x cookie5";
            val = 4;
    });
    $(document).on("mouseenter",".cookie5", function(){
            document.getElementById('cookie1').className="fas fa-cookie-bite fa-5x cookie1";
            document.getElementById('cookie2').className="fas fa-cookie-bite fa-5x cookie2";
            document.getElementById('cookie3').className="fas fa-cookie-bite fa-5x cookie3";
            document.getElementById('cookie4').className="fas fa-cookie-bite fa-5x cookie4";
            document.getElementById('cookie5').className="fas fa-cookie-bite fa-5x cookie5";
            val = 5;
    });
});
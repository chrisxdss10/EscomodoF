$(document).ready(function(){
    
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
});



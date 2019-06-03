$(document).ready(
	function(){
        $('.psw').hide();
        var plus = $("i.fa-plus");
	var n = 1;
        var solo8 = $("div#soloEscom8");
        solo8.hide();
//            $(function() {
//                $('#img').change(function(e) {
//                  addImage(e); 
//                 });
//
//                 function addImage(e){
//                  var file = e.target.files[0],
//                  imageType = /image.*/;
//
//                  if (!file.type.match(imageType))
//                   return;
//
//                  var reader = new FileReader();
//                  reader.onload = fileOnload;
//                  reader.readAsDataURL(file);
//                 }
//
//                 function fileOnload(e) {
//                  var result=e.target.result;
//                  $('#foto-insert').attr("src",result);
//                 }
//            });
            
            $(document).on("click", ".show", function () {
                $('.show').hide();
                $('.cc').val('');
                $('.psw').show();
            });
            
		$('select').formSelect();
		$('.timepicker').timepicker({twelveHour: false});

		$("#horario1").hide();
		$("#horario2").hide();
		$("#horario3").hide();
		$("#horario4").hide();
		$("#horario5").hide();
		$("#horario6").hide();
		$("#horario7").hide();
		$("#horario8").hide();
		$("#horario9").hide();
		$("#horario10").hide();
                
                $("#mhor").on("click", function(){
                    solo8.show();
                    $("#horario1").show();
                    $(this).hide();
                    
                });
                
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

		$("i#minus2").on("click", function(){ $("#horario2").hide(); });
		$("i#minus3").on("click", function(){ $("#horario3").hide(); });
		$("i#minus4").on("click", function(){ $("#horario4").hide(); });
		$("i#minus5").on("click", function(){ $("#horario5").hide(); });
		$("i#minus6").on("click", function(){ $("#horario6").hide(); });
		$("i#minus7").on("click", function(){ $("#horario7").hide(); });
		$("i#minus8").on("click", function(){ $("#horario8").hide(); });
		$("i#minus9").on("click", function(){ $("#horario9").hide(); });
		$("i#minus10").on("click", function(){ $("#horario10").hide(); });




	}
);
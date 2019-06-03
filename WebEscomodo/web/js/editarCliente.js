$(document).ready(
    function(){
        $('.psw').hide();
        $(function() {
            $('#img').change(function(e) {
              addImage(e); 
             });

             function addImage(e){
              var file = e.target.files[0],
              imageType = /image.*/;

              if (!file.type.match(imageType))
               return;

              var reader = new FileReader();
              reader.onload = fileOnload;
              reader.readAsDataURL(file);
             }

             function fileOnload(e) {
              var result=e.target.result;
              $('#foto-insert').attr("src",result);
             }
        });
        $(document).on("click", ".show", function () {
            $('.show').hide();
            $('.cc').val('');
            $('.psw').show();
        })
  });


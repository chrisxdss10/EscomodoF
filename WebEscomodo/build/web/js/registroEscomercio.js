$(document).ready(
	function(){
		$('.timepicker').timepicker({twelveHour: false});

		$('.counter').characterCounter();

		$("#formRE").validetta({
			showErrorMessages : true,
			display : 'bubble',
			bubblePosition: 'bottom',
  			bubbleGapLeft: 40,
  			bubbleGapTop: 5,
  			realTime : true,
  			onValid : function(){

  			}
		});
	}
);
$(document).ready(
	function(){

		var wind = $(window);
		var ulBig = $("ul.contacts-big");
		var ulSmall = $("ul.contacts-small");

		if(wind.width() > 992){
			ulBig.show();
			ulSmall.hide();
		} else {
			ulBig.hide();
			ulSmall.show();
		}

		wind.resize(function(){
			if(wind.width() > 975){
				ulBig.show();
				ulSmall.hide();
			} else {
				ulBig.hide();
				ulSmall.show();
			}
		});

	}
);

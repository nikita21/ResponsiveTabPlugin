(function ($) {
 $.fn.transform = function(options) {
 
	var settings = $.extend({
		action: "convertToTabs"
	},options);
 
	if(settings.action === "convertToTabs") {
	
		return this.each(function() {
			var pid = $(this).attr('id');
			if(pid !== undefined) {
					$('nav ul').append("<li><a href=\"#"+pid+"\">"+pid+"</a></li>");
					var className = $("#"+pid).attr('class');
					$("."+className).hide();
					$("."+className+":first").show();
					$('#tabs a:first').addClass('current');
					$('#tabs a').bind('click', function(e){
						$('#tabs a.current').removeClass('current');
						$('.'+className).hide();
						$(this.hash).show();
						$(this).addClass('current');
						e.preventDefault();
					});	
			}
		});
	}
	
	if(settings.action === "convertToDropdown") {
		return this.each(function() {
			var el = $(this);
			$("<option />", {
				"value"   : el.attr("href"),
				"text"    : el.text()
			}).appendTo("nav select");
		});
	}
 };
}(jQuery));

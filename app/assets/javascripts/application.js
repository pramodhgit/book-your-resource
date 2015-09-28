// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {
	$("form#new_booking > button").on("click", function(e) {
		e.preventDefault();
		var start_at = $("form#new_booking input#start_at").val();
		var end_at = $("form#new_booking input#end_at").val();

		$.ajax("/bookings", {
			data: {
				booking: {
					start_at: start_at,
					end_at: end_at,
				}
			},
			method: "POST",
			dataType: "json"
		}).done(function(resp) {
			window.location = location.href;
		}).fail(function(resp) {
			console.log("error");
			var err = resp.responseJSON;
			alert(err.start_at[0]);
			alert(err.end_at[0]);
		})
	});

	$(".edit-btn").on("click", function(e) {
		var bkId = $(e.target).data("id");
		$("#edit-row-" + bkId).toggle();
	});

	$(".edit-row").hide();

});

	
	
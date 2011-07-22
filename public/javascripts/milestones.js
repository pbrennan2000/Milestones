var $j = jQuery.noConflict();
var jQT = $j.jQTouch({
	icon: 'images/milestone_logo.png',
	startupScreen: 'images/milestone_splashscreen.png',
	addGlossToIcon: true, 
	statusBar: 'black',
	initialPageId: 'home',
	preloadImages: []
});

/*
$j(document).ready(function($) {
	// put a prevent default handler on the delete button and instead, build up
	// a restful form for posting to the milestones
	$('body').bind('change', function(e) {
		if ($(e.target).is("#name1")) {
			alert($("#name1").val());
		}
	});

});
*/

var dateId = "milestone_date"; // default the one we will use most often

function openDate(id) {
	var now = new Date();
	var days = { };
	var years = { };
	var months = { 
		  0: 'Jan'
		, 1: 'Feb'
		, 2: 'Mar'
		, 3: 'Apr'
		, 4: 'May'
		, 5: 'Jun'
		, 6: 'Jul'
		, 7: 'Aug'
		, 8: 'Sep'
		, 9: 'Oct'
		, 10: 'Nov'
		, 11: 'Dec' 
	};

	// set the date id to the correct element we are using for the wheel
	dateId = id;
	
	for( var i = 1; i < 32; i += 1 ) {
		days[i] = i;
	}

	for( i = now.getFullYear()-100; i < now.getFullYear()+1; i += 1 ) {
		years[i] = i;
	}
	

	SpinningWheel.addSlot(years, 'right', now.getFullYear());
	SpinningWheel.addSlot(months, '', now.getMonth());
	SpinningWheel.addSlot(days, 'right', now.getDate());

	SpinningWheel.setCancelAction(cancel);
	SpinningWheel.setDoneAction(done);

	SpinningWheel.open();
}

function done() {
	var results = SpinningWheel.getSelectedValues();
	$("#" + dateId).val(results.values[1] + " " + results.values[2] + ", " + results.values[0]);
	SpinningWheel.close();
}

function cancel() {
	SpinningWheel.close();
}

function check_add_new() {
//	if ($("#name1").val() == "Add New") {
		// remove the hidden attribute for name 2 and move the focus
//		$("#name2").attr("hidden", "false");
		
		// Make the select box hidden 
		$("#name1").hide();
//	}
}

window.addEventListener('load', function(){ setTimeout(function(){ window.scrollTo(0,0); }, 100); }, true);
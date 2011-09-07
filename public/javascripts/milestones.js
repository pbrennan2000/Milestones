var $j = jQuery.noConflict();
var jQT = $j.jQTouch({
	icon: 'images/milestone_logo.png',
	startupScreen: 'images/milestone_splashscreen.png',
	addGlossToIcon: true, 
	statusBar: 'black',
	initialPageId: 'home',
	preloadImages: []
});


$j(document).ready(function($) {

	$('#createEntry').live('pageAnimationEnd', function() {
		$('#editEntry').remove();

		// Make sure that name2 is hidden
		toggleElements("#name2", "#name1", "name", "milestone[name]", $);
	});
	
	$('#editEntry').live('pageAnimationEnd', function() {
		$('#createEntry').remove();
		toggleElements("#name2", "#name1", "name", "milestone[name]", $);
	});
	
	$('#useExisting').live('click', function() {
		toggleElements("#name2", "#name1", "name", "milestone[name]", $);
	});
	
	$('#name1').live('change', function() {
		if ($(this).val() == "1") {
			toggleElements('#name1', '#name2', "name", "milestone[name]", $);
		}
	});
});


function toggleElements(el1, el2, attrName, attrVal, $) {	
	$(el1).attr(attrName, "tmp");
	$(el2).attr(attrName, attrVal);
	
	// Now hide el1 parent container and show el2 parent container
	$(el1).closest("div").hide();
	$(el2).closest("div").show();
}
	
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
	for( var z = 1; z < 32; z += 1 ) {
		days[z] = z;
	}

	for( var p = now.getFullYear()-100; p < now.getFullYear()+1; p += 1 ) {
		years[p] = p;
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
	$j("#" + dateId).val(results.values[1] + " " + results.values[2] + ", " + results.values[0]);
	SpinningWheel.close();
}

function cancel() {
	SpinningWheel.close();
}

window.addEventListener('load', function(){ setTimeout(function(){ window.scrollTo(0,0); }, 100); }, true);

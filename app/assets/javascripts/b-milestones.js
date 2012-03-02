$(document).ready(function($) {

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

$(document).bind("mobileinit", function() {
	$.mobile.touchOverflowEnabled = true;
});

function toggleElements(el1, el2, attrName, attrVal, $) {	
	$(el1).attr(attrName, "tmp");
	$(el2).attr(attrName, attrVal);
	
	// Now hide el1 parent container and show el2 parent container
	$(el1).closest("div").hide();
	$(el2).closest("div").show();
}
	
window.addEventListener('load', function(){ setTimeout(function(){ window.scrollTo(0,0); }, 100); }, true);

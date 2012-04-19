# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->

	$.ctrl('S', () =>
		$(".ctrl").submit();
	)

	$(".sortable").sortable({items: "li:not(.ui-state-disabled)"});

	$('body').tooltip({
	  selector: "a[rel=tooltip]",
	  placement: "right"
	});
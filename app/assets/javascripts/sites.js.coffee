# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->

	$.ctrl('S', () =>
		$(".ctrl").submit();
	)

# $(".sortable").sortable({items: "li:not(.ui-state-disabled)"});
	jQuery ->
  $('.sortable').sortable
    axis: 'y'
    items: "li:not(.ui-state-disabled)"
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))

	$('body').tooltip({
	  selector: "a[rel=tooltip]",
	  placement: "right"
	});
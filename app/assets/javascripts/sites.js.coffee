# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->

	jQuery ->
  $('.sortable').sortable
    axis: 'y'
    items: "li:not(.ui-state-disabled)"
    placeholder: "drop-placeholder"
    stop: ->
    	$('#saving-indicator').css('display', 'inline').delay(500).fadeOut('slow')
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'), ->
      	$('#saving-indicator').fadeOut('slow')
      	$('li.page').children('a').children('i').removeClass('icon-home').addClass('icon-file')
      	$('li.page:first').children('a').children('i').removeClass('icon-file').addClass('icon-home')
      )

	$('body').tooltip({
	  selector: "a[rel=tooltip]",
	  placement: "right"
	});
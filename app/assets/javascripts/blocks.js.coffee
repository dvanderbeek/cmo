# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('.blocks').sortable
  	connectWith: '.blocks'
  	cancel: '.aloha'
  	revert: true
  	opacity: 0.4
  	helper: 'clone'
  	forceHelperSize: true
  	dropOnEmpty: true
  	scroll: false
  	handle: '.handle',
  	tolerance: 'pointer' #'intersect' or 'pointer'
  	placeholder: "block-sort-placeholder"
  	update: ->
  		url = $(this).data('update-url')
  		col = $(this).parent('.col').attr('id')
  		data = "col[]="+col+"&"+$(this).sortable('serialize')
  		$.post url, data

$ ->
  $.ctrl "S", ->
    blocks = {}
    url = $(".block").data("update-url")
    $(".block").each ->
      id = $(this).data("id")
      content = $(this).html()
      blocks[id] = content

    $.post url, blocks

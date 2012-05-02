$(function(){
	$.ctrl('S', function(){
		$('#saving-indicator').css('display', 'inline');
		$('.aloha').each(function(){
			var content = $(this).html();
			var url = $(this).data('update-url');
			$.ajax({
				type: 'PUT',
    		url: url,
    		data: { block: { content: content } }
			});
		});
		$(".ctrl").submit();
		$('#saving-indicator').fadeOut('slow');
	});

	// $('.aloha').click(function(){
		// var text = $(this).text();
		// if(text = 'click to start typing...'){
			// $(this).text(' ');
		// }
	// });
});
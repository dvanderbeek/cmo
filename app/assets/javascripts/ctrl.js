$.ctrl = function(key, callback, args) {
    $(document).keydown(function(e) {
        if(!args) args=[]; // IE barks when args is null
        if(e.keyCode == key.charCodeAt(0) && e.ctrlKey) {
            callback.apply(this, args);
            return false;
        }
    });
};


$(function(){
	$('#page-title').keyup(function(){
		var title = $(this).val();
		$('input.title').val(title);
		$('li.page-title').children('a.page-title').html('<i class="icon-file move"></i> '+title);
		$('input.title').parent('div').parent('form').submit();
	});
	$('#site-title').keyup(function(){
		var title = $(this).val();
		$('input.title').val(title);
		$('li.site-title').children('a.site-title').html('<i class="icon-home move"></i> '+title);
		$('input.title').parent('div').parent('form').submit();
	});

});
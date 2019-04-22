$(window).on('load', function () {
	$('.videos').addClass('preloader').html('');
	var html = '';
	$.ajax({
		url : '/php/handler.php',
		data : { 'action' : 'getLikedVideos' },
		dataType : 'json',

		success: function(data) {
			for (v in data) {
				var	video = data[v];
				html += '<li>';
				html += '<p class="image"><a href="http://www.youtube.com/watch?v='+ video['id'] +'">';
				html += '<img src="' + video['thumbnail'] + '" alt="' + video['title'] + '" title="' + video['title'] + '" />';
				html += '</a></p>'
				html += '<p class="entry"><a href="http://www.youtube.com/watch?v='+ video['id'] +'">' + video['title'] + '</a>';
				html += '<small>Published at ' + video['published_at'] + '</small>';
				html += '<a href="#" class="' 
				html += video['liked'] ? 'dislike" id="' + video['id'] + '">Your favorite</a>' : 'like" id="' + video['id'] + '">Add to favorites</a>';
				html += '</p>';
				html += '</li>';
			}

			$('.videos').removeClass('preloader').html(html);		
		},
			
		// При неудачном запросе
		error: function(xhr) {
			console.log(xhr['responseText']);
			html += "This page is available only for authorized users! Log in or register and try again";

			$('.videos').removeClass('preloader').html(html);
		}
	});
});
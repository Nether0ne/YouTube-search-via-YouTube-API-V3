$(document).ready(() => { 
	$(function() {

		$('.search-input').keyup(function() {
			var val = $(this).val();

			jQTubeUtil.suggest(val, function(response) {
				var html = '';
				for (s in response.suggestions) {
					var sug = response.suggestions[s];
					html += '<li><a href="#">' + sug + '</a></li>';
				}
				if (response.suggestions.length)
					$('.autocomplete').html(html).fadeIn(500);
				else 
					$('.autocomplete').fadeOut(500);
			});
		});
		
		
		$('.btn-submit').click(function() {
			show_videos();
			$('.autocomplete').fadeOut(500);
			return false;
		});
		
		$('.autocomplete').on('click', 'a', function() {
			var text = $(this).text();
			$('.search-input').val(text);
			$('.autocomplete').fadeOut(500);
			show_videos();
			return false;
		});
		
		function show_videos() {
			var searchQuery = $('.search-input').val();
			$('.videos').addClass('preloader').html('');
			
			var html = '';

			$.ajax({
				url : '/php/get-video.php',
				data : {'search' : searchQuery},
				dataType : 'json',
				
				// При успешном запросе
				success: function(data) {
					console.log(data);
					for (v in data) {
						var	video = data[v];
						html += '<li>';
						html += '<p class="image"><a href="http://www.youtube.com/watch?v='+ video['id'] +'">';
						html += '<img src="' + video['thumbnail'] + '" alt="' + video['title'] + '" title="' + video['title'] + '" />';
						html += '</a></p>'
						html += '<p class="entry"><a href="http://www.youtube.com/watch?v='+ video['id'] +'">' + video['title'] + '</a>';
						html += '<small>Published at ' + video['published_at'] + '</small>';
						html += '</p>';
						html += '</li>';
					}

					$('.videos').removeClass('preloader').html(html);		
				},
				// При неудачном запросе
				error: function(xhr) {
					console.log("Ошибка при запросе!")
					console.log(xhr['responseText']);
					html += "Ошибка при запросе! Попробуйте позже";

					$('.videos').removeClass('preloader').html(html);
				}
			});
		};
	});
});
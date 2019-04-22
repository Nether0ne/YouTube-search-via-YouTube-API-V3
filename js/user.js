$(document).ready(() => {

	$('.btn-login').on('click', function(event) {
		event.preventDefault();
		$('.overlay').fadeIn(500, function() {
			$('.login').css('display', 'block').animate({opacity: 1, top: '25%'}, 300)});
	});

	$('.btn-reg').on('click', function(event) {
		event.preventDefault();
		$('.overlay').fadeIn(500, function() {
			$('.reg').css('display', 'block').animate({opacity: 1, top: '25%'}, 300)});
	});

	$('.close-login').on('click', function(event) {
		$('.login').animate({opacity: 0, top: '20%'}, 300, function () {
			$(this).css('display', 'none');
			$('.overlay').fadeOut(400);
		})
	});

	$('.close-reg').on('click', function(event) {
		$('.reg').animate({opacity: 0, top: '20%'}, 300, function () {
			$(this).css('display', 'none');
			$('.overlay').fadeOut(400);
		})
	});

	$('.btn-login-finish').on('click', function(event) {
		event.preventDefault();

		var login = $('.name-login').val();
		var password = $('.pass-login').val();

		$.ajax({
			url : '/php/handler.php',
			data : { 'action' : 'login', 'login' : login, 'password' : password},
			dataType : 'json',

			success: function(data) {
				alert(data);
				setTimeout(function() {
					location.reload();
				}, 1000);
			},

			error: function(xhr) {
				alert(xhr['responseText']);
			}
		});
	});
	
	$('.btn-reg-finish').on('click', function(event) {
		event.preventDefault();
		
		var login = $('.name-reg').val();
		var password = $('.pass-reg').val();

		$.ajax({
			url : '/php/handler.php',
			data : { 'action' : 'register', 'login' : login, 'password' : password},
			dataType : 'json',

			success: function(data) {
				alert(data);
				setTimeout(function() {
					location.reload();
				}, 1000);
			},

			error: function(xhr) {
				alert(xhr['responseText']);
			}
		});
	});

	$('.exit').on('click', function(event) {
		event.preventDefault();

		$.ajax({
			url : '/php/handler.php',
			data : { 'action' : 'logout' },
			dataType : 'json',

			success : function() {
				location.reload();
			},

			error : function(xhr) {
				alert(xhr['responseText']);
			}
		});
	});

	// Обработчик нажатия кнопки like
	$('.videos').on('click', '.like', function () {
		event.stopPropagation();
    	event.stopImmediatePropagation();
		var link = $(this);
		var id = link.attr('id');

		$.ajax({
			url : '/php/handler.php',
			data : { 'action' : 'addFavorite', 'id' : id},
			dataType : 'json',

			success : function(data) {
				if (data) {
					// Если добавили в лайкнутые
					link.removeClass('like').addClass('dislike').text("Your favorite");
					alert("You have added this video to your favorites!");
				}
				else {
					// Если пользователь не авторизован
					alert("This feature is only avaiable for authorized users!");
				}
			},

			error: function(xhr) {
				console.log(xhr['responseText']);
			}
		});
	});

	// Обработчик нажатия кнопки dislike
	$('.videos').on('click', '.dislike', function () {
		var link = $(this);
		var id = link.attr('id');

		$.ajax({
			url : '/php/handler.php',
			data : { 'action' : 'removeFavorite', 'id' : id},
			dataType : 'json',

			success : function(data) {
				if (data) {
					// Если убрали из лайкнутых
					link.removeClass('dislike').addClass('like').text("Add to favorite");
					alert("You have removed this video from your favorites!");
				}
				else {
					// Если пользователь не авторизован
					alert("This feature is only avaiable for authorized users!");
				}
			},

			error: function(xhr) {
				console.log(xhr['responseText']);
			}
		});
	});
});

$.ajax({
	url : '/php/handler.php',
	data : { 'action' : 'check' },
	dataType : 'json',

	success: function(data) {
		if (data) {
			$('.user-welcome').append("<b>" + data + "</b>");
			$('.user-info').show();
		}
		else {
			$('.log-div').show();
		}
	},

	error: function(xhr) {
		console.log(xhr['responseText']);
	} 
});
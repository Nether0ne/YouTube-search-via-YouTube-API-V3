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
			url : '/php/user/login.php',
			data : {'login' : login, 'password' : password},

			success: function(data) {
				alert(data);

				setTimeout(function() {
					location.reload();
				}, 1000);
			},

			error: function(xhr) {
				console.log(xhr['responseText']);
			}
		});
	});
	
	$('.btn-reg-finish').on('click', function(event) {
		event.preventDefault();
		
		var login = $('.name-reg').val();
		var password = $('.pass-reg').val();

		$.ajax({
			url : '/php/user/reg.php',
			data : {'login' : login, 'password' : password},

			success: function(data) {
				alert($data);

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
			url : '/php/user/logout.php',

			success : function() {
				location.reload();
			},

			error : function(xhr) {
				alert(xhr['responseText']);
			}
		});
	});
});

$.ajax({
	url : '/php/user/check.php',

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
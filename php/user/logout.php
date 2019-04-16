<?php
	
	session_start();

	if (empty($_SESSION['login']) or empty($_SESSION['password'])) {
		header('HTTP/1.1 400 Bad Request');
		die("Доступ на эту страницу доступен только авторизированым пользователям!");
	}

	unset($_SESSION['login']);
	unset($_SESSION['password']);
	unset($_SESSION['id']);
	
?>
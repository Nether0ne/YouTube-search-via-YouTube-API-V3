<?php
	require_once("../database/connect.php");

	session_start();

	// Получаем введенные данные
	$login = $_GET['login'];
	$password = $_GET['password'];

	// Проверяем пустые ли данные
	if ($login == '') {
		unset($login);
	}

	if ($password == '') {
		unset($password);
	}

	// Если логин или пароль пустые - сообщаем об этом пользователю
	if (empty($login) or empty($password)){
		header('HTTP/1.1 400 Bad Request');
		die("Вы ввели не всю информацию!\nЗаполните все поля и попробуйте снова!");
	}

	// Экранирование данных
	$login = stripslashes($login);
	$login = htmlspecialchars($login);
	$login = trim($login);
	$password = stripcslashes($password);
	$password = stripslashes($password);
	$password = trim($password);

	// Подключение к базе данных
	$link = connect();

	$query = "SELECT * FROM user WHERE login='$login'";

	// Осуществляем запрос на нахождение нужного пользователя
	$result = mysqli_query($link, $query) 
		or die("Ошибка нахождения пользователя!\n" . mysqli_error($link));

	// Если данный пользователь не был найден в базе данных
	if (mysqli_num_rows($result) == 0) {
		header('HTTP/1.1 400 Bad Request');
		die("Пользователь с данным логином не зарегестрирован");
	}
	else {
		$data = mysqli_fetch_array($result);

		// Проверяем сходятся ли пароли
		if ($data['password'] == $password) {
			$_SESSION['password'] = $data['password'];
			$_SESSION['login'] = $data['login'];
			$_SESSION['id'] = $data['id'];

			echo "Добро пожаловать, '$login'";
		}
		else {
			header('HTTP/1.1 400 Bad Request');
			die("Был введен неправильный пароль!\nПроверьте правильность ввода и попробуйте снова!");
		}
	}

?>
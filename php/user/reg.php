<?php
	require_once("../database/connect.php");

	$login = $_GET['login'];
	$pass = $_GET['password'];

	if ($login == '')
		unset($login);

	if ($pass == '')
		unset($pass);

	if (empty($login) or empty($pass)) {
		header('HTTP/1.1 400 Bad Request');
		die("Вы ввели не всю информацию!\nЗаполните все поля и попробуйте снова!");
	}

	$login = stripcslashes($login);
	$login = htmlspecialchars($login);
	$login = trim($login);

	$pass = stripcslashes($pass);
	$pass = htmlspecialchars($pass);
	$pass = trim($pass);

	$link = connect();

	$query = "SELECT id FROM user WHERE login='$login'";
	$result = mysqli_query($link, $query) 
		or die ("Ошибка проверки наличия пользователя!\n" . mysqli_error($link));

	if (mysqli_num_rows($result) != 0) {
		header('HTTP/1.1 400 Bad Request');
		die("Введенное вами имя пользователя уже занято!");
	}	

	$query = "INSERT INTO user VALUES (NULL, '$login', '$pass')";
	$result = mysqli_query($link, $query)
		or die ("Ошибка внесения пользователя в базу данных!\n" . mysqli_error($link));

	if ($result) {
		echo "Вы успешно зарегестрированы!";
	}
	else {
		header('HTTP/1.1 400 Bad Request');
		die("Произошла ошибка при регистрации, попробуйте зарегестрироваться позже!");
	}
?>
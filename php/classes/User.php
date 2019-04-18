<?php

require_once($_SERVER['DOCUMENT_ROOT'] . "/php/database/connect.php");

class User {

	// Конструктор по умолчанию
	public function __construct() {
		session_start();
	}

	// Функция проверки текущей сессии
	public function checkSession() {
		if (empty($_SESSION['login']) or empty($_SESSION['password'])) {
			return NULL;
		}

		return $_SESSION['login'];
	}

	// Функция авторизации пользователя
	public function login(string $login, string $password) {
		// Проверяем пустые ли данные
		if ($login == '') {
			unset($login);
		}

		if ($password == '') {
			unset($password);
		}

		// Если логин или пароль пустые - сообщаем об этом пользователю
		if (empty($login) or empty($password)) {
			header('HTTP/1.1 400 Bad Request');
			die("Вы ввели не всю информацию!\nЗаполните все поля и попробуйте снова!");
		}

		// Очищаем поступающие данные от лишних символов
		$login = $this->editInput($login);
		$password = $this->editInput($password);

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

				return "Добро пожаловать, $login";
			}
			else {
				header('HTTP/1.1 400 Bad Request');
				die("Был введен неправильный пароль!\nПроверьте правильность ввода и попробуйте снова!");
			}
		}
	}

	// Функция регистрации
	public function register(string $login, string $password) {
		// Проверяем пустые ли данные
		if ($login == '')
			unset($login);

		if ($password == '')
			unset($password);

		// Если логин или пароль пустые - сообщаем об этом пользователю
		if (empty($login) or empty($password)) {
			header('HTTP/1.1 400 Bad Request');
			die("Вы ввели не всю информацию!\nЗаполните все поля и попробуйте снова!");
		}

		// Очищаем поступающие данные от лишних символов
		$login = $this->editInput($login);
		$password = $this->editInput($password);

		// Подключение к базе данных
		$link = connect();

		$query = "SELECT id FROM user WHERE login='$login'";

		// Осуществляем запрос на нахождение нужного пользователя
		$result = mysqli_query($link, $query) 
			or die ("Ошибка проверки наличия пользователя!\n" . mysqli_error($link));

		// Если данное имя уже зарегестрировано
		if (mysqli_num_rows($result) != 0) {
			header('HTTP/1.1 400 Bad Request');
			die("Введенное вами имя пользователя уже занято!");
		}	

		// Если данное имя свободно - продолжаем процесс регистрации
		$query = "INSERT INTO user VALUES (NULL, '$login', '$password')";
		$result = mysqli_query($link, $query)
			or die ("Ошибка внесения пользователя в базу данных!\n" . mysqli_error($link));

		$query = "CREATE TABLE " . $login ."_liked (id INT AUTO_INCREMENT, videoid TEXT, PRIMARY KEY (id))";
		mysqli_query($link, $query);
		// Сообщаем пользователю о результате регистрации
		if ($result) {
			return "Вы успешно зарегестрированы!";
		}
		else {
			header('HTTP/1.1 400 Bad Request');
			die("Произошла ошибка при регистрации, попробуйте зарегестрироваться позже!");
		}
	}

	// Функция выхода пользователя
	public function logout() {
		if (empty($_SESSION['login']) or empty($_SESSION['password'])) {
			header('HTTP/1.1 400 Bad Request');
			die("Доступ на эту страницу доступен только авторизированым пользователям!");
		}

		session_destroy();
	}

	// Функция добавления лайка
	public function like(string $id) {
		$username = $this->checkSession();

		// Если пользователь не авторизован - выходим из функции
		if (empty($username)) {
			return NULL;
		}

		// Подключение к базе данных
		$link = connect();
		$query = "INSERT INTO " . $username . "_liked VALUES (NULL, '$id')";
		// Осуществление запроса на добавление
		$result = mysqli_query($link, $query) or die("Ошибка добавления в понравившиеся видео");

		if ($result)
			return true;
		
		return false;
	}

	// Функция удаления лайка
	public function dislike(string $id) {
		$username = $this->checkSession();

		// Если пользователь не авторизован - выходим из функции
		if (empty($username)) {
			return NULL;
		}

		// Подключение к базе данных
		$link = connect();
		$query = "DELETE FROM " . $username . "_liked WHERE videoid='$id'";
		// Осуществление запроса на удаление
		$result = mysqli_query($link, $query) or die("Ошибка удаления понравившиеся видео");

		if ($result)
			return true;
		
		return false;
	}

	// Функция проверки наличия лайка на видео
	public function isLiked(string $id) {
		$username = $this->checkSession();

		// Если пользователь не авторизован - выходим из функции
		if (empty($username)) {
			return NULL;
		}

		// Подключение к базе данных
		$link = connect();
		$query = "SELECT * FROM " . $username . "_liked WHERE videoid='$id'";
		$result = mysqli_query($link, $query) or die("Ошибка при нахождении видео в пользовательском листе!");
		if (mysqli_num_rows($result) != 0)
			return true;

		return false;
	}

	// Функция обработки поступающих данных
	public function editInput(string $data) {
		$data = stripslashes($data);
		$data = htmlspecialchars($data);
		$data = trim($data);

		return $data;
	}
}
?>
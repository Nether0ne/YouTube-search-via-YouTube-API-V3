<?php

require_once("DataBase.php");

class User {

	private $db;

	// Конструктор по умолчанию
	public function __construct() {
		// Подключение к БД
		$this->db = DataBase::getDataBase();
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
			die("You have not entered all the information!\nFill in all fields and try again!");
		}

		$query = "SELECT * FROM user WHERE login={?}";

		// Осуществляем запрос на нахождение нужного пользователя
		$result = $this->db->select($query, array($login));

		// Если данный пользователь был найден в базе данных
		if ($result) {
			// Проверяем сходятся ли пароли
			if ($result[0]['password'] == $password) {
				$_SESSION['id'] = $result[0]['id'];
				$_SESSION['login'] = $result[0]['login'];
				$_SESSION['password'] = $result[0]['password'];

				return "Welcome , $login";
			}
			else {
				header('HTTP/1.1 400 Bad Request');
				die("Incorrect password!\nCheck your input and try again!");
			}
		}
		else {
			header('HTTP/1.1 400 Bad Request');
			die("User with this login is not registered");
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
			die("You have not entered all the information!\nFill in all fields and try again!");
		}

		$query = "SELECT login FROM user WHERE login={?}";

		// Осуществляем запрос на нахождение нужного пользователя
		$result = $this->db->select($query, array($login));

		// Если данное имя уже зарегестрировано
		if ($result) {
			header('HTTP/1.1 400 Bad Request');
			die("User with this login is already registered");
		}	

		// Если данное имя свободно - продолжаем процесс регистрации
		$query = "INSERT INTO user VALUES (NULL, {?}, {?})";
		$result = $this->db->query($query, array($login, $password))
			or die ("Ошибка внесения пользователя в базу данных!\n" . $this->$db->error);

		$query = "CREATE TABLE " . $login ."_liked (id INT AUTO_INCREMENT, videoid TEXT, PRIMARY KEY (id))";
		$this->db->query($query);
		// Сообщаем пользователю о результате регистрации
		if ($result) {
			return "You are successfully registered!";
		}
		else {
			header('HTTP/1.1 400 Bad Request');
			die("An error occured during registration!\nTry again later!");
		}
	}

	// Функция выхода пользователя
	public function logout() {
		if ($this->checkSession()) 
			session_destroy();
		else {
			header('HTTP/1.1 400 Bad Request');
			die("This page is available only for authorized users!");
		}
	}

	// Функция добавления лайка
	public function like(string $id) {
		$username = $this->checkSession();

		// Если пользователь не авторизован - выходим из функции
		if (empty($username))
			return NULL;

		$query = "INSERT INTO " . $username . "_liked VALUES (NULL, {?})";

		// Осуществление запроса на добавление и возвращение результата
		return $this->db->query($query, array($id)) 
			or die("Error! This video was not added to your favorites!\nTry again!");
	}

	// Функция удаления лайка
	public function dislike(string $id) {
		$username = $this->checkSession();

		// Если пользователь не авторизован - выходим из функции
		if (empty($username)) 
			return NULL;

		$query = "DELETE FROM " . $username . "_liked WHERE videoid={?}";
		// Осуществление запроса на удаление
		return $this->db->query($query, array($id))
			or die("Error! This video was not removed from your favorites\nTry again!");
	}

	// Функция проверки наличия лайка на видео
	public function isLiked(string $id) {
		$username = $this->checkSession();

		// Если пользователь не авторизован - выходим из функции
		if (empty($username)) 
			return false;

		$query = "SELECT * FROM " . $username . "_liked WHERE videoid={?}";
		
		return count($this->db->select($query, array($id))) ? true : false;
	}

	// Функция получения лайкнутых видео пользователя
	public function likedVideos() {
		$username = $this->checkSession();

		if (empty($username))
			return false;

		$query = "SELECT * FROM search, " . $username . "_liked WHERE search.videoid = " . $username . "_liked.videoid";

		return $this->db->select($query);
	}
}

?>
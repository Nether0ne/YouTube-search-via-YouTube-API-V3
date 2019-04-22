<?php
	require_once("classes/User.php");
	require_once('classes/YouTubeVideo.php');
	require_once('classes/DataManage.php');

	// Функция добавления видео в понравившиеся
	function addFavorite() {
		$id = $_GET['id'];
		$User = new User();
		return $User->like($id);
	}

	// Функция проверки авторизации
	function check() {
		$User = new User();
		return $User->checkSession();
	}

	// Функция получения видео
	function getVideos() {
		$searchRequest = $_GET['search'];

		$DataManager = new DataManage();
		// Проверяем наличие нужных видео в базе данных
		$videosInfo = $DataManager->search($searchRequest);

		// Если в базе данных не было найдено нужных видео
		if ($videosInfo == NULL) {
			// Выполняем запрос к YouTube API
			$Video = new YouTubeVideo();
		
			$dataByString = $Video->search($searchRequest);
			$videosInfo = $Video->getDataVideo($dataByString->getItems());

			// Заносим результат в базу данных
			$DataManager->addDataSet($videosInfo, $searchRequest);
		}

		// Возвращаем полученный результат на front-end
		return $videosInfo;
	}

	// Функция получения лайкнутых видео
	function getLikedVideos() {
		$User = new User();
		$DataManager = new DataManage();
		return $DataManager->getDataSet($User->likedVideos());
	}

	// Функция авторизации
	function login() {
		$login = $_GET['login'];
		$password = $_GET['password'];

		$User = new User();
		return $User->login($login, $password);
	}

	// Функция выхода из аккаунта
	function logout() {
		$User = new User();
		return $User->logout();
	}

	// Функция регистрации аккаунта
	function register() {
		$login = $_GET['login'];
		$password = $_GET['password'];

		$User = new User();
		return $User->register($login, $password);
	}

	// Функция удаления из понравившихся
	function removeFavorite() {
		$id = $_GET['id'];
		$User = new User();
		return $User->dislike($id);
	}

	// Подбор нужной функции на основе полученной переменной 'action'
	if (!empty($_GET)) {
		if (function_exists($_GET['action']))
			echo json_encode(call_user_func($_GET['action']));
		else 
			die("Ошибка! Данная функция не найдена!");
	}
?>
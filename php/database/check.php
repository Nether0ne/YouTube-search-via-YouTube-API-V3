<?php
	require_once("connect.php");
	require_once("getDataSet.php");

	// Функция проверки наличия нужных видео
	function check(string $search) {

		$link = connect();
		// Запрос к базе данных
		$query = "SELECT * FROM search WHERE query='$search'";
		
		// Выполнение запроса к базе данных
		$result = mysqli_query($link, $query)
			or die("Ошибка поиска\n" . mysqli_error($link));

		// Возвращаем проверку наличия нужных видео
		return $dataset = getDataSet($result);
	}
?>
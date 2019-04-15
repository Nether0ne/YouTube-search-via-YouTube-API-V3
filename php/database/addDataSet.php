<?php
	require_once("connect.php");
	
	// Функция вставки результата в базу данных
	function addDataSet(array $videos, string $search) {
		
		$link = connect();

		$date = new DateTime();
		$date = $date->format('Y-m-d');

		foreach ($videos as $v) {
			$id = $v['id'];
			$title = $v['title'];
			$published = new DateTime($v['published_at']);
			$published = $published->format('Y-m-d');
			$img = "https://" . $v['thumbnail'];

			$query = "INSERT INTO search VALUES 
				(NULL, '$search', '$date', '$id', '$title', '$published', '$img')"
			
			mysqli_query($link, $query) or die("Ошибка вставки!\n" . mysqli_error($link));
		}
	}
?>
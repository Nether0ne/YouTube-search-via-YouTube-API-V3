<?php
	require_once('connect.php');

	// Функция для удаления старых хранящихся данных в базе данных
	function removeDataSet(string $search) {

		$link = connect();
		$query = "DELETE FROM search WHERE query='$search'";
		mysqli_query($link, $query) or die ("Ошибка удаления!\n" . mysqli_error($link));
	}
	
?>
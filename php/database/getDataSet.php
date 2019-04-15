<?php
	require_once("removeDataSet.php");

	// Функция получения данных из базы данных
	function getDataSet($result) {

		$dataset = [];

		// Если запрос вернул не 0 строк
		if (mysqli_num_rows($result)) {
			while ($data = mysqli_fetch_array($result)) {

				$dataset[] = [
					'id' => $data['videoid'],
					'title' => $data['title'],
					'published_at' => $data['published'],
					'thumbnail' => $data['img']
				];
			}
		}
		// Если запрос вернул 0 строк
		else {
			$dataset = NULL;
		}

		// Возвращаем построенный ответ с базы данных
		return $dataset;
	}
	
?>
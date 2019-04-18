<?php
	require_once('classes/YouTubeVideo.php');
	require_once('database/search.php');
	require_once('database/addDataSet.php');
	
	$search_request = $_GET['search'];
	$search_request = stripcslashes($search_request);
	$search_request = htmlspecialchars($search_request);

	// Проверяем наличие нужных видео в базе данных
	$videos_info = check($search_request);

	// Если в базе данных не было найдено нужных видео
	if ($videos_info == NULL) {
		// Выполняем запрос к YouTube API
		$video = new YouTubeVideo();
	
		$dataByString = $video->search($search_request);
		$videos_info = $video->getDataVideo($dataByString->getItems());

		// Заносим результат в базу данных
		addDataSet($videos_info, $search_request);
	}

	// Возвращаем полученный результат на front-end
	echo json_encode($videos_info);
?>
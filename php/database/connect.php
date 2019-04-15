<?php
	function connect() {
		$link = mysqli_connect("localhost", "root", "", "videosite")
			or die("Ошибка подключения к БД\n" . mysqli_error($link));
			
		return $link;	
	}
?>
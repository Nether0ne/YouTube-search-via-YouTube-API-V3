<?php

	session_start();

	if (empty($_SESSION['login']) or empty($_SESSION['password'])) {
		echo NULL;
		die();
	}

	echo $_SESSION['login'];

?>
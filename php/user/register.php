<?php
	require_once("../classes/User.php");

	$login = $_GET['login'];
	$password = $_GET['password'];

	$user = new User();
	echo $user->register($login, $password);

?>
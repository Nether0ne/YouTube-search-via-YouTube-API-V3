<?php
	require_once("../classes/User.php");

	$id = $_GET['id'];
	$user = new User();
	echo $user->like($id);

?>
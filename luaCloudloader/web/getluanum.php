<?php
	//GameSense
	$conn = new mysqli("localhost","username","password","database");
	if($conn->connect_error){
		die("error to connect database");
		
	}


	
	
	$return = array("lua_num" => 0);
	
	

	$user_data = $conn->query("SELECT * FROM lua_list");
	
	$return["lua_num"] = $user_data->num_rows;
	
	
	
	$conn->close();
	//header('Content-type:text/html; charset=utf-8');
	header('Content-Type:application/json; charset=utf-8');
	echo json_encode($return);
	die();

?>
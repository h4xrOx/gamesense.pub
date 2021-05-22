<?php
	//GameSense
	$conn = new mysqli("localhost","username","password","database");
	if($conn->connect_error){
		die("error to connect database");
		
	}

	$username = "admin";
	$password = "admin";
	
	
	$return = array("login" => false,"banned"=>false);
	
	
	if(isset($_GET["username"])){
		
		$username = $_GET["username"];
		$password = $_GET["password"];
	}
	
	$user_data = $conn->query("SELECT * FROM user");
	
	while ($row=$user_data->fetch_assoc()) {
		
	//echo "<br>Username".$row['user_name']."<br>Password:".$row['user_password'];
	
	if($row['user_name'] == $username && $row['user_password'] == $password){
		//var_dump("login!");
		
		if($row['user_status'] == '2'){
			$return["banned"] = true;
		}
		
		$return["login"] = true;
	 }
	
	}
	
	$conn->close();
	//header('Content-type:text/html; charset=utf-8');
	header('Content-Type:application/json; charset=utf-8');
	echo json_encode($return);
	die();

?>

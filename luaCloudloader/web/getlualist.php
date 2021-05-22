<?php
	//GameSense
	$conn = new mysqli("localhost","username","password","database");
	if($conn->connect_error){
		die("error to connect database");
		
	}

	//接收id参数
	$lua_id = "admin";

	//返回数组
	$return = array("lua_id" => 1,
					"lua_name"=>"admin",
					"lua_author"=>"admin",
					"lua_version"=>1.0,
					"lua_introduce"=>"admin",
					"lua_url"=>"url");
	
	//写入参数
	if(isset($_GET["lua_id"])){
		
		$lua_id = $_GET["lua_id"];
	}
	
	$lua_list = $conn->query("SELECT * FROM lua_list");
	
	while ($row=$lua_list->fetch_assoc()) {
		
		if($row['lua_id'] == $lua_id){
			$return["lua_id"] = $row['lua_id'];
			$return["lua_name"] = $row['lua_name'];
			$return["lua_author"] = $row['lua_author'];
			$return["lua_version"] = $row['lua_version'];
			$return["lua_introduce"] = $row['lua_introduce'];
			$return["lua_url"] = $row['lua_url'];
			
		}
		
	
	}
	
	$conn->close();
	//header('Content-type:text/html; charset=utf-8');
	header('Content-Type:application/json; charset=utf-8');
	echo json_encode($return);
	die();

?>
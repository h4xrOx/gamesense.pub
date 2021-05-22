<?php

  require __DIR__ . '/vendor/autoload.php';

  use Wohali\OAuth2\Client\Provider\Discord;
  use RestCord\DiscordClient;




$link = new mysqli("127.0.0.1", "root", ""); // host, login, pass
$link->select_db("forums"); // db

$secretkey = "".$_GET['key']."";




$checksecret3 = "hyper_yolo"; // check key / token

$checksecret1 = array($checksecret3);
$checksecret = in_array($secretkey, $checksecret1, true);
	
if($secretkey == $checksecret3){



$sql22 = "SELECT `csgo`,`id`,`group_id`,`discord`,`username` FROM `users`";
$result2 = $link->query($sql22);

				
			
		

$datenow = date_create('now');

		foreach($result2 as $item) {
	$omyj = $item['username'];
		$sql229 = "SELECT `expire`,`username` FROM `bans` WHERE `username` = '$omyj'";
$result29 = $link->query($sql229);
		 $row_cnt = $result29->num_rows;
		$dateend = date_create($item['csgo']);
			$diff = date_diff($datenow, $dateend);
			//$out = $diff->format("Minutes:%i");
			//print_r($datenow);
			$hisuid = $item['id'];
			
    if($diff->invert) {
		if($diff->days >= 3) {
			
		

	
		
		
		
		
		
	
		
		
		
		
		
		
		
			if($item['csgo'] != null && $row_cnt==0){
			if($item['group_id'] == 5 || $item['group_id'] == 6){
				
			$sql31 = "UPDATE `users` SET `csgo` = NULL WHERE `id` = '$hisuid'";
			 $result3 = $link->query($sql31);
			 $sql314 = "UPDATE `users` SET `group_id` = '4' WHERE `id` = '$hisuid'";
			 $result34 = $link->query($sql314);
			 $discordid=$item['discord'];
			  if($discordid != null){
			$discord_id = $discordid;

  
  
$client = new DiscordClient([
        'token' => '' //discord token
      ]);
	  
	 // $acceptedRoles = ["Premium User"];
		$client->guild->removeGuildMember([
			'guild.id' => 452880601867878410,
			'user.id' => (int)$discord_id
			//'roles' => 452883032576098335, 'name' => 'Premium user', 'color' => 16729413, 'hoist' => true, 'managed' => false, 'mentionable' => true, 'position' => 6, 'permissions' => 37080128)
		]);

	 
			  }
			}
		 // die("DelSub");   
			}
				
			  elseif($row_cnt!=0){
			  if($item['group_id'] == 5){
			$sql31 = "UPDATE `users` SET `csgo` = NULL WHERE `id` = '$hisuid'";
			 $result3 = $link->query($sql31);
			 $sql314 = "UPDATE `users` SET `group_id` = '4' WHERE `id` = '$hisuid'";
			 $result34 = $link->query($sql314);
			 
		} elseif($item['group_id'] == 6){
			$sql31 = "UPDATE `users` SET `csgo` = NULL WHERE `id` = '$hisuid'";
			 $result3 = $link->query($sql31);
			 $sql314 = "UPDATE `users` SET `group_id` = '4' WHERE `id` = '$hisuid'";
			 $result34 = $link->query($sql314);
			
		}

			   while ($row = $result29->fetch_assoc()) {
				// $result29
		
				   if ($row['expire'] == '' || $row['expire'] > time())
		{
				   		
				   //die("lol");
				 
				    	
				    if($item['discord'] != null){
		
					
			$discord_id = $item['discord'];


  
$client = new DiscordClient([
        'token' => '' //discord token
      ]);
	  
	 // $acceptedRoles = ["Premium User"];
		$client->guild->removeGuildMember([
			'guild.id' => 452880601867878410, // id discord server
			'user.id' => (int)$discord_id
			//'roles' => 452883032576098335, 'name' => 'Premium user', 'color' => 16729413, 'hoist' => true, 'managed' => false, 'mentionable' => true, 'position' => 6, 'permissions' => 37080128)
		]);
		
	 
				   
				   
				   
				   
		}
				   
				   
			   }
			  
			  
			  
			  
			  
			  
			  
			  
			
			
			
		}
			  
			  
			  
			  
			  
			  
			  
			  
		  }
		} else {
		
		
		
	
		
			if($item['csgo'] != null && $row_cnt==0){
					if($item['group_id'] == 5 || $item['group_id'] == 6){
			$sql31 = "UPDATE `users` SET `csgo` = NULL WHERE `id` = '$hisuid'";
			 $result3 = $link->query($sql31);
			 $sql314 = "UPDATE `users` SET `group_id` = '4' WHERE `id` = '$hisuid'";
			 $result34 = $link->query($sql314);
			 $discordid=$item['discord'];
			 if($discordid != null){
			
						
			$discord_id = $discordid;

  
  
$client = new DiscordClient([
        'token' => '' //discord token
      ]);
	  
	 // $acceptedRoles = ["Premium User"];
		$client->guild->removeGuildMember([
			'guild.id' => 452880601867878410,
			'user.id' => (int)$discord_id
			//'roles' => 452883032576098335, 'name' => 'Premium user', 'color' => 16729413, 'hoist' => true, 'managed' => false, 'mentionable' => true, 'position' => 6, 'permissions' => 37080128)
		]);
		
	 }
			
			
			
			
			 }
		 // die("StopSub");    
		  }
		  
		  elseif($row_cnt!=0){
			  
			
		if($item['group_id'] == 5){
			$sql31 = "UPDATE `users` SET `csgo` = NULL WHERE `id` = '$hisuid'";
			 $result3 = $link->query($sql31);
			 $sql314 = "UPDATE `users` SET `group_id` = '4' WHERE `id` = '$hisuid'";
			 $result34 = $link->query($sql314);
			 
		} elseif($item['group_id'] == 6){
			$sql31 = "UPDATE `users` SET `csgo` = NULL WHERE `id` = '$hisuid'";
			 $result3 = $link->query($sql31);
			 $sql314 = "UPDATE `users` SET `group_id` = '4' WHERE `id` = '$hisuid'";
			 $result34 = $link->query($sql314);
			
		}
			

			   while ($row = $result29->fetch_assoc()) {
				// $result29
		
				   if ($row['expire'] == '' || $row['expire'] > time())
		{
				   		
				   //die("lol");
				 
				    	
				    if($item['discord'] != null){
		
					
			$discord_id = $item['discord'];


  
$client = new DiscordClient([
        'token' => '' //token discord
      ]);
	  
	 // $acceptedRoles = ["Premium User"];
		$client->guild->removeGuildMember([
			'guild.id' => 452880601867878410,
			'user.id' => (int)$discord_id
			//'roles' => 452883032576098335, 'name' => 'Premium user', 'color' => 16729413, 'hoist' => true, 'managed' => false, 'mentionable' => true, 'position' => 6, 'permissions' => 37080128)
		]);
		
	 
				   
				   
				   
				   
		}
				   
				   
			   }
			  
			  
			  
			  
			  
			  
			  
			  
			
			
			
		}
			  
			  
			  
			  
		  }
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
			}
		} else {
			
			if($row_cnt!=0){
if($item['group_id'] == 5){
			$sql31 = "UPDATE `users` SET `csgo` = NULL WHERE `id` = '$hisuid'";
			 $result3 = $link->query($sql31);
			 $sql314 = "UPDATE `users` SET `group_id` = '4' WHERE `id` = '$hisuid'";
			 $result34 = $link->query($sql314);
			 
		} elseif($item['group_id'] == 6){
			$sql31 = "UPDATE `users` SET `csgo` = NULL WHERE `id` = '$hisuid'";
			 $result3 = $link->query($sql31);
			 $sql314 = "UPDATE `users` SET `group_id` = '4' WHERE `id` = '$hisuid'";
			 $result34 = $link->query($sql314);
			
		}
			   while ($row = $result29->fetch_assoc()) {
				// $result29
		
				   if ($row['expire'] == '' || $row['expire'] > time())
		{
				   		
				   //die("lol");
				 
				    	
				    if($item['discord'] != null){
		
					
			$discord_id = $item['discord'];


  
$client = new DiscordClient([
        'token' => '' // discord token
      ]);
	  
	 // $acceptedRoles = ["Premium User"];
		$client->guild->removeGuildMember([
			'guild.id' => 452880601867878410,
			'user.id' => (int)$discord_id
			//'roles' => 452883032576098335, 'name' => 'Premium user', 'color' => 16729413, 'hoist' => true, 'managed' => false, 'mentionable' => true, 'position' => 6, 'permissions' => 37080128)
		]);
		
	 
				   
				   
				   
				   
		}
		}
				   
			   }
			  
			  
			  
			  
			  
			  
			  
			  
			
			
			
		}
		
		
		
	}
		 

	 	
   
		}
		
		
		
		
		
		
		
		
		//payments
	
		
		
	

		 

	 	
   
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

		   
             





}  if($secretkey != $checksecret3) {
	die("Secret");
	




}


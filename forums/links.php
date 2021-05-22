<?php
define('PUN_ROOT', dirname(__FILE__).'/');
require PUN_ROOT.'include/common.php';
require PUN_ROOT.'include/utf8/substr_replace.php';
require PUN_ROOT.'include/utf8/ucwords.php'; // utf8_ucwords needs utf8_substr_replace
require PUN_ROOT.'include/utf8/strcasecmp.php';
$errors = array();

$form_username = pun_trim($_POST['username']);
$form_password = pun_trim($_POST['password']);
$form_method = pun_trim($_POST['method']);
$form_win = pun_trim($_POST['win']);
$form_lose = pun_trim($_POST['lose']);
$form_char = pun_trim($_POST['char']);
$u_a = $_SERVER['HTTP_USER_AGENT'];

$username_sql = ($db_type == 'mysql' || $db_type == 'mysqli' || $db_type == 'mysql_innodb' || $db_type == 'mysqli_innodb') ? 'username=\''.$db->escape($form_username).'\'' : 'LOWER(username)=LOWER(\''.$db->escape($form_username).'\')';

$result = $db->query('SELECT * FROM '.$db->prefix.'users WHERE '.$username_sql) or error('Unable to fetch user info', __FILE__, __LINE__, $db->error());
$cur_user = $db->fetch_assoc($result);

$authorized = false;

if (!empty($cur_user['password']))
	{
		$form_password_hash = pun_hash($form_password); 
		
		if (!empty($cur_user['salt']))
		{
			if (sha1($cur_user['salt'].sha1($form_password)) == $cur_user['password']) // 1.3 used sha1(salt.sha1(pass))
			{
				$authorized = true;

				$db->query('UPDATE '.$db->prefix.'users SET password=\''.$form_password_hash.'\', salt=NULL WHERE id='.$cur_user['id']) or error('Unable to update user password', __FILE__, __LINE__, $db->error());
			}
		}else if (strlen($cur_user['password']) != 40)
		{
			if (md5($form_password) == $cur_user['password'])
			{
				$authorized = true;

				$db->query('UPDATE '.$db->prefix.'users SET password=\''.$form_password_hash.'\' WHERE id='.$cur_user['id']) or error('Unable to update user password', __FILE__, __LINE__, $db->error());
			}
		}
		// Otherwise we should have a normal sha1 password
		else
			$authorized = ($cur_user['password'] == $form_password_hash);
		
	}

if (!$authorized)
$errors[] = "Wrong user/pass";
	
if (!empty($errors))
{
	foreach ($errors as $cur_error)
		die("error, wrong username or password");
} else {
	
	if($authorized){
		$id = $cur_user['id']; //uid
		$username = $cur_user['username']; //username
		$group = $cur_user['group_id']; //gid
		$hwid = $cur_user['hwid']; //sub
		
	
        if($group != 4){
			

			
			if($hwid != null){
			  
		
		if(isset($_POST['method']) && $form_method == "update"){
			if (isset($_POST['win']))
	{
			$db->query("UPDATE `users` SET `win` = '$form_win' WHERE `id` = '$id'") ;
	}
				if (isset($_POST['lose']))
	{
			$db->query("UPDATE `users` SET `lose` = '$form_lose' WHERE `id` = '$id'") ;
	}
	die("ok");
		}
		else {
			$win = $cur_user['win']; //sub
			$lose = $cur_user['lose']; //sub
			if($win == null || $win == "" || $win == 0){
				$win = "0";
			}
			if($lose == null || $lose == "" || $lose == 0){
				$lose = "0";
			}
			if(isset($_POST['char']) && $form_char != ""){
				die("$win$form_char$lose");
			} else {
			die("$win<br>$lose");
			}
		}
	
		
				
				
			
		} else {
				die("error, wrong hwid");
	
			
		}
		}
		
		
		
	
		
	}
	
}



?>
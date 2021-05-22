<?php
define('PUN_ROOT', dirname(__FILE__).'/');
require PUN_ROOT.'include/common.php';
require PUN_ROOT.'include/utf8/substr_replace.php';
require PUN_ROOT.'include/utf8/ucwords.php'; // utf8_ucwords needs utf8_substr_replace
require PUN_ROOT.'include/utf8/strcasecmp.php';
$errors = array();

$form_username = pun_trim($_POST['req_username']);
$form_password = pun_trim($_POST['req_password']);
$form_hwid = pun_trim($_POST['req_hwid']);
$form_download = pun_trim($_POST['req_download']);
$form_version = $_POST['req_version'];

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
		die("0");
} else {
	
	if($authorized){
		$id = $cur_user['id']; //uid
		$username = $cur_user['username']; //username
		$group = $cur_user['group_id']; //gid
		$csgo = $cur_user['csgo']; //sub
		$hwid = $cur_user['hwid']; //sub
		
		$csgo = new DateTime($cur_user['csgo']); //sub
		$csgo_type = $csgo->format('d-m-Y_H:i:s'); //end

	
		
		
		$result122 = $db->query('SELECT * FROM updates WHERE id=1') or error('Unable to fetch user info', __FILE__, __LINE__, $db->error());
        $cur_user122 = $db->fetch_assoc($result122);
		
				$result1223 = $db->query('SELECT * FROM versions WHERE id=1') or error('Unable to fetch user info', __FILE__, __LINE__, $db->error());
        $cur_user1223 = $db->fetch_assoc($result1223);
		
		$result12231 = $db->query('SELECT * FROM versions WHERE id=2') or error('Unable to fetch user info', __FILE__, __LINE__, $db->error());
        $cur_user12231 = $db->fetch_assoc($result12231);
		
			$result122b = $db->query('SELECT * FROM updates WHERE id=2') or error('Unable to fetch user info', __FILE__, __LINE__, $db->error());
        $cur_user122b = $db->fetch_assoc($result122b);
		
		
		
		$updated = new DateTime($cur_user122['updated']); //sub
		$updated = format_time1($updated->getTimestamp(),$id); //end
		
		$updated_beta = new DateTime($cur_user122b['updated']); //sub
		$updated_beta = format_time1($updated_beta->getTimestamp(),$id); //end
		
    
		$version = $cur_user1223['version'];
	
		$version_csgo = $cur_user12231['version'];
		
		$now = new DateTime('NOW'); //now
		$ip = $_SERVER["HTTP_CF_CONNECTING_IP"];
		$now_type = format_time1($now->getTimestamp(),$id); //now
		$csgo_type = format_time1($csgo->getTimestamp(),$id); //end
		$datenow = date_create('now'); //diff in days
		$dateend = date_create($cur_user['csgo']); //diff in days
		$diff = date_diff($datenow, $dateend); //diff in days
		
		$days = $diff->days; //diff in days
			if($group == 1){
				$group1 = "666"; //admin
				
			}elseif($group == 2){
				$group1 = "322"; //moder
				
			}
			elseif($group == 4){
				$group1 = "j"; //member
				
			}
			elseif($group == 5){
				$group1 = "n"; //premium
				
			}
			elseif($group == 6){
				$group1 = "j"; //beta
				
			}
        if($csgo > $now){
			
			
			//$db->query("UPDATE users SET") ;
			
			if($hwid == $form_hwid || $hwid == null){
			  if($form_version != "100")
			$db->query("UPDATE `users` SET `used_version` = '$form_version' WHERE `id` = '$id'") ;
	
			
			
$echotext = "


!$group1?!$id?!$username?!$days?!$ip?!$csgo_type?!$updated?!$version?!$version_csgo?!$updated_beta!
				
				
				
				";
				//echo $echotext;
				//$enc = base64_encode($echotext);
				//$enc = encrypt($echotext, "resolvy1488");
				if($form_download == "csgo"){
					
				
$file = 'chat/hta/csgo.dll';

if(!file_exists($file)){ // file does not exist
    die('file not found');
} else {
    header("Cache-Control: public");
    header("Content-Description: File Transfer");
    header("Content-Disposition: attachment; filename=$file");
    header("Content-Type: application/zip");
    header("Content-Transfer-Encoding: binary");

    // read the file from disk
    readfile($file);
}
				}elseif($form_download == "csgo_beta"){ 



if($group == 1 || $group == 2 || $group == 6 ){
				
$file = 'chat/hta/csgo_beta.dll';
					} elseif($group == 5){
						$file = 'chat/hta/csgo.dll';
						
					}

if(!file_exists($file)){ // file does not exist
    die('file not found');
} else {
    header("Cache-Control: public");
    header("Content-Description: File Transfer");
    header("Content-Disposition: attachment; filename=$file");
    header("Content-Type: application/zip");
    header("Content-Transfer-Encoding: binary");

    // read the file from disk
    readfile($file);
}



				}				else {
					
//	$echotext = encrypt(base64_encode($echotext),"mdafdsmjfkdsjklfdjksjlfkdsjfdskljflksjflksdfjdslkfjdsklfjdslkfjdslfkdsjfdlkfjsdklfjsdlfksdjfsdkltrjrirejiojforiejfriofjreiojfriojfroiejfoirejforeifjreoijfjkldfjkldsjfsdlkfjdslkfjdslkfsjdflkdsjflkdsjflksdjfklfjsdfesifjeilsjfsliejflijdlkfjdsklfjdslkfdjfkldsjflksdjflskdjfdkslfjdsklfjsdkfjsiesjfl");
	$echotext = strrev(base64_encode($echotext));
	
	
	$r = strrev(base64_encode($hwid));
	
	if($u_a == "---AFKBOOST---"){
	
			echo "t|$r|$echotext";	
						$db->query("UPDATE `users` SET `lastauth` = NOW() WHERE `id` = '$id'") ;
	} else {
		echo "0";	
	}
				}

				if($hwid == null){
					$db->query("UPDATE `users` SET `hwid` = '$form_hwid' WHERE `id` = '$id'") ;
					
					
				}
				$db->query("UPDATE `users` SET `hwid_ip` = '$ip' WHERE `id` = '$id'") ;
				
				
				
			} else {
					if($hwid != null){
				$db->query("UPDATE `users` SET `hwid_new` = '$form_hwid' WHERE `id` = '$id'") ;
				$db->query("UPDATE `users` SET `hwid_ip_new` = '$ip' WHERE `id` = '$id'") ;
					}	die("0");
				
			}
				
				
			
		} else {
				die("0");
	
			
		}
		
		
		
	
		
	}
	
}

function encrypt($string, $key) 
{
   $result = '';
   for($i=0; $i<strlen($string); $i++) {
     $char = substr($string, $i, 1);
     $keychar = substr($key, ($i % strlen($key))-1, 1);
     $char = chr(ord($char)+ord($keychar));
     $result.=$char;
   }
   return base64_encode($result);
}
function decrypt($string, $key) 
{
   $result = '';
   $string = base64_decode($string);
   for($i=0; $i<strlen($string); $i++) {
      $char = substr($string, $i, 1);
      $keychar = substr($key, ($i % strlen($key))-1, 1);
      $char = chr(ord($char)-ord($keychar));
      $result.=$char;
   }
   return $result;
}

?>
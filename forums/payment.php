<head>
<title>Payments / AFKBOOST</title>
</head>
<?php
define('PUN_ROOT', dirname(__FILE__).'/');

require PUN_ROOT.'include/common.php';
require PUN_ROOT.'header.php';
if ($pun_user['g_read_board'] == '0')
	message($lang_common['No view']);
?>
<?php    
 
 
 if(isset($_GET["uniquecode"])){

if(!empty($_GET["uniquecode"])) {

	if(strlen($_GET["uniquecode"]) == 16) {
	//die ("Error");
	require_once "./main_oplata.php";
require_once "./config_oplata.php";

$obj = new check_code;
$sign = md5($id_seller.":".$_GET["uniquecode"].":".$pass_DS);
$answer = @$obj -> answer_check_code($id_seller, $_GET["uniquecode"], $sign);

$xml_data = @new SimpleXMLElement($answer);

   $codes = $_GET['uniquecode']; //get input text

include "libmail.php"; //Класс для работы с мейлом через smtp SSL/TSL
	require_once "./main_oplata.php";
require_once "./config_oplata.php";

$obj = new check_code;
$sign = md5($id_seller.":".$_GET["uniquecode"].":".$pass_DS);
$answer = @$obj -> answer_check_code($id_seller, $_GET["uniquecode"], $sign);

$xml_data = @new SimpleXMLElement($answer);

if(!@$xml_data) {
	message('Response is null.');
}else {
	

	//$game = "1";
$myinv = $xml_data->inv;
$idgood = $xml_data->id_goods;
$code = $_GET["uniquecode"];
 $result = $db->query("SELECT * FROM `payments` WHERE `code` = '$code'") or error('Unable to find invoice', __FILE__, __LINE__, $db->error());
if (!$db->num_rows($result))
	{
		
$myid = $pun_user['id'];
$myid1 = $pun_user['username'];
$myid2 = $pun_user['email'];
 $now = new DateTime('NOW');
 $now =  $now->format('Y-m-d H:i:s');
//die ($now);
 //$db->query("INSERT INTO `payments` (`id_goods`, `date`, `inv`, `game`, `code`) VALUES ('$idgood', '$now', '$myinv', '$game', '$code')") or error('Unable to create invoice', __FILE__, __LINE__, $db->error());
 $db->query("INSERT INTO `payments` (`goods`, `date`, `inv`, `code`,`info`) VALUES ('$idgood','$now', '$myinv', '$code', '')") or error('Unable to create invoice', __FILE__, __LINE__, $db->error());
  $dopbalance1=$db->query("SELECT `group_id`,`csgo` FROM `users` WHERE `id` = '{$myid}'");
  if ($db->num_rows($dopbalance1))
	{
		  $uff = $db->fetch_assoc($dopbalance1);
  $group = $uff['group_id'];
   $csgo = $uff['csgo'];
   
		if($idgood == 2484609){
			$dateold = $csgo;
		}
		
		$datepaid=$dateold;
			
			
			$datepaid = new DateTime($dateold);
				if($idgood == 2484609){
	$datepaid->modify('+1 month');			
			} elseif($months == 90){
				
				$datepaid->modify('+1 month');
			}
			elseif($months == 365){
				
				$datepaid->modify('+12 month');
			}

  $newdate = $datepaid->format('Y-m-d H:i:s');


$newdatemail = format_time($datepaid->getTimestamp(), false, null, null, false, true);

$db->query("UPDATE `users` SET `csgo`='$newdate' WHERE `id` = '{$myid}'");
			

	
			
			if($group == 4){
			$db->query("UPDATE `users` SET `group_id`='5' WHERE `id` = '{$myid}'");
			}
			

			$m= new Mail("utf-8"); // начинаем
$m->From( " AFKBOOST Mailer;admin@afkboost.space" ); // от кого отправляется почта
$m->To( "$myid2" ); // кому адресованно
$m->Subject( "Subscription expire time was extended" );
$m->Body( "Hello $myid1,
Your subscription expire time was changed to $newdatemail. 

-- 
AFKBOOST Mailer
(Do not reply to this message)");   
$m->Priority(3);// приоритет письма
$m->smtp_on("ssl://smtp.yandex.ru","admin@afkboost.space","", 465); //log, pass smtp
$m->Send();  
	
	
	} else {
		
		message('User does not exits.');
	}
 
 // $new_uid = $db->insert_id();

redirect("/forums", "Successfully!");
	
	} else {
				message('Code already was used.');
	}
 



	}
	}else {
		message('Invalid code.');
	}
} else {
	message('Code is emty.');
 }
 }
 


 
 if(isset($_POST['button'])){ //check if form was submitted
// if(!isset($_GET["uniquecode"])) {
// $username = $_POST['username']; //get input text
// $email = $_POST['email']; //get input text
 //$game = $_POST['game']; //get input text
 $plan = $_POST['plan']; //get input text
 //$payment_type = $_POST['payment_type'];


 if($plan == 30){
	 $fu = $pun_user['email'];
	redirect("https://www.oplata.info/asp2/pay_payu.asp?id_d=2484609&id_po=0&cart_uid=&ai=&ae=&curr=PY1&lang=en-US&failpage=https%3A%2F%2Fwww%2Eoplata%2Einfo%2Fasp2%2Fpay_wm%2Easp%3Fid_d%3D2484609&_ow=&_ids_shop=&email=$fu", "Redirecting to the payment system");
	
 }

	//redirect("https://www.oplata.info/asp2/pay_payu.asp?id_d=2484609&id_po=0&cart_uid=&ai=&ae=&curr=PY1&lang=en-US&failpage=https%3A%2F%2Fwww%2Eoplata%2Einfo%2Fasp2%2Fpay_wm%2Easp%3Fid_d%3D2484609&_ow=&_ids_shop=", "Redirecting to the payment system");
	
		// $now = new DateTime('NOW');
 //7wBmSPf3Fj29dsEzfR
	
 
//echo "$new_uid";
}
 
 

 ?>
<div id="brdmain">
<div class="blockform">
	<h2><span>Extend AFKBOOST</span></h2>
	<div class="box">
		<form id="payment" method="post" action="" onsubmit="if(document.getElementById('agree').checked) { return true; } else { alert('Please indicate that you have read and agree to the Terms and Conditions'); return false; }">

			<div id="error_box" class="inform" style="display: none;">
				<fieldset>
					<legend>The following errors occurred:</legend>
					<div class="infldset payment-errors">
						<ul>
						</ul>
					</div>
				</fieldset>
			</div>
			<div class="inform">
				<input type="hidden" name="form_sent" value="1">
				
				<fieldset>
					<legend>Payment options</legend>
					<div class="infldset">
						<table class="aligntop">
							<tbody>
								<tr>
									<th scope="row">Payment type</th>
									<td>
										<select id="payment_type" name="payment_type" style="width:197px">
											<option value="BankCard">Credit card</option>
											<!--<option value="Qiwi">Qiwi</option>-->

										</select>
									</td>
								</tr>
								<tr>
									<!--<<th scope="row">Username</th>
									<td>
										input id="username" type="text" name="username" value="<?php// echo $pun_user['username'] ?>" size="30" maxlength="80">
										<span>The user for whom you are paying.</span>
									</td>
								</tr> -->
								<tr>
									<th scope="row">Email address</th>
									<td>
										<input id="email" type="text" name="email" value="<?php echo $pun_user['email'] ?>" size="30" maxlength="80" style="width:197px">
										<span>You will receive a receipt at this email address.</span>
									</td>
								</tr>
								<tr>
									<th scope="row">Game</th>
									<td>
										
										<select name="game" style="width:197px">
										<?php 
										
										$paygame = $_GET['game'];
 if($paygame == "csgo"){
	 
	 echo "<option value='csgo' selected=''>Counter-Strike: Global Offensive</option>";
 } else {
	 
	 echo "<option value='csgo'>Counter-Strike: Global Offensive</option>";
 }
										?>	
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row">Plan</th>
									<td>
										<select name="plan" style="width:197px">
											<option value="30">30 days - $10.00</option>
											<!--<option value="90">90 days - $30.00</option>
											<option value="365">365 days - $50.00</option>-->
										</select>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</fieldset>
			</div>
			
				
				<fieldset>
					<div class="infldset">
						<div class="rbox">
							<label>
								<input id="agree" type="checkbox" name="agree" value="1">
								I read and agree to the <a href="tos.php" target="_blank">terms and conditions</a>
							</label>
						</div>
						
						<p class="buttons">
							<input type="submit"  name="button" class="submit" value="Continue" style="font-size: 11px; font-weight: bold; height: 24px;" accesskey="s">
						</p>
					</div>
				</fieldset>
			</div>
			
		</form>
	</div>
</div>
<div class="blockform">
	<h2><span>Manage payments</span></h2>
	<div class="box">
		<div class="fakeform">
			<div class="inform">
				<fieldset>
					<legend>Recent payment activity</legend>
					<div class="infldset">
						<p>Refunds are available if the software does not work on your computer. Refund requests should be sent within two days (48 hours) of payment. For payments older than 48 hours, you may or may not receive a full refund depending on the activity of your account (i.e. usage logs). Depending on your bank, you will see the refund show up anywhere between 5-10 business days after the request is made.</p>
						<table>
							<tbody><tr>
								<th class="tcl">Date</th>
								<th class="tcl">Type</th>
								<th class="tcl">Amount</th>
								<th class="tcl">Status</th>
								<th class="tcl">Information</th>
							</tr>
	<?php						$result4478 = $db->query("SELECT * FROM `payments` ORDER BY id DESC LIMIT 5") or error('Unable to fetch user info', __FILE__, __LINE__, $db->error());

	if ($db->num_rows($result4478)){
	?><?php foreach($result4478 as $item): ?>
							<tr>
								<td><?php 
								$datenow = new DateTime($item['date']);						
echo format_time($datenow->getTimestamp(), false, null, null, false, true);	

								
								
								?></td>
								<td>Charge</td>
								<td><?php 
if($item['goods'] == 2484609){
	echo "10.00$";
} elseif($item['goods'] == 24846091){
	echo "30.00$";
}elseif($item['goods'] == 24846091){
	
	echo "50.00$";
}

								?></td>
								<td>Succeeded</td>
								<td><?php echo $item['info'] ?></td>
							</tr>
							
							
					<?php endforeach; ?> 		
							
	<?php } ?>	
							<?php if(empty($result4478) || !$db->num_rows($result4478)): ?> 
						<tr>
							<td colspan="5" style="text-align: center;">No payments have been registered.</td>
						<tr>
						<?php endif; ?> 
						</tbody></table>
						<p>Please <a href="pmsnew.php?mdl=post&uid=2">PM admin</a> if the software is not working and you would like a refund.</p>
					</div>
				</fieldset>
			</div>
		
	</div>
</div>
</div>



</div>


<?php
require PUN_ROOT.'footer.php';
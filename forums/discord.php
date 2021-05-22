<head>
<title>Discord / GameSense</title>
</head>
<?php
define('PUN_ROOT', dirname(__FILE__).'/');
require PUN_ROOT.'include/common.php';
//require PUN_ROOT.'header.php';
if ($pun_user['g_read_board'] == '0')
	message($lang_common['No view']);

 require __DIR__ . '/vendor/autoload.php';

  use Wohali\OAuth2\Client\Provider\Discord;
  use RestCord\DiscordClient;

  session_start();

  $provider = new \Wohali\OAuth2\Client\Provider\Discord([
      'clientId' => '452909496025743360', //discord id client
      'clientSecret' => '', //secret discord
      'redirectUri' => 'https://gamesense.pub/forums/discord.php' // redirect url
  ]);
  $options = [
    'scope' => ['guilds.join','identify']
];

 
 if (!isset($_GET['code'])) {
	  
	   if(isset($_POST['redirect'])){
       
      $authUrl = $provider->getAuthorizationUrl($options);
      $_SESSION['oauth2state'] = $provider->getState();
	  
	
      header('Location: ' . $authUrl); 
	   }
//$discord = new DiscordClient(['token' => 'NDUyOTA5NDk2MDI1NzQzMzYw.DfXsgg.9y4IcVGEDcZ4JPZLuttAHRhD-mU']); // Token is required

//var_dump($discord->guild->getGuildRoles(['guild.id' => 452880601867878410, 'name' => "Premium user"]));
  } elseif (empty($_GET['state']) || ($_GET['state'] !== $_SESSION['oauth2state'])) {

      unset($_SESSION['oauth2state']);
	 header('Location: discord.php?error=yes');
      
	  

  } else {
	  
	 
	  $sessionuser = $pun_user['username'];
	 
  $sql = $db->query("SELECT `discord`,`group_id`,`csgo` FROM `users` WHERE `username` = '$sessionuser'");
  if ($sql->num_rows > 0) {
    // output data of each row
    while($sql = $sql->fetch_assoc()) {
		$token = $provider->getAccessToken('authorization_code', [
		'code' => $_GET['code'],
	]);
   $user = $provider->getResourceOwner($token);
      $discord_id = $user->getId();
  if($sql['discord'] == null || $sql['discord'] == $discord_id){
  
  $iduser1 = new DateTime($sql['csgo']);

  
  $iduser12 = new DateTime('NOW');

  
  
if($sql['group_id'] != 4 &&  $iduser1 > $iduser12) 
	
	{
	

  
  
$client = new DiscordClient([
        'token' => 'N' //discord token
      ]);
	  
	 // $acceptedRoles = ["Premium User"];
		$client->guild->addGuildMember([
			'guild.id' => 452880601867878410, //discord server id
			'user.id' => (int)$discord_id,
			'access_token' => (string)$token,
			'nick' => $sessionuser,
			'roles' => array(452880601867878410,452883032576098335) //discord roles
			//'roles' => 452883032576098335, 'name' => 'Premium user', 'color' => 16729413, 'hoist' => true, 'managed' => false, 'mentionable' => true, 'position' => 6, 'permissions' => 37080128)
		]);
		
		
		
		//echo $response;
	 
	  
	$newipollo1 = $_SERVER["HTTP_CF_CONNECTING_IP"];

$db->query("UPDATE `users` SET `discord_ip` = '$newipollo1' WHERE `username` = '$sessionuser'");
	  
if($sql['discord'] != $discord_id){

$db->query("UPDATE `users` SET `discord` = '$discord_id' WHERE `username` = '$sessionuser'");




}


 unset($_SESSION['oauth2state']);
	
	

	  header('Location: discord.php?status=successfully');
	  
	  }
	 else {
		
		
		 unset($_SESSION['oauth2state']);
	 header('Location: discord.php?error=yes');
      
		
		
	}
	  
	  
	  
  } else {
	  	  
if($sql['discord'] != $discord_id){

$db->query("UPDATE `users` SET `discord_new` = '$discord_id' WHERE `username` = '$sessionuser'");
$newipollo = $_SERVER["HTTP_CF_CONNECTING_IP"];

$db->query("UPDATE `users` SET `discord_ip_new` = '$newipollo' WHERE `username` = '$sessionuser'");


}
	  
	     
	  
	 unset($_SESSION['oauth2state']);
	  header('Location: discord.php?id=false');
	
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
	  
	  }
  }
  
	  
	  
	  
	  
	  
	  
  }


?>



<?php if(isset($_GET['error'])){ ?>

<html lang="en-US"><head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="robots" content="noindex, nofollow">
    <title>GameSense</title>
	<link href="https://fonts.googleapis.com/css?family=Raleway:900,400" rel="stylesheet" type="text/css">
	<style type="text/css">#title h1,body{font-weight:400;color:#eee}.divide,.outer{position:absolute;width:100%}#title h1,.trifecta,p{text-align:center}body,html{margin:0;padding:0;height:100%}body{font-family:Raleway,Helvetica Neue,Helvetica,sans-serif;font-size:14px;background-color:#101010}p{font-size:1.75em;color:#ddd;margin:10px 0 0}.divide{top:0;padding:0;margin:0;background:#1e5799;background:-moz-linear-gradient(left,#1e5799 0,#f300ff 50%,#e0ff00 100%);background:-webkit-gradient(linear,left top,right top,color-stop(0,#1e5799),color-stop(50%,#f300ff),color-stop(100%,#e0ff00));background:-webkit-linear-gradient(left,#1e5799 0,#f300ff 50%,#e0ff00 100%);background:-o-linear-gradient(left,#1e5799 0,#f300ff 50%,#e0ff00 100%);background:-ms-linear-gradient(left,#1e5799 0,#f300ff 50%,#e0ff00 100%);background:linear-gradient(to right,#1e5799 0,#f300ff 50%,#e0ff00 100%);filter:progid:DXImageTransform.Microsoft.gradient( startColorstr='#1e5799', endColorstr='#e0ff00', GradientType=1 );height:3px;border-bottom:1px solid #000}.trifecta .one,.trifecta .two,.trifecta>div{background-color:#eee}#title h1{margin:0 auto;padding:0;font-size:62pt;height:120px}#title span{color:#00BFFF}.outer{display:table;height:100%}.middle{display:table-cell;vertical-align:middle}.inner{margin-left:auto;margin-right:auto;width:400px}.trifecta{margin:0 auto;font-size:26px;width:80px}.trifecta>div{display:inline-block;width:14px;height:14px;border-radius:100%;-webkit-animation:bdelay 1.4s infinite ease-in-out both;animation:bdelay 1.4s infinite ease-in-out both}.trifecta .one{-webkit-animation-delay:-.32s;animation-delay:-.32s}.trifecta .two{-webkit-animation-delay:-.16s;animation-delay:-.16s}@-webkit-keyframes bdelay{0%,100%,80%{-webkit-transform:scale(0)}40%{-webkit-transform:scale(1)}}@keyframes bdelay{0%,100%,80%{-webkit-transform:scale(0);transform:scale(0)}40%{transform:scale(1);-webkit-transform:scale(1)}}</style>
	<script type="text/javascript">
	//<![CDATA[
	(function(){
		var a = function() {try{return !!window.addEventListener} catch(e) {return !1} },
		b = function(b, c) {a() ? document.addEventListener("DOMContentLoaded", b, c) : document.attachEvent("onreadystatechange", b)};
		b(function(){
			var d = new Date();
			d.setTime(d.getTime() + (30000));
			document.cookie = "bypass=1; expires=" + d.toUTCString() + "; path=/";
			var a = document.getElementById('gs-content');a.style.display = 'block';
			setTimeout(function(){
				var t,r,a,k,i,f, p6gdn4Q={"eNG8aiA":+((!+[]+!![]+[])+(!+[]+!![]+[])+(!+[]+!![]+!![]+!![]+!![]+[])+(!+[]+!![]+!![]+!![]+!![]+!![]+!![]+[])+(!+[]+!![]+!![]+!![])+(!+[]+!![]+!![]+!![]+!![]+!![]+!![]+[])+(+[])+(!+[]+!![]+!![]+!![]+!![]+!![]+!![]+!![])+(!+[]+!![]+!![]))/+((+!![])+(!+[]+!![]+!![]+!![]+!![]+!![]+[])+(!+[]+!![]+!![])+(!+[]+!![]+!![]+[])+(!+[]+!![]+!![]+!![]+!![]+!![])+(!+[]+!![]+!![]+[])+(!+[]+!![])+(!+[]+!![]+!![]+[])+(!+[]+!![]+[]))};
				t = document.createElement('div');
				t.innerHTML="<a href='/'>x</a>";
				t = t.firstChild.href;r = t.match(/https?:\/\//)[0];
				t = t.substr(r.length); t = t.substr(0,t.length-1);
				a = document.getElementById('redirect');
				f = document.getElementById('challenge-form');
				;p6gdn4Q.eNG8aiA*=+((!+[]+!![]+!![]+!![]+!![]+!![]+[])+(!+[]+!![]+!![]+!![]+!![]+!![]+!![])+(!+[]+!![]+!![]+!![]+!![]+[])+(!+[]+!![]+!![]+!![]+!![]+!![]+!![])+(+!![])+(!+[]+!![]+!![]+!![]+!![]+!![]+!![])+(!+[]+!![]+!![]+!![]+!![]+!![]+!![]+[])+(!+[]+!![]+!![]+!![]+!![]+!![])+(!+[]+!![]+!![]+!![]+!![]))/+((+!![])+(!+[]+!![]+[])+(+[])+(!+[]+!![]+!![]+[])+(!+[]+!![]+!![])+(!+[]+!![]+!![]+!![]+[])+(!+[]+!![])+(!+[]+!![]+!![]+!![]+[])+(!+[]+!![]+!![]+!![]+!![]+!![]+!![]+[]));a.value = +p6gdn4Q.eNG8aiA.toFixed(10); '; 121'
				f.action += location.hash;
				f.submit();
			}, 4000);
		}, false);
	})();
	//]]>
	</script>
</head>
<body>

<div class="divide"></div>
<div class="outer"><div class="middle"><div class="inner">
	<div id="title">
		<h1>Game<span>Sense</span></h1>
	</div>
	<noscript><h1 data-translate="turn_on_js" style="color:#bd2426;">Please turn JavaScript on and reload the page.</h1></noscript>
	<div id="gs-content" style="display: block;">
		<p>Access denied</p>
		<div class="trifecta">
			<div class="one"></div>
			<div class="two"></div>
			<div class="three"></div>
		</div>
		<form id="challenge-form" action="index.php" method="post">
			<input type="hidden" id="redirect" name="redirect">
		</form>
	</div>
</div></div></div>
    

</body></html>


<?php
}elseif(isset($_GET['id'])){ 
	
?>
<html lang="en-US"><head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="robots" content="noindex, nofollow">
    <title>Resolve</title>
	<link href="https://fonts.googleapis.com/css?family=Raleway:900,400" rel="stylesheet" type="text/css">
	<style type="text/css">#title h1,body{font-weight:400;color:#eee}.divide,.outer{position:absolute;width:100%}#title h1,.trifecta,p{text-align:center}body,html{margin:0;padding:0;height:100%}body{font-family:Raleway,Helvetica Neue,Helvetica,sans-serif;font-size:14px;background-color:#101010}p{font-size:1.75em;color:#ddd;margin:10px 0 0}.divide{top:0;padding:0;margin:0;background:#1e5799;background:-moz-linear-gradient(left,#1e5799 0,#f300ff 50%,#e0ff00 100%);background:-webkit-gradient(linear,left top,right top,color-stop(0,#1e5799),color-stop(50%,#f300ff),color-stop(100%,#e0ff00));background:-webkit-linear-gradient(left,#1e5799 0,#f300ff 50%,#e0ff00 100%);background:-o-linear-gradient(left,#1e5799 0,#f300ff 50%,#e0ff00 100%);background:-ms-linear-gradient(left,#1e5799 0,#f300ff 50%,#e0ff00 100%);background:linear-gradient(to right,#1e5799 0,#f300ff 50%,#e0ff00 100%);filter:progid:DXImageTransform.Microsoft.gradient( startColorstr='#1e5799', endColorstr='#e0ff00', GradientType=1 );height:3px;border-bottom:1px solid #000}.trifecta .one,.trifecta .two,.trifecta>div{background-color:#eee}#title h1{margin:0 auto;padding:0;font-size:62pt;height:120px}#title span{color:#00BFFF}.outer{display:table;height:100%}.middle{display:table-cell;vertical-align:middle}.inner{margin-left:auto;margin-right:auto;width:400px}.trifecta{margin:0 auto;font-size:26px;width:80px}.trifecta>div{display:inline-block;width:14px;height:14px;border-radius:100%;-webkit-animation:bdelay 1.4s infinite ease-in-out both;animation:bdelay 1.4s infinite ease-in-out both}.trifecta .one{-webkit-animation-delay:-.32s;animation-delay:-.32s}.trifecta .two{-webkit-animation-delay:-.16s;animation-delay:-.16s}@-webkit-keyframes bdelay{0%,100%,80%{-webkit-transform:scale(0)}40%{-webkit-transform:scale(1)}}@keyframes bdelay{0%,100%,80%{-webkit-transform:scale(0);transform:scale(0)}40%{transform:scale(1);-webkit-transform:scale(1)}}</style>
	<script type="text/javascript">
	//<![CDATA[
	(function(){
		var a = function() {try{return !!window.addEventListener} catch(e) {return !1} },
		b = function(b, c) {a() ? document.addEventListener("DOMContentLoaded", b, c) : document.attachEvent("onreadystatechange", b)};
		b(function(){
			var d = new Date();
			d.setTime(d.getTime() + (30000));
			document.cookie = "bypass=1; expires=" + d.toUTCString() + "; path=/";
			var a = document.getElementById('gs-content');a.style.display = 'block';
			setTimeout(function(){
				var t,r,a,k,i,f, p6gdn4Q={"eNG8aiA":+((!+[]+!![]+[])+(!+[]+!![]+[])+(!+[]+!![]+!![]+!![]+!![]+[])+(!+[]+!![]+!![]+!![]+!![]+!![]+!![]+[])+(!+[]+!![]+!![]+!![])+(!+[]+!![]+!![]+!![]+!![]+!![]+!![]+[])+(+[])+(!+[]+!![]+!![]+!![]+!![]+!![]+!![]+!![])+(!+[]+!![]+!![]))/+((+!![])+(!+[]+!![]+!![]+!![]+!![]+!![]+[])+(!+[]+!![]+!![])+(!+[]+!![]+!![]+[])+(!+[]+!![]+!![]+!![]+!![]+!![])+(!+[]+!![]+!![]+[])+(!+[]+!![])+(!+[]+!![]+!![]+[])+(!+[]+!![]+[]))};
				t = document.createElement('div');
				t.innerHTML="<a href='/'>x</a>";
				t = t.firstChild.href;r = t.match(/https?:\/\//)[0];
				t = t.substr(r.length); t = t.substr(0,t.length-1);
				a = document.getElementById('redirect');
				f = document.getElementById('challenge-form');
				;p6gdn4Q.eNG8aiA*=+((!+[]+!![]+!![]+!![]+!![]+!![]+[])+(!+[]+!![]+!![]+!![]+!![]+!![]+!![])+(!+[]+!![]+!![]+!![]+!![]+[])+(!+[]+!![]+!![]+!![]+!![]+!![]+!![])+(+!![])+(!+[]+!![]+!![]+!![]+!![]+!![]+!![])+(!+[]+!![]+!![]+!![]+!![]+!![]+!![]+[])+(!+[]+!![]+!![]+!![]+!![]+!![])+(!+[]+!![]+!![]+!![]+!![]))/+((+!![])+(!+[]+!![]+[])+(+[])+(!+[]+!![]+!![]+[])+(!+[]+!![]+!![])+(!+[]+!![]+!![]+!![]+[])+(!+[]+!![])+(!+[]+!![]+!![]+!![]+[])+(!+[]+!![]+!![]+!![]+!![]+!![]+!![]+[]));a.value = +p6gdn4Q.eNG8aiA.toFixed(10); '; 121'
				f.action += location.hash;
				f.submit();
			}, 4000);
		}, false);
	})();
	//]]>
	</script>
</head>
<body>

<div class="divide"></div>
<div class="outer"><div class="middle"><div class="inner">
	<div id="title">
		<h1>Game<span>Sense</span></h1>
	</div>
	<noscript><h1 data-translate="turn_on_js" style="color:#bd2426;">Please turn JavaScript on and reload the page.</h1></noscript>
	<div id="gs-content" style="display: block;">
		<p>Your discord id does not match with registered in our database</p>
		<div class="trifecta">
			<div class="one"></div>
			<div class="two"></div>
			<div class="three"></div>
		</div>
		<form id="challenge-form" action="index.php" method="post">
			<input type="hidden" id="redirect" name="redirect">
		</form>
	</div>
</div></div></div>
    

</body></html>




<?php
}elseif(isset($_GET['status'])){ 
	
?>
<html lang="en-US"><head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="robots" content="noindex, nofollow">
    <title>GAMESENSE</title>
	<link href="https://fonts.googleapis.com/css?family=Raleway:900,400" rel="stylesheet" type="text/css">
	<style type="text/css">#title h1,body{font-weight:400;color:#eee}.divide,.outer{position:absolute;width:100%}#title h1,.trifecta,p{text-align:center}body,html{margin:0;padding:0;height:100%}body{font-family:Raleway,Helvetica Neue,Helvetica,sans-serif;font-size:14px;background-color:#101010}p{font-size:1.75em;color:#ddd;margin:10px 0 0}.divide{top:0;padding:0;margin:0;background:#1e5799;background:-moz-linear-gradient(left,#1e5799 0,#f300ff 50%,#e0ff00 100%);background:-webkit-gradient(linear,left top,right top,color-stop(0,#1e5799),color-stop(50%,#f300ff),color-stop(100%,#e0ff00));background:-webkit-linear-gradient(left,#1e5799 0,#f300ff 50%,#e0ff00 100%);background:-o-linear-gradient(left,#1e5799 0,#f300ff 50%,#e0ff00 100%);background:-ms-linear-gradient(left,#1e5799 0,#f300ff 50%,#e0ff00 100%);background:linear-gradient(to right,#1e5799 0,#f300ff 50%,#e0ff00 100%);filter:progid:DXImageTransform.Microsoft.gradient( startColorstr='#1e5799', endColorstr='#e0ff00', GradientType=1 );height:3px;border-bottom:1px solid #000}.trifecta .one,.trifecta .two,.trifecta>div{background-color:#eee}#title h1{margin:0 auto;padding:0;font-size:62pt;height:120px}#title span{color:#00BFFF}.outer{display:table;height:100%}.middle{display:table-cell;vertical-align:middle}.inner{margin-left:auto;margin-right:auto;width:400px}.trifecta{margin:0 auto;font-size:26px;width:80px}.trifecta>div{display:inline-block;width:14px;height:14px;border-radius:100%;-webkit-animation:bdelay 1.4s infinite ease-in-out both;animation:bdelay 1.4s infinite ease-in-out both}.trifecta .one{-webkit-animation-delay:-.32s;animation-delay:-.32s}.trifecta .two{-webkit-animation-delay:-.16s;animation-delay:-.16s}@-webkit-keyframes bdelay{0%,100%,80%{-webkit-transform:scale(0)}40%{-webkit-transform:scale(1)}}@keyframes bdelay{0%,100%,80%{-webkit-transform:scale(0);transform:scale(0)}40%{transform:scale(1);-webkit-transform:scale(1)}}</style>
	<script type="text/javascript">
	//<![CDATA[
	(function(){
		var a = function() {try{return !!window.addEventListener} catch(e) {return !1} },
		b = function(b, c) {a() ? document.addEventListener("DOMContentLoaded", b, c) : document.attachEvent("onreadystatechange", b)};
		b(function(){
			var d = new Date();
			d.setTime(d.getTime() + (30000));
			document.cookie = "bypass=1; expires=" + d.toUTCString() + "; path=/";
			var a = document.getElementById('gs-content');a.style.display = 'block';
			setTimeout(function(){
				var t,r,a,k,i,f, p6gdn4Q={"eNG8aiA":+((!+[]+!![]+[])+(!+[]+!![]+[])+(!+[]+!![]+!![]+!![]+!![]+[])+(!+[]+!![]+!![]+!![]+!![]+!![]+!![]+[])+(!+[]+!![]+!![]+!![])+(!+[]+!![]+!![]+!![]+!![]+!![]+!![]+[])+(+[])+(!+[]+!![]+!![]+!![]+!![]+!![]+!![]+!![])+(!+[]+!![]+!![]))/+((+!![])+(!+[]+!![]+!![]+!![]+!![]+!![]+[])+(!+[]+!![]+!![])+(!+[]+!![]+!![]+[])+(!+[]+!![]+!![]+!![]+!![]+!![])+(!+[]+!![]+!![]+[])+(!+[]+!![])+(!+[]+!![]+!![]+[])+(!+[]+!![]+[]))};
				t = document.createElement('div');
				t.innerHTML="<a href='/'>x</a>";
				t = t.firstChild.href;r = t.match(/https?:\/\//)[0];
				t = t.substr(r.length); t = t.substr(0,t.length-1);
				a = document.getElementById('redirect');
				f = document.getElementById('challenge-form');
				;p6gdn4Q.eNG8aiA*=+((!+[]+!![]+!![]+!![]+!![]+!![]+[])+(!+[]+!![]+!![]+!![]+!![]+!![]+!![])+(!+[]+!![]+!![]+!![]+!![]+[])+(!+[]+!![]+!![]+!![]+!![]+!![]+!![])+(+!![])+(!+[]+!![]+!![]+!![]+!![]+!![]+!![])+(!+[]+!![]+!![]+!![]+!![]+!![]+!![]+[])+(!+[]+!![]+!![]+!![]+!![]+!![])+(!+[]+!![]+!![]+!![]+!![]))/+((+!![])+(!+[]+!![]+[])+(+[])+(!+[]+!![]+!![]+[])+(!+[]+!![]+!![])+(!+[]+!![]+!![]+!![]+[])+(!+[]+!![])+(!+[]+!![]+!![]+!![]+[])+(!+[]+!![]+!![]+!![]+!![]+!![]+!![]+[]));a.value = +p6gdn4Q.eNG8aiA.toFixed(10); '; 121'
				f.action += location.hash;
				f.submit();
			}, 4000);
		}, false);
	})();
	//]]>
	</script>
</head>
<body>

<div class="divide"></div>
<div class="outer"><div class="middle"><div class="inner">
	<div id="title">
		<h1>Game<span>Sense</span></h1>
	</div>
	<noscript><h1 data-translate="turn_on_js" style="color:#bd2426;">Please turn JavaScript on and reload the page.</h1></noscript>
	<div id="gs-content" style="display: block;">
		<p>Successfully</p>
		<div class="trifecta">
			<div class="one"></div>
			<div class="two"></div>
			<div class="three"></div>
		</div>
		<form id="challenge-form" action="index.php" method="post">
			<input type="hidden" id="redirect" name="redirect">
		</form>
	</div>
</div></div></div>
    

</body></html>

<?php } elseif (!isset($_GET['code'])) {?>
<html lang="en-US"><head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="robots" content="noindex, nofollow">
    <title>GAMESENSE</title>
	<link href="https://fonts.googleapis.com/css?family=Raleway:900,400" rel="stylesheet" type="text/css">
	<style type="text/css">#title h1,body{font-weight:400;color:#eee}.divide,.outer{position:absolute;width:100%}#title h1,.trifecta,p{text-align:center}body,html{margin:0;padding:0;height:100%}body{font-family:Raleway,Helvetica Neue,Helvetica,sans-serif;font-size:14px;background-color:#101010}p{font-size:1.75em;color:#ddd;margin:10px 0 0}.divide{top:0;padding:0;margin:0;background:#1e5799;background:-moz-linear-gradient(left,#1e5799 0,#f300ff 50%,#e0ff00 100%);background:-webkit-gradient(linear,left top,right top,color-stop(0,#1e5799),color-stop(50%,#f300ff),color-stop(100%,#e0ff00));background:-webkit-linear-gradient(left,#1e5799 0,#f300ff 50%,#e0ff00 100%);background:-o-linear-gradient(left,#1e5799 0,#f300ff 50%,#e0ff00 100%);background:-ms-linear-gradient(left,#1e5799 0,#f300ff 50%,#e0ff00 100%);background:linear-gradient(to right,#1e5799 0,#f300ff 50%,#e0ff00 100%);filter:progid:DXImageTransform.Microsoft.gradient( startColorstr='#1e5799', endColorstr='#e0ff00', GradientType=1 );height:3px;border-bottom:1px solid #000}.trifecta .one,.trifecta .two,.trifecta>div{background-color:#eee}#title h1{margin:0 auto;padding:0;font-size:62pt;height:120px}#title span{color:#00BFFF}.outer{display:table;height:100%}.middle{display:table-cell;vertical-align:middle}.inner{margin-left:auto;margin-right:auto;width:400px}.trifecta{margin:0 auto;font-size:26px;width:80px}.trifecta>div{display:inline-block;width:14px;height:14px;border-radius:100%;-webkit-animation:bdelay 1.4s infinite ease-in-out both;animation:bdelay 1.4s infinite ease-in-out both}.trifecta .one{-webkit-animation-delay:-.32s;animation-delay:-.32s}.trifecta .two{-webkit-animation-delay:-.16s;animation-delay:-.16s}@-webkit-keyframes bdelay{0%,100%,80%{-webkit-transform:scale(0)}40%{-webkit-transform:scale(1)}}@keyframes bdelay{0%,100%,80%{-webkit-transform:scale(0);transform:scale(0)}40%{transform:scale(1);-webkit-transform:scale(1)}}</style>
	<script type="text/javascript">
	//<![CDATA[
	(function(){
		var a = function() {try{return !!window.addEventListener} catch(e) {return !1} },
		b = function(b, c) {a() ? document.addEventListener("DOMContentLoaded", b, c) : document.attachEvent("onreadystatechange", b)};
		b(function(){
			var d = new Date();
			d.setTime(d.getTime() + (30000));
			document.cookie = "bypass=1; expires=" + d.toUTCString() + "; path=/";
			var a = document.getElementById('gs-content');a.style.display = 'block';
			setTimeout(function(){
				var t,r,a,k,i,f, p6gdn4Q={"eNG8aiA":+((!+[]+!![]+[])+(!+[]+!![]+[])+(!+[]+!![]+!![]+!![]+!![]+[])+(!+[]+!![]+!![]+!![]+!![]+!![]+!![]+[])+(!+[]+!![]+!![]+!![])+(!+[]+!![]+!![]+!![]+!![]+!![]+!![]+[])+(+[])+(!+[]+!![]+!![]+!![]+!![]+!![]+!![]+!![])+(!+[]+!![]+!![]))/+((+!![])+(!+[]+!![]+!![]+!![]+!![]+!![]+[])+(!+[]+!![]+!![])+(!+[]+!![]+!![]+[])+(!+[]+!![]+!![]+!![]+!![]+!![])+(!+[]+!![]+!![]+[])+(!+[]+!![])+(!+[]+!![]+!![]+[])+(!+[]+!![]+[]))};
				t = document.createElement('div');
				t.innerHTML="<a href='/'>x</a>";
				t = t.firstChild.href;r = t.match(/https?:\/\//)[0];
				t = t.substr(r.length); t = t.substr(0,t.length-1);
				a = document.getElementById('redirect');
				f = document.getElementById('challenge-form');
				;p6gdn4Q.eNG8aiA*=+((!+[]+!![]+!![]+!![]+!![]+!![]+[])+(!+[]+!![]+!![]+!![]+!![]+!![]+!![])+(!+[]+!![]+!![]+!![]+!![]+[])+(!+[]+!![]+!![]+!![]+!![]+!![]+!![])+(+!![])+(!+[]+!![]+!![]+!![]+!![]+!![]+!![])+(!+[]+!![]+!![]+!![]+!![]+!![]+!![]+[])+(!+[]+!![]+!![]+!![]+!![]+!![])+(!+[]+!![]+!![]+!![]+!![]))/+((+!![])+(!+[]+!![]+[])+(+[])+(!+[]+!![]+!![]+[])+(!+[]+!![]+!![])+(!+[]+!![]+!![]+!![]+[])+(!+[]+!![])+(!+[]+!![]+!![]+!![]+[])+(!+[]+!![]+!![]+!![]+!![]+!![]+!![]+[]));a.value = +p6gdn4Q.eNG8aiA.toFixed(10); '; 121'
				f.action += location.hash;
				f.submit();
			}, 4000);
		}, false);
	})();
	//]]>
	</script>
</head>
<body>

<div class="divide"></div>
<div class="outer"><div class="middle"><div class="inner">
	<div id="title">
		<h1>Gamespan>Sense</span></h1>
	</div>
	<noscript><h1 data-translate="turn_on_js" style="color:#bd2426;">Please turn JavaScript on and reload the page.</h1></noscript>
	<div id="gs-content" style="display: block;">
		<p>Please wait...</p>
		<div class="trifecta">
			<div class="one"></div>
			<div class="two"></div>
			<div class="three"></div>
		</div>
		<form id="challenge-form" action="discord.php" method="post">
			<input type="hidden" id="redirect" name="redirect">
		</form>
	</div>
</div></div></div>
    

</body></html>


<?php } ?>






<?php
//require PUN_ROOT.'footer.php';
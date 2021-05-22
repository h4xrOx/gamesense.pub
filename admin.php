   <?php
 $ufff = $_POST['key'];  

$link = new mysqli("127.0.0.1", "root", ""); //pass
$link->select_db("forums"); //db


$ufff = decrypt($ufff, date("Ymd"));
$ufff =  explode("|", base64_decode($ufff));

$ufff = base64_decode($ufff[1]);
$sql22 = "SELECT `username`,`img_key` FROM `users` WHERE `img_key` = '$ufff'";
$result2 = $link->query($sql22);
if ($result2->num_rows > 0) {
	
$result2 = $result2->fetch_assoc();

if($result2['img_key'] != null){
	

 

     $files = glob("images/*.*");
	 echo "<br>";
     for ($i=0; $i<count($files); $i++)
      {
        $image = $files[$i];
        $supported_file = array(
                'gif',
                'jpg',
                'jpeg',
                'png'
         );

         $ext = strtolower(pathinfo($image, PATHINFO_EXTENSION));
         if (in_array($ext, $supported_file)) {
            echo "<h3 align='center'><a style='color:white;' href='/".basename($image)."'>".basename($image)."</a></h3><br />"; // show only image name if you want to show full path then use this code // echo $image."<br />";
     
            } else {
                continue;
            }
          }
}else {
	   
	   die(":p");
   }

   } else {
	   
	   die(":P");
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
	   <html lang="en-US"><head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="robots" content="noindex, nofollow">
    <title>GAMESENSE</title>
	<link href="https://fonts.googleapis.com/css?family=Raleway:900,400" rel="stylesheet" type="text/css">
	<style type="text/css">#title h1,body{font-weight:400;color:#eee}.divide,.outer{position:absolute;width:100%}#title h1,.trifecta,p{text-align:center}body,html{margin:0;padding:0;height:100%}body{font-family:Raleway,Helvetica Neue,Helvetica,sans-serif;font-size:14px;background-color:#101010}p{font-size:1.75em;color:#ddd;margin:10px 0 0}.divide{top:0;padding:0;margin:0;background:#1e5799;background:-moz-linear-gradient(left,#1e5799 0,#f300ff 50%,#e0ff00 100%);background:-webkit-gradient(linear,left top,right top,color-stop(0,#1e5799),color-stop(50%,#f300ff),color-stop(100%,#e0ff00));background:-webkit-linear-gradient(left,#1e5799 0,#f300ff 50%,#e0ff00 100%);background:-o-linear-gradient(left,#1e5799 0,#f300ff 50%,#e0ff00 100%);background:-ms-linear-gradient(left,#1e5799 0,#f300ff 50%,#e0ff00 100%);background:linear-gradient(to right,#1e5799 0,#f300ff 50%,#e0ff00 100%);filter:progid:DXImageTransform.Microsoft.gradient( startColorstr='#1e5799', endColorstr='#e0ff00', GradientType=1 );height:3px;border-bottom:1px solid #000}.trifecta .one,.trifecta .two,.trifecta>div{background-color:#eee}#title h1{margin:0 auto;padding:0;font-size:62pt;height:120px}#title span{color:#00BFFF}.outer{display:table;height:100%}.middle{display:table-cell; position:absolute;
    bottom:0;
    right:0;}.inner{margin-left:auto;margin-right:auto;width:400px}.trifecta{margin:0 auto;font-size:26px;width:80px}.trifecta>div{display:inline-block;width:14px;height:14px;border-radius:100%;-webkit-animation:bdelay 1.4s infinite ease-in-out both;animation:bdelay 1.4s infinite ease-in-out both}.trifecta .one{-webkit-animation-delay:-.32s;animation-delay:-.32s}.trifecta .two{-webkit-animation-delay:-.16s;animation-delay:-.16s}@-webkit-keyframes bdelay{0%,100%,80%{-webkit-transform:scale(0)}40%{-webkit-transform:scale(1)}}@keyframes bdelay{0%,100%,80%{-webkit-transform:scale(0);transform:scale(0)}40%{transform:scale(1);-webkit-transform:scale(1)}}</style>
	
</head>
<body>

<div class="divide"></div>
<div class="middle"><div class="inner">
	<div id="title">
		<h1>Game<span>Sense</span></h1>
	</div>
	
</div></div>
    

</body></html>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Демострация работы XML-интерфейса "проверка кода"</title>
<style type="text/css">
html,body{margin:20px 0px 0px 20px;color:#495056;}
fieldset{padding:10px;width:800px;min-height:60px;height:auto;}
legend{color:#808080;}
span.success{color:#008000;}
span.warning{color:#ff0000;}
</style>
</head>
<body>

<?php
// если переменная uniquecode не передана
if(!isset($_GET["uniquecode"])) {
?>
<p>Переменная <strong>uniquecode</strong> не была задана!</p>
<?php }
else {
$_GET["uniquecode"] = substr(preg_replace("/[^A-Z0-9]/", "", $_GET["uniquecode"]), 0, 16);

// если переменная uniquecode пустая
if(empty($_GET["uniquecode"])) {
?>
<span class="warning">Ошибка: переменная <strong>uniquecode</strong> не должна быть пустой!</span>
<?php }
// если количество символов меньше 16
elseif(strlen($_GET["uniquecode"]) != 16) {
?>
<span class="warning">Ошибка: переменная <strong>uniquecode</strong> должно содержать 16 символов!</span>
<?php  }
else {
require_once "./main.php";
require_once "./config.php";

$obj = new check_code;
$sign = md5($id_seller.":".$_GET["uniquecode"].":".$pass_DS);
$answer = @$obj -> answer_check_code($id_seller, $_GET["uniquecode"], $sign);

$xml_data = @new SimpleXMLElement($answer);

if(!@$xml_data) {
echo "<span class=\"warning\">Не удается разобрать XML-ответ!</span>\r\n"; }
else {

// проверяем возвращаемый код(retval). В случае успеха выполняем необходимые действия
/* рекомедуется проверять все полученные параметры ответа, особое внимание стоит обратить на inv.
Настоятельно рекомендуем сохранять это значение в своей базе и каждый раз проверять его на уникальность, чтобы избежать повторного начисления */
if($xml_data -> retval == 0 && $xml_data -> unique_code == $_GET["uniquecode"]) {
echo "<br /><fieldset>
<legend>Детали платежа</legend>
<strong>уникальный номер оплаченного счета</strong>: ".$xml_data -> inv."<br />
<strong>дата и время платежа</strong>: ".$xml_data -> date_pay."<br />
<strong>идентификатор оплаченного товара</strong>: ".$xml_data -> id_goods."<br />
<strong>сумма, зачисленная на ваш счет</strong>: ".$xml_data -> amount."<br />
<strong>тип валюты, зачисленный на ваш счет</strong>: ".$xml_data -> type_curr."<br />\r\n";
if(!empty($xml_data -> unit_goods) && !empty($xml_data -> cnt_goods)) {
echo "<strong>единица оплачиваемого товара</strong>: ".$xml_data -> unit_goods."<br />
<strong>количество единиц оплачиваемого товара</strong>: ".$xml_data -> cnt_goods."\r\n"; }
echo "</fieldset>\r\n"; }
else {echo "<br /><span class=\"warning\">Платеж не найден!</span>\r\n"; } } } }
?>

</body>
</html>
<?php
error_reporting(E_ALL ^ E_NOTICE);

define('PUN_ROOT', dirname(__FILE__).'/');

 
require PUN_ROOT.'config.php';
require PUN_ROOT.'include/common.php';


if ($pun_user['g_id'] != PUN_ADMIN)
	message($lang_common['No permission']);


/*
MySQL Dump PHP class by Avram, avramyu@gmail.com
*/

class MySQLDump {

	var $tables = array();
	var $connected = false;
	var $output;
	var $droptableifexists = false;
	var $mysql_error;

function connect($host,$user,$pass,$db) {
	$return = true;
	$conn = @mysql_connect($host,$user,$pass);
	if (!$conn) { $this->mysql_error = mysql_error(); $return = false; }
	$seldb = @mysql_select_db($db);
	if (!$seldb) { $this->mysql_error = mysql_error();  $return = false; }
	@mysql_query("SET NAMES 'UTF8'");
	$this->connected = $return;
	return $return;
}

function list_tables() {
	$return = true;
	if (!$this->connected) { $return = false; }
	$this->tables = array();
	$sql = mysql_query("SHOW TABLES");
	while ($row = mysql_fetch_array($sql)) {
		array_push($this->tables,$row[0]);
	}
	return $return;
}

function dump() {
	$this->output="";
	$this->list_tables() or trigger_error($this->mysql_error, E_USER_ERROR);
	foreach($this->tables as $table){
		$this->dump_table($table, false);
	}
	return true;
}

function list_values($tablename) {
	$sql = mysql_query("SELECT * FROM $tablename");
	$this->output .= "\n\n-- Dumping data for table: $tablename\n\n";
	while ($row = mysql_fetch_array($sql)) {
		$broj_polja = count($row) / 2;
		$this->output .= "INSERT INTO `$tablename` VALUES(";
		$buffer = '';
		for ($i=0;$i < $broj_polja;$i++) {
			$vrednost = trim($row[$i]);
			$vrednost = str_replace("\n",'',$vrednost);
			if (!is_integer($vrednost)) { $vrednost = "'".addslashes($vrednost)."'"; }
			$buffer .= $vrednost.', ';
		}
		$buffer = substr($buffer,0,count($buffer)-3);
		$this->output .= $buffer . ");\n";
	}
}

function dump_table($tablename, $single = true) {
	if ($single == true) $this->output = "";
	$this->POST_table_structure($tablename);
	$this->list_values($tablename);
}

function POST_table_structure($tablename) {
	$this->output .= "\n\n-- Dumping structure for table: $tablename\n\n";
	if ($this->droptableifexists) { $this->output .= "DROP TABLE IF EXISTS `$tablename`;\nCREATE TABLE `$tablename` (\n"; }
		else {
	$sql = mysql_query("SHOW CREATE TABLE $tablename");
    $this->output .= mysql_result($sql, 0, 'Create Table').';'; //"  PRIMARY KEY  (`$primary`)\n);\n";
	}
}

}


//wykonywanie dumpu

if (isset($_POST['dump']) && $_POST['dump']== 1)
	{
	set_time_limit(0);
	$backup = new MySQLDump();
		 
	$backup->droptableifexists = true;


	if($_POST['data'] == 1){
		$nazwa=date("d-m-Y").'-'.$db_name;
		
	}
	else
	{
		$nazwa=$db_name;
	}
		
	$backup->connect($db_host,$db_username,$db_password,$db_name);
		
	if (!$backup->connected) { die('Error: '.$backup->mysql_error); }
	
	$backup->dump();
	
	if($_POST['type'] == 'sql')
	{
		header("Content-type: text/sql;charset=iso-8859-2");
		header("Content-Disposition: attachment; filename=\"$nazwa.sql\"");
		$out=$backup->output;
		echo $out;
	}
	if($_POST['type'] == 'bz')
	{
		$out=bzcompress($backup->output);
		header('Content-Type: application/x-bzip2');
		header('Content-Encoding: bzip2'); 
		header('Content-Length: '.strlen($out)); 
		header("Content-Disposition: attachment; filename=\"$nazwa.sql.bzip2\"	");
		header('Cache-Control: no-cache, no-store, max-age=0, must-revalidate');
		header('Pragma: no-cache');
		// output data
		echo $out;
				
	}

}

?>

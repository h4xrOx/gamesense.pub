<?php

/**
 * Copyright (C) 2008-2012 FluxBB
 * based on code by Rickard Andersson copyright (C) 2002-2008 PunBB
 * License: http://www.gnu.org/licenses/gpl.html GPL version 2 or higher
 */

// Tell header.php to use the admin template
define('PUN_ADMIN_CONSOLE', 1);

define('PUN_ROOT', dirname(__FILE__).'/');
require PUN_ROOT.'config.php';
require PUN_ROOT.'include/common.php';
//require PUN_ROOT.'mysqldump/class.php';
require PUN_ROOT.'include/common_admin.php';






require PUN_ROOT.'lang/'.$admin_language.'/admin_dump.php';


	$page_title = array(pun_htmlspecialchars($pun_config['o_board_title']), $lang_admin_common['Admin'], $lang_admin_common['dump']);
	define('PUN_ACTIVE_PAGE', 'admin');
	require PUN_ROOT.'header.php';

	generate_admin_menu('dump');
	
	
	?>
	
	<div class="blockform">
		<h2><span><?php echo $lang_admin_common['dump']?></span></h2>
		<div class="box">
			<div class="inform">
					<fieldset style="padding:30px;width:150px;margin: 0 auto;">
						<form id="backup" method="post" action="dump.php">
								<input type="hidden" value="1" name="dump" />
								<div style="padding:5px;">
									<input type=checkbox  name="data" value="1">	<?php echo $lang_admin_dump['date']?>	
								</div>
								<select name="type">
									<option value="sql"><?php echo $db_name ?>.sql</option>
									<?php if (@function_exists('bzcompress')) {?>
										<option value="bz"><?php echo $db_name ?>.sql.bz2</option>
									<?php } ?>

								</select>
					</fieldset>
				<p class="submittop"><input type="submit" name="save" value="<?php echo $lang_admin_dump['make'] ?>" tabindex="6" /></p>
				</form>
		</div>
	</div>




 
<?php

require PUN_ROOT.'footer.php';

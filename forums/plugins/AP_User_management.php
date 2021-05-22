<?php
/***********************************************************************

  Copyright (C) 2010 Guillaume Ferrari (guillaume.ferrari@gmail.com) 
  and Quy Ton (quy@fluxbb.org) based on code Copyright (C) 2005 
  Connor Dunn (Connorhd@mypunbb.com)
  Version française originale : Maximilien Thiel (www.thiel.fr)

  This software is free software; you can redistribute it and/or modify it
  under the terms of the GNU General Public License as published
  by the Free Software Foundation; either version 2 of the License,
  or (at your option) any later version.

  This software is distributed in the hope that it will be useful, but
  WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place, Suite 330, Boston,
  MA  02111-1307  USA

************************************************************************/

// Make sure no one attempts to run this script "directly"
if (!defined('PUN'))
    exit;

// Tell admin_loader.php that this is indeed a plugin and that it is loaded
define('PUN_PLUGIN_LOADED', 1);
define('PLUGIN_VERSION', '1.5.0');

// Load the language file
if (file_exists(PUN_ROOT.'lang/'.$admin_language.'/user_management.php'))
	require PUN_ROOT.'lang/'.$admin_language.'/user_management.php';
else
	require PUN_ROOT.'lang/English/user_management.php';
	
// Load the register.php language file
require PUN_ROOT.'lang/'.$pun_user['language'].'/register.php';

// Load the register.php/profile.php language file
require PUN_ROOT.'lang/'.$pun_user['language'].'/prof_reg.php';


if (isset($_POST['add_user']))
{
	$username = pun_trim($_POST['username']);
	$email = strtolower(pun_trim($_POST['email']));
	$password2 = pun_trim($_POST['password2']);
		
	if ($_POST['random_pass'] == '1')
		$password = random_pass(8);
	else
		$password = pun_trim($_POST['password']);
		
	$errors = array();

	if (pun_strlen($password) < 4)
		$errors[] = $lang_prof_reg['Pass too short'];
	else if ($_POST['random_pass'] != '1' && $password != $password2)
		$errors[] = $lang_prof_reg['Pass not match'];

	check_username($username);

	// Validate e-mail
	require PUN_ROOT.'include/email.php';

	if (!is_valid_email($email))
		$errors[] = $lang_common['Invalid email'];

	// Check if it's a banned email address
	if (is_banned_email($email))
	{
		if ($pun_config['p_allow_banned_email'] == '0')
			$errors[] = $lang_prof_reg['Banned email'];
	}

	if ($pun_config['p_allow_dupe_email'] == '0')
	{
		// Check if someone else already has registered with that email address
		$result = $db->query('SELECT 1 FROM '.$db->prefix.'users WHERE email=\''.$db->escape($email).'\'') or error('Unable to fetch user info', __FILE__, __LINE__, $db->error());
		if ($db->num_rows($result))
			$errors[] = $lang_prof_reg['Dupe email'];
	}
	
	if (empty($errors))
	{
		$timezone = $pun_config['o_default_timezone'];
		$language = $pun_config['o_default_lang'];
		$email_setting = $pun_config['o_default_email_setting'];

		// Insert the new user into the database. We do this now to get the last inserted id for later use.
		$now = time();

		$intial_group_id = ($_POST['random_pass'] == '0') ? $pun_config['o_default_user_group'] : PUN_UNVERIFIED;
		$password_hash = pun_hash($password);

		// Add the user
		$db->query('INSERT INTO '.$db->prefix.'users (username, group_id, password, email, email_setting, timezone, dst, language, style, registered, registration_ip, last_visit) VALUES(\''.$db->escape($username).'\', '.$intial_group_id.', \''.$password_hash.'\', \''.$email.'\', '.$email_setting.', '.$timezone.', '.$pun_config['o_default_dst'].', \''.$language.'\', \''.$pun_config['o_default_style'].'\', '.$now.', \''.get_remote_address().'\', '.$now.')') or error('Unable to create user', __FILE__, __LINE__, $db->error());
		$new_uid = $db->insert_id();

		// Should we alert people on the admin mailing list that a new user has registered?
		if ($pun_config['o_regs_report'] == '1')
		{
			$mail_subject = $lang_common['New user notification'];
			$mail_message = sprintf($lang_common['New user message'], $username, get_base_url().'/')."\n";
			$mail_message .= sprintf($lang_common['User profile'], get_base_url().'/profile.php?id='.$new_uid)."\n";
			$mail_message .= "\n".'--'."\n".$lang_common['Email signature'];

			pun_mail($pun_config['o_mailing_list'], $mail_subject, $mail_message);
		}

		// Must the user verify the registration or do we log him/her in right now?
		if ($_POST['random_pass'] == '1')
		{
			// Load the "welcome" template
			$mail_tpl = pun_trim(file_get_contents(PUN_ROOT.'lang/'.$pun_user['language'].'/mail_templates/welcome.tpl'));

			// The first row contains the subject
			$first_crlf = strpos($mail_tpl, "\n");
			$mail_subject = pun_trim(substr($mail_tpl, 8, $first_crlf-8));
			$mail_message = pun_trim(substr($mail_tpl, $first_crlf));

			$mail_subject = str_replace('<board_title>', $pun_config['o_board_title'], $mail_subject);
			$mail_message = str_replace('<base_url>', get_base_url().'/', $mail_message);
			$mail_message = str_replace('<username>', $username, $mail_message);
			$mail_message = str_replace('<password>', $password, $mail_message);
			$mail_message = str_replace('<login_url>', get_base_url().'/login.php', $mail_message);
			$mail_message = str_replace('<board_mailer>', $pun_config['o_board_title'].' '.$lang_common['Mailer'], $mail_message);

			pun_mail($email, $mail_subject, $mail_message);
		}
		
		// Regenerate the users info cache
		if (!defined('FORUM_CACHE_FUNCTIONS_LOADED'))
			require PUN_ROOT.'include/cache.php';

		generate_users_info_cache();
			
		message($lang_user_management['User created message']);
	}
	else
		$error_reg = 1;
}
	// Display the admin navigation menu
	generate_admin_menu($plugin);

?>
	<div class="plugin blockform">
		<h2><span><?php echo $lang_user_management['User management - v'] ?><?php echo PLUGIN_VERSION ?></span></h2>
		<div class="box">
			<div class="inbox">
				<p><?php echo $lang_user_management['Plugin add info'] ?></p>
			</div>
		</div>
	</div>
	<div class="blockform">

		
		<h2 class="block2"><span><?php echo $lang_user_management['Add user head'] ?></span></h2>
		<?php
		if (isset($error_reg))
		{
			?>
			<div id="posterror" style="border-style:none">
				<div class="box">
					<legend><?php echo $lang_register['Registration errors'] ?></legend>
					<div class="inbox error-info infldset">
						<p><?php echo $lang_register['Registration errors info'] ?></p>
							<ul class="error-list">
							<?php
								foreach ($errors as $cur_error)
									echo "\t\t\t\t".'<li><strong>'.$cur_error.'</strong></li>'."\n";
							?>
							</ul>
					</div>
				</div>
			</div>

			<?php
		}
		?>
		<div class="box">
			<form id="example" method="post" action="">
				<div class="inform">
					<fieldset>
						<legend><?php echo $lang_user_management['Settings subhead'] ?></legend>
						<div class="infldset">
						<table class="aligntop" cellspacing="0">
							<tr>
								<th scope="row"><?php echo $lang_common['Username'] ?></th>
								<td>
									<input type="text" name="username" value="<?php if (isset($_POST['username'])) echo pun_htmlspecialchars($_POST['username']); ?>" size="25" tabindex="4" />
								</td>
							</tr>
							<tr>
								<th scope="row"><?php echo $lang_common['Email'] ?></th>
								<td>
									<input type="text" name="email" value="<?php if (isset($_POST['email'])) echo pun_htmlspecialchars($_POST['email']); ?>" size="50" tabindex="5" />
								</td>
							</tr>
							<tr>
								<th scope="row"><?php echo $lang_user_management['Generate random password label'] ?></th>
								<td>
									<input type="radio" name="random_pass" value="1" />&#160;<strong><?php echo $lang_admin_common['Yes'] ?></strong>&#160;&#160;&#160;<input type="radio" name="random_pass" value="0" checked="checked" />&#160;<strong><?php echo $lang_admin_common['No'] ?></strong>
									<span><?php echo $lang_user_management['Generate random password help'] ?></span>
								</td>
							</tr>
							<tr>
								<th scope="row"><?php echo $lang_common['Password'] ?></th>
								<td>
									<input type="password" name="password" value="<?php if (isset($_POST['password'])) echo pun_htmlspecialchars($_POST['password']); ?>" size="25" tabindex="6" />
									<span><?php echo $lang_user_management['Password help'] ?></span>
								</td>
							</tr>
							<tr>
								<th scope="row"><?php echo $lang_prof_reg['Confirm pass'] ?></th>
								<td>
									<input type="password" name="password2" value="<?php if (isset($_POST['password2'])) echo pun_htmlspecialchars($_POST['password2']); ?>" size="25" tabindex="6" />
									<span><?php echo $lang_register['Pass info'] ?></span>
								</td>
							</tr>
						</table>
						</div>
					</fieldset>
				</div>
				<p class="submitend"><input type="submit" name="add_user" value="<?php echo $lang_admin_common['Add'] ?>" tabindex="7" /></p>
			</form>
		</div>
	</div>
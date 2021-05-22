<?php
/*
	Like mod for FluxBB
	Coded by adaur & soyuka
	Contact: adaur.underground@gmail.com
	2012
*/

define('PUN_ROOT', dirname(__FILE__).'/');
require PUN_ROOT.'include/common.php';

// Make sure form_user is correct
if ($pun_user['is_guest'])
	message($lang_common['No permission']);

$pid = isset($_GET['pid']) ? intval($_GET['pid']) : 0;
if ($pid < 1)
	message($lang_common['Bad request']);
	
$unlike = isset($_GET['unlike']) ? intval($_GET['unlike']) : 0;

// Fetch some info about the likes
$result = $db->query('SELECT p.id, p.poster_id, p.likes, f.id, fp.read_forum FROM '.$db->prefix.'posts AS p LEFT JOIN '.$db->prefix.'topics AS t ON t.id=p.topic_id LEFT JOIN '.$db->prefix.'forums AS f ON f.id=t.forum_id LEFT JOIN '.$db->prefix.'forum_perms AS fp ON (fp.forum_id=f.id AND fp.group_id=1) WHERE (fp.read_forum IS NULL OR fp.read_forum=1) AND p.id='.$pid) or error('Unable to fetch topic and like info', __FILE__, __LINE__, $db->error());

if (!$db->num_rows($result))
	message($lang_common['Bad request']);

$cur_like = $db->fetch_assoc($result);

if ($cur_like['read_forum'] == '0')
	message($lang_common['No permission']);

if ($cur_like['poster_id'] == $pun_user['id'])
	message($lang_like_mod['Self like']);

if (!empty($cur_like['likes']))
{
	// Make sure we got here from the site
	confirm_referrer('viewtopic.php');
	
	$likes = unserialize($cur_like['likes']);
	
	// Check if the person has already voted
	if (isset($likes[$pun_user['id']]))
	{
		if ($unlike == 1)
		{
			unset($likes[$pun_user['id']]);

			if (empty($likes))
				$likes_serialized = '';
			else
				// Serialize the array
				$likes_serialized = serialize($likes);
				
			// Update the database
			$db->query('UPDATE '.$db->prefix.'posts SET likes=\''.$db->escape($likes_serialized).'\' WHERE id='.$pid) or error('Unable to update likes', __FILE__, __LINE__, $db->error());
			
			redirect('viewtopic.php?pid='.$pid.'#p'.$pid, "Like registered");
		}
		else
			message($lang_common['Bad request']);;
	}
}
else
	$likes = array();

// Add the voter to the voters array
$likes[$pun_user['id']] = $pun_user['username'];
// Serialize the array
$likes_serialized = serialize($likes);

// Update the database
$db->query('UPDATE '.$db->prefix.'posts SET likes=\''.$db->escape($likes_serialized).'\' WHERE id='.$pid) or error('Unable to update likes', __FILE__, __LINE__, $db->error());

redirect('viewtopic.php?pid='.$pid.'#p'.$pid, "Like registered");
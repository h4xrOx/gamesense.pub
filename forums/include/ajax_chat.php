<?php

//
// Ajax Chat shoutbox integration by adaur
// Written by Sebastian Tschan
// Contributors : Ettelcar, Massimiliano Tiraboschi, Xytovl
// Copyright (c) Sebastian Tschan
// License GNU Affero General Public License
// See https://blueimp.net/ajax/
//

// There is 2 strings more in /chat/js/lang/XX.js (message and submit)
if ($pun_user['language'] == 'French')
{
	$lang_ajax_chat = array(

	'Shoutbox'		=>	'Chatbox',
	'Messages'		=>	'Messages',

	);
}
else
{
	$lang_ajax_chat = array(

	'Shoutbox'		=>	'Shoutbox',
	'Messages'		=>	'Messages',

	);
}

$allow_guests = 1; // Set to 1 if you want to allow guests

function getShoutBoxContent() {

    // URL to the chat directory:
    if(!defined('AJAX_CHAT_URL')) {
        define('AJAX_CHAT_URL', './chat/');
    }
    
    // Path to the chat directory:
    if(!defined('AJAX_CHAT_PATH')) {
        define('AJAX_CHAT_PATH', realpath(dirname($_SERVER['SCRIPT_FILENAME']).'/chat').'/');
    }
    
    // Validate the path to the chat:
    if(@is_file(AJAX_CHAT_PATH.'lib/classes.php')) {
        
        // Include Class libraries:
        require(AJAX_CHAT_PATH.'lib/classes.php');
        
        // Initialize the shoutbox:
        $ajaxChat = new CustomAJAXChatShoutBox();
        
        // Parse and return the shoutbox template content:
        return $ajaxChat->getShoutBoxContent();
    }
    
    return null;
}

if(!$pun_user['is_guest'] || $allow_guests) :
?>
<div id="idx1" class="blocktable">
	<h2><span>Chat</span></h2>
	<div class="box">
		<div class="inbox">
			
			<thead>
				<tr>
					<th class="tcl" scope="col"></th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		
			<?php echo getShoutBoxContent(); ?>
		</div>
	</div>
</div>
<?php
endif;
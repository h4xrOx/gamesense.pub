<div id="ajaxChatContent">
    <script src="[AJAX_CHAT_URL/]js/chat.js" type="text/javascript" charset="UTF-8"></script>
    <script src="[AJAX_CHAT_URL/]js/custom.js" type="text/javascript" charset="UTF-8"></script>
    <script src="[AJAX_CHAT_URL/]js/shoutbox.js" type="text/javascript" charset="UTF-8"></script>
    <script src="[AJAX_CHAT_URL/]js/lang/[LANG_CODE/].js" type="text/javascript" charset="UTF-8"></script>
    <script src="[AJAX_CHAT_URL/]js/config.js" type="text/javascript" charset="UTF-8"></script>
    <script src="[AJAX_CHAT_URL/]js/FABridge.js" type="text/javascript" charset="UTF-8"></script>
    <div id="ajaxChatChatList"></div>
    <div id="ajaxChatInputFieldContainer">
			
					<th scope="col"><script type="text/javascript"></script> <input id="ajaxChatInputField" type="text" maxlength="140" onkeypress="ajaxChat.handleInputFieldKeyPress(event);"/> <script type="text/javascript">document.write('')</script>
					
					<select id="emojiselector">
			<option selected disabled hidden>😀</option>
					<option>:)</option>
					
						<option>:(</option>
					<option>;)</option>
					<option>:P</option>
					<option>:D</option>
					<option>:|</option>
					<option>:O</option>
					<option>:?</option>
					<option>8)</option>
					<option>8o</option>
					<option>B)</option>
			
					
					<option>:-)</option>
<option>:-(</option>
<option>:-*</option>
<option>O:-D</option>
<option>>:-D</option>
<option>:o)</option>
<option>:idea:</option>
<option>:important:</option>
<option>:help:</option>
<option>:error:</option>
<option>:warning:</option>
<option>:favorite:</option>
					
					
					
					
					</select>
		
	</div>
		<script type="text/javascript">

		document.getElementById("emojiselector").onchange = function(){
		
    document.getElementById("emojiselector").value = this.value;

	var input = document.getElementById('ajaxChatInputField');
        input.value = input.value + document.getElementById("emojiselector").value;
};
	
	
	
	
	</script>
    <script type="text/javascript">
        // <![CDATA[
            ajaxChatConfig.ajaxURL = '[AJAX_CHAT_URL/]?ajax=true&shoutbox=true';
            ajaxChatConfig.baseURL = '[AJAX_CHAT_URL/]';
    
            ajaxChatConfig.sessionName = '[SESSION_NAME/]';
            ajaxChatConfig.cookieExpiration = parseInt('[COOKIE_EXPIRATION/]');
            ajaxChatConfig.cookiePath = '[COOKIE_PATH/]';
            ajaxChatConfig.cookieDomain = '[COOKIE_DOMAIN/]';
            ajaxChatConfig.cookieSecure = '[COOKIE_SECURE/]';
            ajaxChatConfig.chatBotName = decodeURIComponent('[CHAT_BOT_NAME/]');
            ajaxChatConfig.chatBotID = '[CHAT_BOT_ID/]';
            ajaxChatConfig.allowUserMessageDelete = parseInt('[ALLOW_USER_MESSAGE_DELETE/]');
            ajaxChatConfig.inactiveTimeout = parseInt('[INACTIVE_TIMEOUT/]');
            ajaxChatConfig.privateChannelDiff = parseInt('[PRIVATE_CHANNEL_DIFF/]');
            ajaxChatConfig.privateMessageDiff = parseInt('[PRIVATE_MESSAGE_DIFF/]');
            ajaxChatConfig.showChannelMessages = false;
            ajaxChatConfig.messageTextMaxLength = parseInt('[MESSAGE_TEXT_MAX_LENGTH/]');
            ajaxChatConfig.socketServerEnabled = parseInt('[SOCKET_SERVER_ENABLED/]');
            ajaxChatConfig.socketServerHost = decodeURIComponent('[SOCKET_SERVER_HOST/]');
            ajaxChatConfig.socketServerPort = parseInt('[SOCKET_SERVER_PORT/]');
            ajaxChatConfig.socketServerChatID = parseInt('[SOCKET_SERVER_CHAT_ID/]');
    
            ajaxChatConfig.domIDs['chatList'] = 'ajaxChatChatList';
            ajaxChatConfig.domIDs['inputField'] = 'ajaxChatInputField';
            ajaxChatConfig.domIDs['flashInterfaceContainer'] = 'ajaxChatFlashInterfaceContainer';

            ajaxChatConfig.startChatOnLoad = false;

            ajaxChatConfig.settings.autoFocus = false;
            ajaxChatConfig.settings.wordWrap = true;
            ajaxChatConfig.settings.maxWordLength = 11;
            ajaxChatConfig.settings.blink = false;
            ajaxChatConfig.nonPersistentSettings.push('autoFocus','wordWrap','maxWordLength','blink');
            
            ajaxChat.init(ajaxChatConfig, ajaxChatLang, true, false, true);
        // ]]>
    </script>

    <!--
        Please retain the full copyright notice below including the link to blueimp.net.
        This not only gives respect to the amount of time given freely by the developer
        but also helps build interest, traffic and use of AJAX Chat.
        
        Thanks,
        Sebastian Tschan
    //-->
</div>
<div id="ajaxChatFlashInterfaceContainer"></div>
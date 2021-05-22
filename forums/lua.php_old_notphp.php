<head>
<title>Lua API / Resolvy</title>
</head>
<?php
define('PUN_ROOT', dirname(__FILE__).'/');
require PUN_ROOT.'include/common.php';
require PUN_ROOT.'header.php';
if ($pun_user['g_read_board'] == '0')
	message($lang_common['No view']);
?>

<div id="brdmain">
<h2 id="resolvyapiforlua"><span>Resolvy API for Lua</span></h2>
	<div class="box block fakeform">
<h1 id="resolvyapiforlua">Resolvy API for Lua</h1>

<ul>
<li><a href="#clientset_event_callback">client.set_event_callback</a></li>

<li><a href="#clientlog">client.log</a></li>

<li><a href="#clientexec">client.exec</a></li>

<li><a href="#clientuserid_to_entindex">client.userid_to_entindex</a></li>

<li><a href="#clientget_cvar">client.get_cvar</a></li>

<li><a href="#clientdraw_debug_text">client.draw_debug_text</a></li>

<li><a href="#clientdraw_hitboxes">client.draw_hitboxes</a></li>

<li><a href="#clientrandom_int">client.random_int</a></li>

<li><a href="#clientrandom_float">client.random_float</a></li>

<li><a href="#clientdraw_text">client.draw_text</a></li>

<li><a href="#clientdraw_rectangle">client.draw_rectangle</a></li>

<li><a href="#clientdraw_line">client.draw_line</a></li>

<li><a href="#clientworld_to_screen">client.world_to_screen</a></li>

<li><a href="#clientscreen_size">client.screen_size</a></li>

<li><a href="#entityget_local_player">entity.get_local_player</a></li>

<li><a href="#entityget_all">entity.get_all</a></li>

<li><a href="#entityget_players">entity.get_players</a></li>

<li><a href="#entityget_classname">entity.get_classname</a></li>

<li><a href="#entityset_prop">entity.set_prop</a></li>

<li><a href="#entityget_prop">entity.get_prop</a></li>

<li><a href="#entityis_enemy">entity.is_enemy</a></li>

<li><a href="#entityget_player_name">entity.get_player_name</a></li>

<li><a href="#globalsrealtime">globals.realtime</a></li>

<li><a href="#globalscurtime">globals.curtime</a></li>

<li><a href="#globalsmaxplayers">globals.maxplayers</a></li>

<li><a href="#globalstickcount">globals.tickcount</a></li>

<li><a href="#globalstickinterval">globals.tickinterval</a></li>

<li><a href="#globalsmapname">globals.mapname</a></li>

<li><a href="#uinew_checkbox">ui.new_checkbox</a></li>

<li><a href="#uinew_slider">ui.new_slider</a></li>

<li><a href="#uinew_button">ui.new_button</a></li>

<li><a href="#uireference">ui.reference</a></li>

<li><a href="#uiset">ui.set</a></li>

<li><a href="#uiget">ui.get</a></li>
</ul>

<h3 id="clientset_event_callback">client.set_event_callback</h3>

<p><strong>syntax:</strong> <em>client.set_event_callback(event_name, callback)</em></p>

<p><code>event_name</code> - Name of the event.</p>

<p><code>callback</code> - Lua function to call when this event occurs.</p>

<p>Raises an error and prints a message in console upon failure.</p>

<p><sup><a href="#resolvyapiforlua">Back to TOC</a></sup></p><br>

<h3 id="clientlog">client.log</h3>

<p><strong>syntax:</strong> <em>client.log(msg, ...)</em></p>

<p><code>msg</code> - The message</p>

<p><code>...</code> - Optional arguments to concatenate with msg.</p>

<p><sup><a href="#resolvyapiforlua">Back to TOC</a></sup></p><br>

<h3 id="clientexec">client.exec</h3>

<p><strong>syntax:</strong> <em>client.exec(cmd, ...)</em></p>

<p><code>cmd</code> - The console command(s) to execute.</p>

<p><code>...</code> - Optional arguments to concatenate with cmd.</p>

<p><sup><a href="#resolvyapiforlua">Back to TOC</a></sup></p><br>

<h3 id="clientuserid_to_entindex">client.userid_to_entindex</h3>

<p><strong>syntax:</strong> <em>client.userid_to_entindex(userid)</em></p>

<p><code>userid</code> - This is given by some game events.</p>

<p>Returns the entity index, or 0 on failure.</p>

<p><sup><a href="#resolvyapiforlua">Back to TOC</a></sup></p><br>

<h3 id="clientget_cvar">client.get_cvar</h3>

<p><strong>syntax:</strong> <em>client.get_cvar(cvar_name)</em></p>

<p><code>cvar_name</code> - The name of the console variable.</p>

<p>Returns a string representing the current value of the convar, or nil on failure.</p>

<p><sup><a href="#resolvyapiforlua">Back to TOC</a></sup></p><br>

<h3 id="clientdraw_debug_text">client.draw_debug_text</h3>

<p><strong>syntax:</strong> <em>client.draw_debug_text(x, y, z, line_offset, duration, r, g, b, a, ...)</em></p>

<p><code>x</code> - Position in world space</p>

<p><code>y</code> - Position in world space</p>

<p><code>z</code> - Position in world space</p>

<p><code>line_offset</code> - Used for vertical alignment, use 0 for the first line.</p>

<p><code>duration</code> - Time in seconds that the text will remain on the screen.</p>

<p><code>r</code> - Red (1-255)</p>

<p><code>g</code> - Green (1-255)</p>

<p><code>b</code> - Blue (1-255)</p>

<p><code>a</code> - Alpha (1-255)</p>

<p><code>...</code> - The text that will be drawn</p>

<p><sup><a href="#resolvyapiforlua">Back to TOC</a></sup></p><br>

<h3 id="clientdraw_hitboxes">client.draw_hitboxes</h3>

<p><strong>syntax:</strong> <em>client.draw_hitboxes(entindex, duration, hitboxes, line_offset, duration, r, g, b)</em></p>

<p><code>entindex</code> - Entity index</p>

<p><code>duration</code> - Time in seconds</p>

<p><code>hitboxes</code> - Either the hitbox index, an array of hitbox indices, or 19 for all hitboxes</p>

<p><code>line_offset</code> - Used for vertical alignment, use 0 for the first line</p>

<p><code>duration</code> - Time in seconds that the text will remain on the screen</p>

<p><code>r</code> - Red (1-255)</p>

<p><code>g</code> - Green (1-255)</p>

<p><code>b</code> - Blue (1-255)</p>

<p><sup><a href="#resolvyapiforlua">Back to TOC</a></sup></p><br>

<h3 id="clientrandom_int">client.random_int</h3>

<p><strong>syntax:</strong> <em>client.random_int(minimum, maximum)</em></p>

<p><code>minimum</code> - Lowest possible result</p>

<p><code>maximum</code> - Highest possible result</p>

<p>Returns a random integer between minimum and maximum.</p>

<p><sup><a href="#resolvyapiforlua">Back to TOC</a></sup></p><br>

<h3 id="clientrandom_float">client.random_float</h3>

<p><strong>syntax:</strong> <em>client.random_float(minimum, maximum)</em></p>

<p><code>minimum</code> - Lowest possible result</p>

<p><code>maximum</code> - Highest possible result</p>

<p>Returns a random float between minimum and maximum.</p>

<p><sup><a href="#resolvyapiforlua">Back to TOC</a></sup></p><br>

<h3 id="clientdraw_text">client.draw_text</h3>

<p><strong>syntax:</strong> <em>client.draw_text(paint_ctx, x, y, r, g, b, a, flags, max_width, ...)</em></p>

<p><code>paint_ctx</code> - The context passed to your 'paint' event callback</p>

<p><code>x</code> - Screen coordinate</p>

<p><code>y</code> - Screen coordinate</p>

<p><code>r</code> - Red (1-255)</p>

<p><code>g</code> - Green (1-255)</p>

<p><code>b</code> - Blue (1-255)</p>

<p><code>a</code> - Alpha (1-255)</p>

<p><code>flags</code> - "+" for large text, "-" for small text, "c" for centered text. "c" can be combined with other flags. "nil" can be used for normal sized uncentered text</p>

<p><code>max_width</code> - Text will be clipped if it exceeds this width in pixels</p>

<p><code>...</code> - Text that will be drawn</p>

<p>This can only be called from the <code>paint</code> callback.</p>

<p><sup><a href="#resolvyapiforlua">Back to TOC</a></sup></p><br>

<h3 id="clientdraw_rectangle">client.draw_rectangle</h3>

<p><strong>syntax:</strong> <em>client.draw_rectangle(paint_ctx, x, y, w, h, r, g, b, a)</em></p>

<p><code>paint_ctx</code> - The context passed to your 'paint' event callback</p>

<p><code>x</code> - Screen coordinate</p>

<p><code>y</code> - Screen coordinate</p>

<p><code>w</code> - Width in pixels</p>

<p><code>h</code> - Height in pixels</p>

<p><code>r</code> - Red (1-255)</p>

<p><code>g</code> - Green (1-255)</p>

<p><code>b</code> - Blue (1-255)</p>

<p><code>a</code> - Alpha (1-255)</p>

<p>This can only be called from the <code>paint</code> callback.</p>

<p><sup><a href="#resolvyapiforlua">Back to TOC</a></sup></p><br>

<h3 id="clientdraw_line">client.draw_line</h3>

<p><strong>syntax:</strong> <em>client.draw_line(paint_ctx, xa, ya, xb, yb, r, g, b, a)</em></p>

<p><code>paint_ctx</code> - The context passed to your 'paint' event callback</p>

<p><code>xa</code> - Screen coordinate of point A</p>

<p><code>ya</code> - Screen coordinate of point A</p>

<p><code>xb</code> - Screen coordinate of point B</p>

<p><code>yb</code> - Screen coordinate of point B</p>

<p><code>r</code> - Red (1-255)</p>

<p><code>g</code> - Green (1-255)</p>

<p><code>b</code> - Blue (1-255)</p>

<p><code>a</code> - Alpha (1-255)</p>

<p>This can only be called from the <code>paint</code> callback.</p>

<p><sup><a href="#resolvyapiforlua">Back to TOC</a></sup></p><br>

<h3 id="clientworld_to_screen">client.world_to_screen</h3>

<p><strong>syntax:</strong> <em>client.world_to_screen(paint_ctx, x, y, z)</em></p>

<p><code>paint_ctx</code> - The context passed to your 'paint' event callback</p>

<p><code>x</code> - Position in world space</p>

<p><code>y</code> - Position in world space</p>

<p><code>z</code> - Position in world space</p>

<p>Returns two screen coordinates (x, y), or <code>nil</code> if the world position is not visible on your screen. This can only be called from the <code>paint</code> callback.</p>

<p><sup><a href="#resolvyapiforlua">Back to TOC</a></sup></p><br>

<h3 id="clientscreen_size">client.screen_size</h3>

<p><strong>syntax:</strong> <em>client.screen_size()</em></p>

<p>Returns <code>(width, height)</code>.</p>

<p><sup><a href="#resolvyapiforlua">Back to TOC</a></sup></p><br>

<h3 id="entityget_local_player">entity.get_local_player</h3>

<p><strong>syntax:</strong> <em>entity.get_local_player()</em></p>

<p>Returns the entity index for the local player, or nil on failure.</p>

<p><sup><a href="#resolvyapiforlua">Back to TOC</a></sup></p><br>

<h3 id="entityget_all">entity.get_all</h3>

<p><strong>syntax:</strong> <em>entity.get_all(classname)</em></p>

<p><code>classname</code> - Optional. If provided, only entities of this type are added to the list.</p>

<p>Returns an array of entity indices, or nil on failure. The value of <code>classname</code> is ignored, this function only checks whether or not an argument was passed. Pass no arguments for all players.</p>

<p><sup><a href="#resolvyapiforlua">Back to TOC</a></sup></p><br>

<h3 id="entityget_players">entity.get_players</h3>

<p><strong>syntax:</strong> <em>entity.get_players(enemies_only)</em></p>

<p><code>enemies_only</code> - Optional. If provided, you and the players on your team will not be added to the list.</p>

<p>Returns an array of player entity indices, or nil on failure. The value of <code>enemies_only</code> is ignored, this function only checks whether or not an argument was passed. Pass no arguments for all players.</p>

<p><sup><a href="#resolvyapiforlua">Back to TOC</a></sup></p><br>

<h3 id="entityget_classname">entity.get_classname</h3>

<p><strong>syntax:</strong> <em>entity.get_classname(ent)</em></p>

<p><code>ent</code> - Entity index.</p>

<p>Returns the name of the entity's class, or nil on failure.</p>

<p><sup><a href="#resolvyapiforlua">Back to TOC</a></sup></p><br>

<h3 id="entityset_prop">entity.set_prop</h3>

<p><strong>syntax:</strong> <em>entity.set_prop(ent, propname, value)</em></p>

<p><code>ent</code> - Entity index.</p>

<p><code>propname</code> - Name of the networked property.</p>

<p><code>value</code> - The property will be set to this value. For vectors or angles, separate the components by commas.</p>

<p><sup><a href="#resolvyapiforlua">Back to TOC</a></sup></p><br>

<h3 id="entityget_prop">entity.get_prop</h3>

<p><strong>syntax:</strong> <em>entity.get_prop(ent, propname)</em></p>

<p><code>ent</code> - Entity index.</p>

<p><code>propname</code> - Name of the networked property.</p>

<p>Returns the value of the property, or nil on failure. For vectors or angles, this returns three values.</p>

<p><sup><a href="#resolvyapiforlua">Back to TOC</a></sup></p><br>

<h3 id="entityis_enemy">entity.is_enemy</h3>

<p><strong>syntax:</strong> <em>entity.is_enemy(ent)</em></p>

<p><code>ent</code> - Entity index.</p>

<p>Returns true if the entity is on the other team.</p>

<p><sup><a href="#resolvyapiforlua">Back to TOC</a></sup></p><br>

<h3 id="entityget_player_name">entity.get_player_name</h3>

<p><strong>syntax:</strong> <em>entity.get_player_name(ent)</em></p>

<p><code>ent</code> - Entity index.</p>

<p>Returns the player's name, or nil on failure.</p>

<p><sup><a href="#resolvyapiforlua">Back to TOC</a></sup></p><br>

<h3 id="globalsrealtime">globals.realtime</h3>

<p><strong>syntax:</strong> <em>globals.realtime()</em></p>

<p>Returns the local time in seconds.</p>

<p><sup><a href="#resolvyapiforlua">Back to TOC</a></sup></p><br>

<h3 id="globalscurtime">globals.curtime</h3>

<p><strong>syntax:</strong> <em>globals.curtime()</em></p>

<p>Returns the game time in seconds. This number is synchronized with the server.</p>

<p><sup><a href="#resolvyapiforlua">Back to TOC</a></sup></p><br>

<h3 id="globalsmaxplayers">globals.maxplayers</h3>

<p><strong>syntax:</strong> <em>globals.maxplayers()</em></p>

<p>Returns the maximum number of players in the server.</p>

<p><sup><a href="#resolvyapiforlua">Back to TOC</a></sup></p><br>

<h3 id="globalstickcount">globals.tickcount</h3>

<p><strong>syntax:</strong> <em>globals.tickcount()</em></p>

<p>Returns the number of ticks elapsed in the server.</p>

<p><sup><a href="#resolvyapiforlua">Back to TOC</a></sup></p><br>

<h3 id="globalstickinterval">globals.tickinterval</h3>

<p><strong>syntax:</strong> <em>globals.tickinterval()</em></p>

<p>Returns the time elapsed in one game tick in seconds.</p>

<p><sup><a href="#resolvyapiforlua">Back to TOC</a></sup></p><br>

<h3 id="globalsmapname">globals.mapname</h3>

<p><strong>syntax:</strong> <em>globals.mapname()</em></p>

<p>Returns the name of the loaded map, or nil if you are not in game.</p>

<p><sup><a href="#resolvyapiforlua">Back to TOC</a></sup></p><br>

<h3 id="uinew_checkbox">ui.new_checkbox</h3>

<p><strong>syntax:</strong> <em>ui.new_checkbox(tab, container, name)</em></p>

<p><code>tab</code> - The name of the tab: AA, RAGE, LEGIT, MISC, PLAYERS, SKINS, or VISUALS.</p>

<p><code>container</code> - The name of the existing container to which this checkbox will be added.</p>

<p><code>name</code> - The name of the checkbox.</p>

<p>Returns a special variable that can be passed to 'ui.get' and 'ui.set', or throws an error on failure.</p>

<p><sup><a href="#resolvyapiforlua">Back to TOC</a></sup></p><br>

<h3 id="uinew_slider">ui.new_slider</h3>

<p><strong>syntax:</strong> <em>ui.new_slider(tab, container, name, min, max)</em></p>

<p><code>tab</code> - The name of the tab: AA, RAGE, LEGIT, MISC, PLAYERS, SKINS, or VISUALS.</p>

<p><code>container</code> - The name of the existing container to which this checkbox will be added.</p>

<p><code>name</code> - The name of the slider.</p>

<p><code>min</code> - The minimum value that can be set using the slider.</p>

<p><code>max</code> - The maximum value that can be set using the slider.</p>

<p>Returns a special variable that can be passed to 'ui.get' and 'ui.set', or throws an error on failure.</p>

<p><sup><a href="#resolvyapiforlua">Back to TOC</a></sup></p><br>

<h3 id="uinew_button">ui.new_button</h3>

<p><strong>syntax:</strong> <em>ui.new_button(tab, container, name, callback)</em></p>

<p><code>tab</code> - The name of the tab: AA, RAGE, LEGIT, MISC, PLAYERS, SKINS, or VISUALS.</p>

<p><code>container</code> - The name of the existing container to which this checkbox will be added.</p>

<p><code>name</code> - The name of the button.</p>

<p><code>callback</code> - The lua function that will be called when the button is pressed.</p>

<p>Throws an error on failure. This return value can not be used with <code>ui.set</code> or <code>ui.get</code>.</p>

<p><sup><a href="#resolvyapiforlua">Back to TOC</a></sup></p><br>

<h3 id="uireference">ui.reference</h3>

<p><strong>syntax:</strong> <em>ui.reference(tab, container, name)</em></p>

<p><code>tab</code> - The name of the tab: AA, RAGE, LEGIT, MISC, PLAYERS, SKINS, or VISUALS.</p>

<p><code>container</code> - The name of the existing container to which this checkbox will be added.</p>

<p><code>name</code> - The name of the menu item.</p>

<p>Throws an error on failure.</p>

<p><sup><a href="#resolvyapiforlua">Back to TOC</a></sup></p><br>

<h3 id="uiset">ui.set</h3>

<p><strong>syntax:</strong> <em>ui.set(item, value)</em></p>

<p><code>item</code> - The result of either new_checkbox or new_slider.</p>

<p><code>value</code> - <code>true</code> or <code>false</code> for a checkbox, or an integer for a slider. Do not pass an integer that is outside of a slider's minimum/maximum value.</p>

<p><sup><a href="#resolvyapiforlua">Back to TOC</a></sup></p><br>

<h3 id="uiget">ui.get</h3>

<p><strong>syntax:</strong> <em>ui.get(item)</em></p>

<p><code>item</code> - The result of either new_checkbox or new_slider.</p>

<p>Returns <code>true</code> or <code>false</code> for a checkbox, an integer for a slider, or a string for a combobox.</p>

<p><sup><a href="#resolvyapiforlua">Back to TOC</a></sup></p><br>
	</div>
</div>

<?php
require PUN_ROOT.'footer.php';
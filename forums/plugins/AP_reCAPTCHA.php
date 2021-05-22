<?php

/**
 * New reCAPTCHA plugin for FluxBB
 *
 * Created by Franz Liedke
 */

// Make sure no one attempts to run this script "directly"
if (!defined('PUN'))
    exit;

// Tell admin_loader.php that this is indeed a plugin and that it is loaded
define('PUN_PLUGIN_LOADED', 1);


// Store the config
if (isset($_POST['process_form']))
{
    $site_key = isset($_POST['recaptcha_site_key']) ? pun_trim($_POST['recaptcha_site_key']) : '';
    $secret_key = isset($_POST['recaptcha_secret_key']) ? pun_trim($_POST['recaptcha_secret_key']) : '';

    foreach (compact('site_key', 'secret_key') as $key => $value)
    {
        $key = 'recaptcha_'.$key;

        if (isset($pun_config[$key]))
            $db->query('UPDATE '.$db->prefix.'config SET conf_value = \''.$db->escape($value).'\' WHERE conf_name = \''.$db->escape($key).'\'') or error('Unable to update config value for '.$key, __FILE__, __LINE__, $db->error());
        else
            $db->query('INSERT INTO '.$db->prefix.'config (conf_name, conf_value) VALUES (\''.$db->escape($key).'\', \''.$db->escape($value).'\')') or error('Unable to store config value for '.$key, __FILE__, __LINE__, $db->error());
    }

    // Regenerate the config cache
    if (!defined('FORUM_CACHE_FUNCTIONS_LOADED'))
        require PUN_ROOT.'include/cache.php';

    generate_config_cache();

    redirect('admin_loader.php?plugin=AP_reCAPTCHA.php', 'Settings saved successfully. Redirecting...');
}


// Display the admin navigation menu
generate_admin_menu($plugin);

?>

<div class="blockform">
    <h2><span>reCAPTCHA</span></h2>
    <div class="box">
        <form id="recaptcha" method="post" action="<?php echo $_SERVER['REQUEST_URI'] ?>">
            <div class="inform">
                <fieldset>
                    <legend>Configure reCAPTCHA integration</legend>
                    <div class="infldset">
                        <p>
                            Please provide your reCAPTCHA account credentials as provided by Google.
                        </p>
                        <table class="aligntop" cellspacing="0">
                            <tr>
                                <th scope="row">Site key</th>
                                <td>
                                    <input type="text" name="recaptcha_site_key" size="40" value="<?php if (!empty($pun_config['recaptcha_site_key'])) echo pun_htmlspecialchars($pun_config['recaptcha_site_key']); ?>" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">Secret key</th>
                                <td>
                                    <input type="text" name="recaptcha_secret_key" size="40" value="<?php if (!empty($pun_config['recaptcha_secret_key'])) echo pun_htmlspecialchars($pun_config['recaptcha_secret_key']); ?>" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </fieldset>
            </div>
            <p class="submitend"><input type="submit" name="process_form" value="Save" /></p>
        </form>
    </div>
</div>

<?php


    function register($manager)
    {
        if (is_configured())
        {
            $manager->bind('register_after_validation', array($this, 'hook_register_after_validation'));
            $manager->bind('register_before_submit', array($this, 'hook_register_before_submit'));
        }
    }

    function is_configured()
    {
        global $pun_config;

        return !empty($pun_config['recaptcha_site_key']) && !empty($pun_config['recaptcha_secret_key']);
    }

    function hook_register_after_validation()
    {
        global $errors;

        if (empty($errors) && !verify_user_response())
        {
            $errors[] = 'Please prove that you are human.';
        }
    }

    function hook_register_before_submit()
    {
        global $pun_config;

        $site_key = $pun_config['recaptcha_site_key'];

?>
        <div class="inform">
            <fieldset>
                <legend>Are you a human?</legend>
                <div class="infldset">
                    <p>Please prove that you're a human being.</p>
                    <script src="https://www.google.com/recaptcha/api.js"></script>
                    <div class="g-recaptcha" data-sitekey="<?php echo pun_htmlspecialchars($site_key) ?>"></div>
                </div>
            </fieldset>
        </div>
<?php
    }

    function verify_user_response()
    {
        global $pun_config;

        if (empty($_POST['g-recaptcha-response'])) return false;

        $secret = $pun_config['recaptcha_secret_key'];
        $response = $_POST['g-recaptcha-response'];
        $ip = get_remote_address();

        $query = "secret=$secret&response=$response&remoteip=$ip";
        $url = "https://www.google.com/recaptcha/api/siteverify?$query";

        $response = send_request($url);

        return strpos($response, '"success": true') !== false;
    }

    function send_request($url)
    {
        if (function_exists('curl_version'))
            return send_curl_request($url);
        else
            return get_remote_file($url);
    }

    function send_curl_request($url)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        $response = curl_exec($ch);
        curl_close($ch);

        return $response;
    }
    
    function get_remote_file($url)
    {
        $response = file_get_contents($url);

        if ($response === false)
            throw new Exception('Cannot validate reCAPTCHA submission.');

        return $response;
    }


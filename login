<!DOCTYPE html>
<html lang="en" dir="ltr" class="sid-plesk">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="SKYPE_TOOLBAR" content="SKYPE_TOOLBAR_PARSER_COMPATIBLE">
        <meta name="format-detection" content="telephone=no">
        <title>Plesk Obsidian 18.0.33</title>
        <meta name="plesk-build" content="1800210225.14">
        <meta name="plesk-revision" content="5a4ce166a895c697e229650cb1bde558226c3fd3">
        <meta name="forgery_protection_token" id="forgery_protection_token" content="eb864f991ca346026d31e1b6b827dfb7">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
        <link rel="shortcut icon" href="/favicon.ico?1614236548">
        <link rel="stylesheet" href="/ui-library/plesk-ui-library.css?1610948141">
        <link rel="stylesheet" href="/cp/theme/css/main.css?1614226237">
        <script type="text/javascript" src="/cp/javascript/externals/prototype.js?1614226237"></script>
        <script type="text/javascript" src="/ui-library/plesk-ui-library.min.js?1610948141"></script>
        <script type="text/javascript" src="/cp/javascript/vendors.js?1614226237"></script>
        <script type="text/javascript" src="/cp/javascript/main.js?1614226237"></script>
        <script type="text/javascript" src="/cp/javascript/externals/require.js?1614226237"></script>
        <script type="text/javascript">
            //<!--
            require.config({
                "waitSeconds": 0,
                "baseUrl": "\/cp\/javascript\/",
                "urlArgs": "18.0.33-1",
                "paths": {
                    "modules": "\/modules"
                }
            });
            define('plesk-ui-library', window.PleskUiLibrary);
            //-->
        </script>
        <script type="text/javascript" src="/modules/letsencrypt/global.js?1613561526"></script>
        <script type="text/javascript"></script>
        <script type="text/javascript">
            //<!--
            Jsw.onReady(function() {

                var std_context = 'login_up';
                SetHelpPrefix('');
                SetContext(std_context);

            });

            //-->
        </script>
        <script type="text/javascript">
            Jsw.skinUrl = '/cp/theme/';
        </script>
        <!-- extension include: heavy-metal-skin -->
        <!-- extension include: social-login -->
        <script>
            //<![CDATA[
            Jsw.namespace('PleskExt.SocialLogin');
            //]]>
        </script>
        <link href="/modules/social-login/styles/main.css" rel="stylesheet">
    </head>
    <body class="sid-login">
        <div id="plesk-root"></div>
        <script>
            //<![CDATA[
            Plesk.run({
                "config": {
                    "feedback": {
                        "sentry": {
                            "release": "18.0.33.1",
                            "environment": "production",
                            "tags": {
                                "locale": "en-US",
                                "revision": "5a4ce166a895c697e229650cb1bde558226c3fd3",
                                "updateTicket": "724fe4ec-e541-425b-8bbc-2c4566a13cef"
                            },
                            "dsn": "https:\/\/50365a6fe24f4ff28f6b625410e04a35@sentry.io\/1327420",
                            "sampleRate": 0.05
                        }
                    },
                    "gdprCookies": {
                        "uat-iid": "analytics",
                        "uat-sid": "analytics",
                        "uat-data-source": "analytics"
                    }
                },
                "data": {
                    "isInitial": true,
                    "status": [],
                    "locale": {
                        "components.status.error": "Error",
                        "components.status.info": "Information",
                        "components.status.warning": "Warning",
                        "components.cookie-policy.info.title": "Tell us whether you accept cookies",
                        "components.cookie-policy.info.necessaryCookiesMessage": "By logging in to Plesk, you allow us to use necessary сookies.",
                        "components.cookie-policy.info.message": "%%cookieInformationLink%% about how you use Plesk. It helps us to improve our services so that you could make the most out of Plesk.",
                        "components.cookie-policy.info.cookieInformationLink": "Cookies collect information",
                        "components.cookie-policy.info.acceptButton": "Accept all cookies",
                        "components.cookie-policy.info.preferencesButton": "Set cookie preferences",
                        "components.cookie-policy.preferences.title": "Cookies in Plesk",
                        "components.cookie-policy.preferences.description": "Cookies are files saved on your phone, tablet, or computer when you visit Plesk. We use cookies to make Plesk work, to have it operate smoothly, and to collect certain information.",
                        "components.cookie-policy.preferences.settingsTitle": "Cookie settings",
                        "components.cookie-policy.preferences.settingsDescription": "We use 3 types of cookies. Enable those you allow us to use.",
                        "components.cookie-policy.preferences.analyticsTitle": "Cookies that help us to improve the product",
                        "components.cookie-policy.preferences.analyticsDescription": "We use anonymous tracking cookies to collect information on how you use Plesk. It helps us make Plesk better. Tracking cookies do not identify anyone. They store anonymized information about Plesk pages you visited, time your spent on them, and page objects you clicked on. We do not share the collected data with third-party services.",
                        "components.cookie-policy.preferences.marketingTitle": "Cookies that help with our communications and marketing",
                        "components.cookie-policy.preferences.marketingDescription": "These cookies collect information about your Plesk preferences and help us provide you with personal recommendations.",
                        "components.cookie-policy.preferences.necessaryTitle": "Strictly necessary cookies",
                        "components.cookie-policy.preferences.necessaryDescription": "These cookies enable Plesk core functions such as security, network management, and accessibility. These cookies always need to be on. Necessary cookies also include functional cookies that are in charge of personalization and usability improvements (for example, language settings, font size, and prefilled forms). You may disable necessary cookies in your %%browserSettingsLink%% but this may affect Plesk.",
                        "components.cookie-policy.preferences.browserSettingsLink": "browser settings",
                        "components.cookie-policy.preferences.pleskCookiesLink": "See the detailed description of the used cookies",
                        "components.cookie-policy.preferences.on": "On",
                        "components.cookie-policy.preferences.off": "Off",
                        "components.cookie-policy.preferences.submitButton": "Save changes",
                        "components.cookie-policy.preferences.cancelButton": "Cancel",
                        "loginLabel": "Username",
                        "passwdLabel": "Password",
                        "localeLabel": "Interface language",
                        "defaultLocale": "Default",
                        "loginButtonLabel": "Log in",
                        "enterLoginAndPasswd": "Enter your username and password.",
                        "forgotPasswordLabel": "Forgot your password?",
                        "cookies": "Cookies",
                        "avoidSSLWarningsMsg": "To avoid SSL warnings during Plesk login, use %%link%%"
                    },
                    "isCookiePolicyInfoEnabled": true,
                    "isCookiePolicyPreferencesEntrypointEnabled": true,
                    "values": {
                        "login_name": "",
                        "passwd": "",
                        "locale_id": "default"
                    },
                    "availableLocales": [{
                        "code": "en-US",
                        "name": "English (United States)",
                        "dir": "ltr"
                    }, {
                        "code": "id-ID",
                        "name": "Bahasa Indonesia (Indonesia)",
                        "dir": "ltr"
                    }, {
                        "code": "ca-ES",
                        "name": "Català (Spain)",
                        "dir": "ltr"
                    }, {
                        "code": "da-DK",
                        "name": "Dansk (Denmark)",
                        "dir": "ltr"
                    }, {
                        "code": "de-DE",
                        "name": "Deutsch (Germany)",
                        "dir": "ltr"
                    }, {
                        "code": "es-ES",
                        "name": "Español (Spain)",
                        "dir": "ltr"
                    }, {
                        "code": "tl-PH",
                        "name": "Filipino (Philippines)",
                        "dir": "ltr"
                    }, {
                        "code": "fr-FR",
                        "name": "Français (France)",
                        "dir": "ltr"
                    }, {
                        "code": "it-IT",
                        "name": "Italiano (Italy)",
                        "dir": "ltr"
                    }, {
                        "code": "hu-HU",
                        "name": "Magyar (Hungary)",
                        "dir": "ltr"
                    }, {
                        "code": "ms-MY",
                        "name": "Melayu (Malaysia)",
                        "dir": "ltr"
                    }, {
                        "code": "nl-NL",
                        "name": "Nederlands (Netherlands)",
                        "dir": "ltr"
                    }, {
                        "code": "nb-NO",
                        "name": "Norsk (Norway)",
                        "dir": "ltr"
                    }, {
                        "code": "pl-PL",
                        "name": "Polski (Poland)",
                        "dir": "ltr"
                    }, {
                        "code": "pt-BR",
                        "name": "Português (Brazil)",
                        "dir": "ltr"
                    }, {
                        "code": "pt-PT",
                        "name": "Português (Portugal)",
                        "dir": "ltr"
                    }, {
                        "code": "ro-RO",
                        "name": "Română (Romania)",
                        "dir": "ltr"
                    }, {
                        "code": "fi-FI",
                        "name": "Suomi (Finland)",
                        "dir": "ltr"
                    }, {
                        "code": "sv-SE",
                        "name": "Svenska (Sweden)",
                        "dir": "ltr"
                    }, {
                        "code": "vi-VN",
                        "name": "Tiếng Việt (Vietnam)",
                        "dir": "ltr"
                    }, {
                        "code": "tr-TR",
                        "name": "Türkçe (Turkey)",
                        "dir": "ltr"
                    }, {
                        "code": "cs-CZ",
                        "name": "Čeština (Czech Republic)",
                        "dir": "ltr"
                    }, {
                        "code": "el-GR",
                        "name": "Ελληνικά  (Greece)",
                        "dir": "ltr"
                    }, {
                        "code": "ru-RU",
                        "name": "Русский (Russia)",
                        "dir": "ltr"
                    }, {
                        "code": "uk-UA",
                        "name": "Український (Ukraine)",
                        "dir": "ltr"
                    }, {
                        "code": "he-IL",
                        "name": "עברית (Israel)",
                        "dir": "rtl"
                    }, {
                        "code": "ar",
                        "name": "العربية",
                        "dir": "rtl"
                    }, {
                        "code": "th-TH",
                        "name": "ไทย (Thailand)",
                        "dir": "ltr"
                    }, {
                        "code": "ja-JP",
                        "name": "日本語 (Japan)",
                        "dir": "ltr"
                    }, {
                        "code": "zh-CN",
                        "name": "简体中文 (China)",
                        "dir": "ltr"
                    }, {
                        "code": "zh-TW",
                        "name": "繁體中文 (Taiwan\/Hong Kong)",
                        "dir": "ltr"
                    }, {
                        "code": "ko-KR",
                        "name": "한국어 (Korea)",
                        "dir": "ltr"
                    }],
                    "extensionsAdditionalBody": "<div id=\"ext-social-login\" class=\"ext-social-login\">\n<svg xmlns=\"http:\/\/www.w3.org\/2000\/svg\" style=\"display: none;\">\n    <symbol id=\"btn-google\" viewBox=\"3 3 40 40\" fill=\"none\" fill-rule=\"evenodd\"><path fill=\"#4285F4\" d=\"M31.64 23.205c0-.64-.057-1.252-.164-1.84H23v3.48h4.844a4.14 4.14 0 0 1-1.796 2.716v2.26h2.908c1.702-1.566 2.684-3.874 2.684-6.614z\"\/><path fill=\"#34A853\" d=\"M23 32c2.43 0 4.467-.806 5.956-2.18l-2.908-2.26c-.806.54-1.837.86-3.048.86-2.344 0-4.328-1.583-5.036-3.71h-3.007v2.332A8.997 8.997 0 0 0 23 32z\"\/><path fill=\"#FBBC05\" d=\"M17.964 24.71a5.41 5.41 0 0 1-.282-1.71c0-.593.102-1.17.282-1.71v-2.332h-3.007A8.996 8.996 0 0 0 14 23c0 1.452.348 2.827.957 4.042l3.007-2.332z\"\/><path fill=\"#EA4335\" d=\"M23 17.58c1.32 0 2.508.454 3.44 1.345l2.582-2.58C27.462 14.89 25.426 14 23 14a8.997 8.997 0 0 0-8.043 4.958l3.007 2.332c.708-2.127 2.692-3.71 5.036-3.71z\"\/><path d=\"M14 14h18v18H14z\"\/><\/symbol>\n    <symbol id=\"btn-github\" viewBox=\"3 3 40 40\"><path d=\"M23 14a9 9 0 0 0-2.845 17.54c.45.083.614-.195.614-.434 0-.214-.01-.78-.018-1.53-2.503.543-3.03-1.207-3.03-1.207-.41-1.04-1-1.32-1-1.32-.818-.56.06-.55.06-.55.904.064 1.38.93 1.38.93.802 1.374 2.106.98 2.62.75.08-.58.313-.98.57-1.205-1.998-.227-4.1-1-4.1-4.448 0-.985.35-1.79.927-2.417-.093-.227-.4-1.143.09-2.38 0 0 .754-.24 2.473.922a8.62 8.62 0 0 1 2.256-.3 8.63 8.63 0 0 1 2.252.302c1.72-1.164 2.473-.922 2.473-.922.49 1.238.182 2.154.09 2.382.577.628.925 1.432.925 2.415 0 3.455-2.1 4.216-4.11 4.44.328.276.616.826.616 1.665 0 1.203-.01 2.174-.01 2.47 0 .24.162.52.618.432A9 9 0 0 0 23 14\"\/><\/symbol>\n    <symbol id=\"btn-facebook\" viewBox=\"3 3 40 40\"><path d=\"M17 23.48v4.958h3.037V43h5.84V28.376h4.074l.434-4.895h-4.508v-2.789c0-1.154.232-1.61 1.347-1.61h3.16V14h-4.043c-4.345 0-6.304 1.913-6.304 5.577v3.904H17z\"\/><\/symbol>\n    <symbol id=\"btn-myPlesk\" viewBox=\"0 0 40 40\"><style type=\"text\/css\">.st0{fill:#53BCE6;} .st1{clip-path:url(#SVGID_2_);} .st2{fill:#48A3D6;} .st3{fill:#FFFFFF;}<\/style><rect class=\"st0\" width=\"40\" height=\"40\"\/><g><defs><rect id=\"SVGID_1_\" width=\"40\" height=\"40\"\/><\/defs><clipPath id=\"SVGID_2_\"><use xlink:href=\"#SVGID_1_\"  style=\"overflow:visible;\"\/><\/clipPath><g class=\"st1\"><g><path class=\"st2\" d=\"M20,13.6l0-2.5l-2.6-0.9c-0.1-0.2-0.2-0.4-0.3-0.6l1.2-2.4l-1.7-1.7l-2.4,1.3c-0.2-0.1-0.5-0.2-0.7-0.3L12.6,4l-2.5,0L9.3,6.6C9,6.7,8.8,6.8,8.6,6.9L6.3,5.7L4.5,7.5l1.3,2.4c-0.1,0.2-0.2,0.5-0.3,0.7L3,11.4l0,2.5l2.6,0.9c0.1,0.2,0.2,0.4,0.3,0.7l-1.2,2.3l1.8,1.7l2.4-1.3c0.2,0.1,0.5,0.2,0.7,0.3l0.8,2.5l2.5,0l0.9-2.6l0.6-0.3l2.4,1.2l1.7-1.7l-1.3-2.4c0.1-0.2,0.2-0.5,0.3-0.7L20,13.6z M11.9,14.9c-1.4,0.2-2.6-0.7-2.8-2.1c-0.2-1.3,0.7-2.6,2.1-2.8c1.4-0.2,2.6,0.7,2.8,2.1C14.1,13.5,13.2,14.7,11.9,14.9z\"\/><path class=\"st3\" d=\"M19,12.6l0-2.5l-2.6-0.9c-0.1-0.2-0.2-0.4-0.3-0.6l1.2-2.4l-1.7-1.7l-2.4,1.3c-0.2-0.1-0.5-0.2-0.7-0.3L11.6,3L9.1,3L8.3,5.6C8,5.7,7.8,5.8,7.6,5.9L5.3,4.7L3.5,6.5l1.3,2.4C4.7,9.1,4.6,9.4,4.5,9.6L2,10.4l0,2.5l2.6,0.9c0.1,0.2,0.2,0.4,0.3,0.7l-1.2,2.3l1.8,1.7l2.4-1.3c0.2,0.1,0.5,0.2,0.7,0.3L9.4,20l2.5,0l0.9-2.6l0.6-0.3l2.4,1.2l1.7-1.7l-1.3-2.4c0.1-0.2,0.2-0.5,0.3-0.7L19,12.6z M10.9,13.9c-1.4,0.2-2.6-0.7-2.8-2.1c-0.2-1.3,0.7-2.6,2.1-2.8c1.4-0.2,2.6,0.7,2.8,2.1C13.1,12.5,12.2,13.7,10.9,13.9z\"\/><\/g><g><g><path class=\"st2\" d=\"M32,23c-5,0-9,4-9,9c0,5,4,9,9,9c5,0,9-4,9-9C41,27,37,23,32,23z M32,36c-2.2,0-4-1.8-4-4c0-2.2,1.8-4,4-4c2.2,0,4,1.8,4,4C36,34.2,34.2,36,32,36z\"\/><path class=\"st2\" d=\"M46.3,34.7l3.7-1.2l0-3.6l-3.9-1.3c-0.1-0.5-0.2-1-0.4-1.4l2.6-3l-1.8-3.1l-4,0.8c-0.3-0.3-0.6-0.6-0.9-0.9l0.8-3.7l-3-1.8l-3,2.6c-0.5-0.2-1.1-0.3-1.7-0.4L33.5,14l-3.6,0l-1.3,3.9c-0.5,0.1-1,0.2-1.4,0.4l-3-2.7l-3.1,1.8l0.9,4c-0.3,0.3-0.7,0.7-1,1l-3.9-0.8l-1.8,3.1l2.7,3l-0.4,1.4L14,30.5l0,3.6l3.9,1.3c0.1,0.4,0.2,0.9,0.4,1.4l-2.6,3l1.8,3.1l4-0.8c0.4,0.4,0.7,0.7,1.1,1l-0.8,3.9l3.1,1.7l3-2.7c0.4,0.2,0.9,0.3,1.4,0.4l1.3,3.8l3.6,0l1.3-3.9c0.5-0.1,1-0.2,1.4-0.4l3,2.7l3.1-1.8l-0.9-4c0.3-0.3,0.7-0.7,1-1l3.9,0.8l1.8-3.1l-2.7-3L46.3,34.7z M32.3,44c-6.6,0.2-12.1-5.1-12.3-11.7c-0.2-6.6,5-12.2,11.7-12.3C38.3,19.8,43.8,25,44,31.7C44.2,38.3,39,43.8,32.3,44z\"\/><\/g><g><path class=\"st3\" d=\"M31,22c-5,0-9,4-9,9c0,5,4,9,9,9c5,0,9-4,9-9C40,26,36,22,31,22z M31,35c-2.2,0-4-1.8-4-4c0-2.2,1.8-4,4-4c2.2,0,4,1.8,4,4C35,33.2,33.2,35,31,35z\"\/><path class=\"st3\" d=\"M45.3,33.7l3.7-1.2l0-3.6l-3.9-1.3c-0.1-0.5-0.2-1-0.4-1.4l2.6-3l-1.8-3.1l-4,0.8c-0.3-0.3-0.6-0.6-0.9-0.9l0.8-3.7l-3-1.8l-3,2.6c-0.5-0.2-1.1-0.3-1.7-0.4L32.5,13l-3.6,0l-1.3,3.9c-0.5,0.1-1,0.2-1.4,0.4l-3-2.7l-3.1,1.8l0.9,4c-0.3,0.3-0.7,0.7-1,1l-3.9-0.8l-1.8,3.1l2.7,3l-0.4,1.4L13,29.5l0,3.6l3.9,1.3c0.1,0.4,0.2,0.9,0.4,1.4l-2.6,3l1.8,3.1l4-0.8c0.4,0.4,0.7,0.7,1.1,1l-0.8,3.9l3.1,1.7l3-2.7c0.4,0.2,0.9,0.3,1.4,0.4l1.3,3.8l3.6,0l1.3-3.9c0.5-0.1,1-0.2,1.4-0.4l3,2.7l3.1-1.8l-0.9-4c0.3-0.3,0.7-0.7,1-1l3.9,0.8l1.8-3.1l-2.7-3L45.3,33.7z M31.3,43c-6.6,0.2-12.1-5.1-12.3-11.7c-0.2-6.6,5-12.2,11.7-12.3C37.3,18.8,42.8,24,43,30.7C43.2,37.3,38,42.8,31.3,43z\"\/><\/g><\/g><\/g><\/g><\/symbol>\n<\/svg>\n\n<p class=\"ext-social-login__text\">Or log in with:<\/p>\n            <a class=\"ext-social-login__button ext-social-login__button--google\" tabindex=\"0\" href=\"https:\/\/accounts.google.com\/o\/oauth2\/auth?response_type=code&access_type=online&client_id=940791060416-7csa8f6lbar39rhkmbqt5big47k9m469.apps.googleusercontent.com&redirect_uri=https%3A%2F%2Fid.plesk.com%2Fredirect%2Fgoogle-sign-in.html&state=WtyMjV5GADX%2Fe2naYwuIK9jN2ZTFnUebhjxPAKtf%7Credirect-plesk%3Dhttps%253A%252F%252Fvps269307.vps.ovh.ca%253A8443%252Fmodules%252Fsocial-login%252Fpublic%252Flogin.php%253Fprovider%253Dgoogle&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email&approval_prompt=auto\" title=\"Google\">\n            <svg class=\"ext-social-login__button-icon\"><use xmlns:xlink=\"http:\/\/www.w3.org\/1999\/xlink\" xlink:href=\"#btn-google\"><\/use><\/svg>\n        <\/a>\n            <a class=\"ext-social-login__button ext-social-login__button--github\" tabindex=\"0\" href=\"https:\/\/github.com\/login\/oauth\/authorize?client_id=1c4da8e2ca643e96ea17&redirect_uri=https%3A%2F%2Fid.plesk.com%2Fredirect%2Fgithub-sign-in.html&scope=user%3Aemail&state=Ib96xvnbxB%2BOkh8dh1iexS9cd0Rn7F14w2Q4OwaF%7Credirect-plesk%3Dhttps%253A%252F%252Fvps269307.vps.ovh.ca%253A8443%252Fmodules%252Fsocial-login%252Fpublic%252Flogin.php%253Fprovider%253Dgithub\" title=\"GitHub\">\n            <svg class=\"ext-social-login__button-icon\"><use xmlns:xlink=\"http:\/\/www.w3.org\/1999\/xlink\" xlink:href=\"#btn-github\"><\/use><\/svg>\n        <\/a>\n            <a class=\"ext-social-login__button ext-social-login__button--facebook\" tabindex=\"0\" href=\"https:\/\/www.facebook.com\/v2.10\/dialog\/oauth?auth_type=rerequest&client_id=2078260759091384&state=vRR1oJoDw%2FlSCAWjYREcs%2B0ETMgNmQ%2FayH7dEbwO%7Credirect-plesk%3Dhttps%253A%252F%252Fvps269307.vps.ovh.ca%253A8443%252Fmodules%252Fsocial-login%252Fpublic%252Flogin.php%253Fprovider%253Dfacebook&response_type=code&sdk=php-sdk-5.6.1&redirect_uri=https%3A%2F%2Fid.plesk.com%2Fredirect%2Ffb-sign-in.html&scope=email\" title=\"Facebook\">\n            <svg class=\"ext-social-login__button-icon\"><use xmlns:xlink=\"http:\/\/www.w3.org\/1999\/xlink\" xlink:href=\"#btn-facebook\"><\/use><\/svg>\n        <\/a>\n    <\/div>\n",
                    "params": {
                        "success_redirect_url": ""
                    },
                    "sslWarning": null,
                    "logo": {
                        "img": "\/cp\/theme\/images\/logos\/plesk\/logo.svg?1614226237",
                        "alt": "Plesk Obsidian 18.0.33",
                        "isCustom": false,
                        "href": "\/smb\/web\/view",
                        "edition": "web host edition"
                    }
                },
                "graphqlQueries": [],
                "localeSections": {
                    "components.buttons": {
                        "save": "OK",
                        "apply": "Apply",
                        "cancel": "Cancel",
                        "yes": "Yes",
                        "no": "No",
                        "ok": "OK",
                        "remove": "Remove",
                        "logout": "Log out",
                        "next": "Next >",
                        "start": "Start >>",
                        "wait": "Please wait",
                        "updateAndLock": "Update & Lock",
                        "applyAndLock": "Apply & Lock",
                        "updateAndSync": "Update & Sync",
                        "badgeNew": "New",
                        "timeout": "This operation is taking too long. Check the results in a few minutes.",
                        "resetToDefault": "Reset To Default",
                        "defaultValue": "(Default)"
                    },
                    "components.tasks.common": {
                        "hideCompletedTasks": "Hide Completed",
                        "progressBarHide": "Hide",
                        "progressBarShow": "Show",
                        "close": "Close",
                        "refresh": "Refresh Page",
                        "taskInProgress": "%%count%% tasks in progress...",
                        "percentCompleted": "%%percent%%% completed",
                        "allTasksCompleted": "All %%num%% tasks were successfully completed.",
                        "minimize": "Minimize",
                        "statusDone": "Done",
                        "statusError": "Failed",
                        "statusNotStarted": "Queued",
                        "statusCanceled": "Canceled",
                        "progressDialogLink": "detailed progress"
                    },
                    "components.status": {
                        "error": "Error",
                        "info": "Information",
                        "warning": "Warning"
                    },
                    "components.shortcuts": {
                        "logIn": "Log in",
                        "identityName": "Subscriber %%identity%%",
                        "loggedInAs": "Logged in as",
                        "impersonatedInAs": "Subscriber",
                        "myProfile": "Edit Profile",
                        "logOut": "Log out",
                        "backToAdmin": "Back to Administrator",
                        "readManual": "Read the Guide",
                        "tutorials": "Watch Video Tutorials",
                        "sureToLogout": "Are you sure you want to log out?",
                        "impersonatedName": "logged in as %%identity%%",
                        "subscription": "Subscription",
                        "webspace": "Webspace",
                        "linkToFeedback": "Found a bug?",
                        "userFeedback": "Suggest an Idea",
                        "facebookJoinCommunity": "Join Us on Facebook",
                        "twitterFollow": "Follow @Plesk",
                        "provideRating": "Share an Opinion",
                        "linkToCookies": "Cookies"
                    }
                }
            });
            //]]>
        </script>
    </body>
</html>

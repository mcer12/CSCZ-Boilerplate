<!DOCTYPE html>
<html>
<head>
    <title>{__("gdpr.cookie_consent")}</title>
    <style>
        .message {
            margin: 100px auto;
            text-align: center;
            vertical-align: middle;
            max-width: 800px;
            font: Verdana, Geneva, sans-serif;
            font-size:18px;
        }

        .message a {
            margin: 0 10px;
        }
    </style>
</head>
<body>

<div class="message">
    {__("gdpr.cookie_consent_message")}
    <a type="button" href="{$accept_url}">{__("gdpr.cookie_consent_accept")}</a>
    <a type="button" href="https://google.com">{__("gdpr.cookie_consent_decline")}</a>
</div>

</body>
</html>

{if $app.antibot->getDriver()|get_class == "Tygh\Addons\Recaptcha\RecaptchaDriver"}
    <script type="text/javascript">
        (function (_, $) {
            _.tr({
                error_validator_recaptcha: '{__("error_validator_recaptcha")|escape:"javascript"}'
            });

            $.extend(_, {
                recaptcha_settings: {
                    site_key: '{$addons.recaptcha.recaptcha_site_key|escape:javascript nofilter}',
                    theme: '{$addons.recaptcha.recaptcha_theme|escape:javascript nofilter}',
                    type: '{$addons.recaptcha.recaptcha_type|escape:javascript nofilter}',
                    size: '{$addons.recaptcha.recaptcha_size|escape:javascript nofilter}'
                }
            });
        }(Tygh, Tygh.$));
    </script>
    {script src="js/addons/recaptcha/recaptcha.js"}
{/if}

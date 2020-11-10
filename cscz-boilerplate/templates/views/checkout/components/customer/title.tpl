<div class="litecheckout__group">
    {if !$auth.user_id}
    <div class="litecheckout__item litecheckout__item--fill">
        <h2 class="litecheckout__step-title">{$block_title|default:__("lite_checkout.customer_information")}</h2>
    </div>
    {/if}

    {* login popup button *}
    {if !$auth.user_id}
        <div class="litecheckout__item">
            {$return_current_url = $config.current_url|escape:url}

            <a href="{if $runtime.controller == "auth" && $runtime.mode == "login_form"}{$config.current_url|fn_url}{else}{"auth.login_form?return_url=`$return_current_url`"|fn_url}{/if}"
                    data-ca-target-id="litecheckout_login_block"
                    class="cm-dialog-opener cm-dialog-auto-size ty-btn ty-btn__secondary"
                    rel="nofollow"
            >
                {__("checkout_sign_in")}
            </a>
        </div>
    {elseif $allow_multiple_profiles}
        <div class="litecheckout__item litecheckout__item--center">
            <a
                class="cm-dialog-opener cm-dialog-auto-size cm-dialog-destroy-on-close litecheckout__link"
                href="{"checkout.update_profile"|fn_url}"
                data-ca-target-id="create_user_profile"
                data-ca-dialog-title="{__("create_profile")}"
            >{__("create_profile")}</a>
        </div>
    {/if}
</div>

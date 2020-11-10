{assign var="id" value=$id|default:"main_login"}

{capture name="login"}
    <form name="{$id}_form" action="{""|fn_url}" method="post" class="login-form">
    <input type="hidden" name="return_url" value="{$smarty.request.return_url|default:$config.current_url}" />
    <input type="hidden" name="redirect_url" value="{$config.current_url}" />

        {if $style == "checkout"}
            <h3>{__("returning_customer")}</h3>
        {/if}
        <div class="form-group">
            <label for="login_{$id}" class="cm-required cm-trim cm-email control-label">{__("email")}</label>
            <input type="email" id="login_{$id}" name="user_login" size="30" value="{$config.demo_username}" class="cm-focus form-control" />
        </div>

        <div class="form-group">
            <label for="psw_{$id}" class="cm-required control-label">{__("password")}</label>
            <input type="password" id="psw_{$id}" name="password" size="30" value="{$config.demo_password}" class="form-control" maxlength="32" />
            <a href="{"auth.recover_password"|fn_url}" class="forgot-password" tabindex="5">{__("forgot_password_question")}</a>
        </div>

        {include file="common/image_verification.tpl" option="login" align="left"}

        {hook name="index:login_buttons"}
            <div class="login-buttons d-flex justify-content-between align-items-center">
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" name="remember_me" id="remember_me_{$id}" value="Y">
                    <label class="custom-control-label" for="remember_me_{$id}">{__("remember_me")}</label>
                </div>
                <div class="pull-right">
                    {include file="common/button.tpl" text=__("sign_in") name="dispatch[auth.login]" meta="btn-primary"}
                </div>
            </div>
        {/hook}

        {if $style == "popup"}
            <div class="register-button__wrapper">
                <a class="btn register-button" href="{"profiles.add"|fn_url}" rel="nofollow">{__("register_new_account")}</a>
            </div>
        {/if}
    </form>
{/capture}

{if $style == "popup"}
    {$smarty.capture.login nofilter}
{else}
    <div>
        {$smarty.capture.login nofilter}
    </div>

    {capture name="mainbox_title"}{__("sign_in")}{/capture}
{/if}

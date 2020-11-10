<div id="login_by_otp_container">
    <div class="ty-product-notification__body cm-notification-max-height">
        {__("checkout.email_exists.popup.message")}
    </div>
    <div class="ty-product-notification__buttons clearfix">
        <div class="ty-float-left">
            {include file="buttons/button.tpl" but_text=__("checkout.email_exists.popup.cancel_btn") but_meta="cm-notification-close"}
        </div>
        <div class="ty-right">
            <form id="checkout_user_exist_notification_form">
                <input type="hidden" name="email" value="{$email}">
                <input type="hidden" name="container_id" value="login_by_otp_container">
                <input type="hidden" name="return_url" value="{"checkout.checkout"|fn_url}">
            </form>
            {include file="buttons/button.tpl"
                but_role="text"
                but_text=__("checkout.email_exists.popup.sign_in_btn")
                but_href="auth.send_otp"
                but_meta="ty-btn__secondary cm-ajax cm-ajax-send-form cm-post"
                but_target_id="login_by_otp_container"
                but_target_form="#checkout_user_exist_notification_form"
                but_title=__('checkout.email_exists.popup.title')
            }
        </div>
    </div>
</div>
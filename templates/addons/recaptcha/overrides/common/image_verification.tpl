{if $option|fn_needs_image_verification}
    {assign var="id" value="recaptcha_"|uniqid}
    <div class="captcha form-group">
        <label for="{$id}" class="cm-required cm-recaptcha captcha__label">{__("image_verification_label")}</label>
        <div id="{$id}" class="cm-recaptcha"></div>
    </div>
{/if}
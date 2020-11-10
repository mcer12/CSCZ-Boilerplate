<div id="gdpr_{$action}_dialog_{$id}" class="hidden" title="{$title}">
    <form action="{""|fn_url}" method="POST">
        {$description nofilter}

        <input type="hidden" name="gdpr[action]" value="{$action}"/>
        <input type="hidden" name="redirect_url" value="{$config.current_url}"/>

        <div class="ty-control-group">
            <label for="{$action}_comment" class="ty-control-group__title">{__("type_comment")}</label>
            <textarea id="{$action}_comment" name="gdpr[comment]" class="ty-input-textarea cm-focus" autofocus rows="5" cols="100"></textarea>
        </div>

        <div class="buttons-container">
            {include file="buttons/button.tpl" but_text=__("confirm") but_meta="ty-btn__secondary" but_role="submit" but_name="dispatch[gdpr.user_action_request]"}
        </div>
    </form>
</div>

<div class="cm-notification-container notification-container">
{if !"AJAX_REQUEST"|defined}
    {foreach from=""|fn_get_notifications item="message" key="key"}
        {if $message.type == "I"}
            <div class="cm-notification-content cm-notification-content-modal modal{if $message.message_state == "I"} cm-auto-hide{/if}" tabindex="-1" role="dialog" data-ca-notification-key="{$key}">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">{$message.title}</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            {$message.message nofilter}
                        </div>
                        {*
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary">Save changes</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                        *}
                    </div>
                </div>
            </div>
        {elseif $message.type == "O"}
            <div class="cm-notification-content notification-content alert alert-danger" data-ca-notification-key="{$key}">
                <button type="button" class="close cm-notification-close" {if $message.message_state != "S"}data-dismiss="alert"{/if}>&times;</button>
                {$message.message nofilter}
            </div>
        {else}
            <div class="cm-notification-content alert {if $message.message_state == "I"} cm-auto-hide{/if} {if $message.type == "N"}alert-success{elseif $message.type == "W"}alert-warning{else}alert-danger{/if}" data-ca-notification-key="{$key}">
                <button type="button" class="close cm-notification-close {if $message.message_state == "S"} cm-notification-close-ajax{/if}" {if $message.message_state != "S"}data-dismiss="alert"{/if}>&times;</button>
                <strong>{$message.title}</strong>
                {$message.message nofilter}
            </div>
        {/if}
    {/foreach}
{/if}
</div>
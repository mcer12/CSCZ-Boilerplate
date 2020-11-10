{if $auth.user_id}
    <div class="ty-gdpr-profile-actions">
        {__("gdpr.user_profile_actions_description")}

        <div class="buttons-container">
            {include file="buttons/button.tpl"
                but_role="button"
                but_meta="ty-btn__secondary cm-dialog-opener cm-dialog-auto-size"
                but_text=__("gdpr.send_my_data")
                but_target_id="gdpr_personal_data_request_dialog_{$block.block_id}"
            }

            {include file="buttons/button.tpl"
                but_role="button"
                but_meta="ty-btn__secondary cm-dialog-opener cm-dialog-auto-size"
                but_text=__("gdpr.remove_my_data")
                but_target_id="gdpr_anonymization_request_dialog_{$block.block_id}"
            }
        </div>
    </div>

    {include file="addons/gdpr/componentes/user_actrion_popup.tpl"
        action="personal_data_request"
        description=__("gdpr.send_my_data_description")
        title=__("gdpr.send_my_data")
        id=$block.block_id
    }

    {include file="addons/gdpr/componentes/user_actrion_popup.tpl"
        action="anonymization_request"
        description=__("gdpr.remove_my_data_description")
        title=__("gdpr.remove_my_data")
        id=$block.block_id
    }
{/if}
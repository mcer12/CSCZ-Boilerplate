{$show_agreement = false}

{capture name="agreement_contents"}
    {include file="addons/gdpr/componentes/agreement_checkbox.tpl"
        type="checkout_profiles_update"
        gdpr_target_elem="gdpr_agreements_user_registration"
        agreement_required=true
        input_name="user_data[agreement_type]"
        input_value="checkout_profiles_update"
    }
{/capture}

{if $show_agreement}
    <div class="ty-control-group ty-checkout__terms">
        <div class="cm-field-container">
            {$smarty.capture.agreement_contents nofilter}
        </div>
    </div>
{/if}

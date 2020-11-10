{$show_agreement = false}

{capture name="agreement_contents"}
    {include file="addons/gdpr/componentes/agreement_checkbox.tpl" type="user_registration" agreement_required=true}
{/capture}

{if $show_agreement}
    <div class="ty-control-group ty-checkout__terms">
        <div class="cm-field-container">
            {$smarty.capture.agreement_contents nofilter}
        </div>
    </div>
{/if}

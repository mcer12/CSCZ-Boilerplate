{$show_agreement = false}

{capture name="agreement_contents"}
    {include file="addons/gdpr/componentes/agreement_checkbox.tpl" type="checkout_profiles_update" agreement_required=true}
{/capture}

{if $show_agreement}
    <div class="ty-control-group ty-checkout__terms">
        <div class="cm-field-container">
            {strip}
                {$smarty.capture.agreement_contents nofilter}
            {/strip}
        </div>
    </div>
{/if}
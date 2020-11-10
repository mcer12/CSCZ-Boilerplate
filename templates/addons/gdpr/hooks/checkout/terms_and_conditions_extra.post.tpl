{$show_agreement = false}

{capture name="agreement_contents"}
    {if $iframe_mode}
        {$onclick="fn_check_agreements('{$suffix}');"}
    {/if}
    {include file="addons/gdpr/componentes/agreement_checkbox.tpl" type="checkout_place_order" onclick=$onclick suffix=$suffix agreement_required=true}
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

{$show_agreement = false}

{capture name="agreement_contents_profiles_update"}
    {if $iframe_mode}
        {$onclick="fn_check_agreements('{$suffix}');"}
    {/if}
    {include file="addons/gdpr/componentes/agreement_checkbox.tpl" type="checkout_profiles_update" onclick=$onclick suffix=$suffix agreement_required=true}
{/capture}

{if $show_agreement}
    <div class="ty-control-group ty-checkout__terms">
        <div class="cm-field-container">
            {strip}
                {$smarty.capture.agreement_contents_profiles_update nofilter}
            {/strip}
        </div>
    </div>
{/if}

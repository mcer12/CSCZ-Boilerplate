{$element_identifier = "address-group"}
{$group_meta = "hidden"}

{if $show_profiles_on_checkout}
    {$element_identifier = "user-profiles"}
    {$group_meta = ""}
{/if}

<div class="{$group_meta} litecheckout__group" data-ca-lite-checkout-element="{$element_identifier}">
    {if $show_profiles_on_checkout}
        {include file="views/checkout/components/user_profiles.tpl"}
    {else}
        {include
            file="views/checkout/components/profile_fields.tpl"
            profile_fields=$profile_fields
            section="ProfileFieldSections::SHIPPING_ADDRESS"|enum
            exclude=["s_city", "s_country", "s_state", "customer_notes"]
        }
    {/if}
</div>

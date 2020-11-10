<div class="cm-processing-personal-data" data-ca-processing-personal-data-without-click="true">
    <div class="litecheckout__group">
        {include
            file="views/checkout/components/profile_fields.tpl"
            profile_fields=$profile_fields
            section="ProfileFieldSections::SHIPPING_ADDRESS"|enum
            include=["customer_notes"]
        }
    </div>

    {hook name="checkout:extra_payment_info"}
    {/hook}
</div>

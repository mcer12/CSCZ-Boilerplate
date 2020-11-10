{if $show_title || $show_address || $show_information || $show_notes}
    <div class="litecheckout__container litecheckout__step">
        <div class="litecheckout__section">
            {if $show_title}
                {include file="views/checkout/components/customer/title.tpl"}
            {/if}

            {if $show_address}
                {include file="views/checkout/components/customer/address.tpl"}
            {/if}

            {if $show_information}
                {include file="views/checkout/components/customer/information.tpl"}
            {/if}

            {if $show_notes}
                {include file="views/checkout/components/customer_notes.tpl"}
            {/if}
        </div>
    </div>
{/if}

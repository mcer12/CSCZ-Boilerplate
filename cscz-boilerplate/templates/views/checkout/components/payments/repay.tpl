<div class="litecheckout__section">
    <div class="litecheckout__group">
    {foreach $payment_methods_list as $tab_id => $payment_data}
        {if $payment_data.status == "A"}
            <label class="cm-toggle litecheckout__shipping-method litecheckout__field litecheckout__field--xsmall"
                for="radio_{$tab_id}_{$payment_data.payment_id}"
            >
                <input type="radio"
                        id="radio_{$tab_id}_{$payment_data.payment_id}"
                        class="hidden litecheckout__shipping-method__radio cm-select-payment"
                        data-ca-url="orders.details?order_id={$order_id}"
                        data-ca-result-ids="elm_payments_list"
                        name="repay_radio_group"
                        {if $payment_id == $payment_data.payment_id}
                            checked="checked"
                        {/if}
                        value="{$payment_data.payment_id}"
                />
                <div class="litecheckout__shipping-method__wrapper">
                    {if $payment_data.image}
                        <div class="litecheckout__shipping-method__logo">
                            {include file="common/image.tpl" obj_id=$payment_data.payment_id images=$payment_data.image class="litecheckout__shipping-method__logo-image"}
                        </div>
                    {/if}
                    <p class="litecheckout__shipping-method__title">{$payment_data.payment}</p>
                    <p class="litecheckout__shipping-method__delivery-time">{$payment_data.description}</p>
                </div>
            </label>
        {/if}
    {/foreach}
    </div>
</div>
<div class="payments">
{foreach $payment_methods_list as $tab_id => $payment_data}
    {if $payment_data.payment_id != $payment_id}
        {continue}
    {/if}
    {if $payment_data.status == "A"}
    <div class="litecheckout__group">
        <form name="payments_form_{$tab_id}"
                action="{""|fn_url}"
                method="post"
                class="payments-form cm-processing-personal-data cm-toggle-target {if $payment_id != $payment_data.payment_id}hidden{/if}"
                data-ca-processing-personal-data-without-click="true"
                data-ca-id="{$tab_id}_{$payment_data.payment_id}"
        >
            <input type="hidden" name="payment_id" value="{$payment_data.payment_id}" />

            {if $order_id}
                <input type="hidden" name="order_id" value="{$order_id}" />
            {/if}

            {if $payment_data.instructions}
                <div class="litecheckout__item litecheckout__payment-instructions">
                    {$payment_data.instructions nofilter}
                </div>
            {/if}

            {if $payment_data.template}
                {include file=$payment_data.template}
            {/if}

            {include file="buttons/place_order.tpl" 
                    but_text=__("repay_order") 
                    but_name="dispatch[orders.repay]" 
                    but_meta="litecheckout__submit-btn--auto-width" 
                    but_role="big"
            }
        </form>
    </div>
    {/if}
{/foreach}
</div>

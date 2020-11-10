<div class="litecheckout__group litecheckout__shippings"
     data-ca-lite-checkout-overlay-message="{__("lite_checkout.click_here_to_update_shipping")}"
     data-ca-lite-checkout-overlay-class="litecheckout__overlay--active"
     data-ca-lite-checkout-element="shipping-methods"
     id="shipping_rates_list">
{hook name="checkout:shipping_rates"}

    <input type="hidden"
           name="additional_result_ids[]"
           value="litecheckout_final_section,litecheckout_step_payment,checkout*"
    />

    {foreach $product_groups as $group_key => $group}
        {if $product_groups|count > 1}
            <div class="litecheckout__group">
                <div class="litecheckout__item">
                    <h2 class="litecheckout__step-title">
                        {__("lite_checkout.shipping_method_for", ["[group_name]" => $group.name])}
                    </h2>
                </div>
            </div>
        {/if}

        {hook name="checkout:shipping_methods_list"}
        <div class="litecheckout__group">
            {* Shippings list *}
            {if $group.shippings && !$group.all_edp_free_shipping && !$group.shipping_no_required}

                {foreach $group.shippings as $shipping}

                    {hook name="checkout:shipping_rate"}
                        {$delivery_time = ""}
                        {if $shipping.delivery_time || $shipping.service_delivery_time}
                            {$delivery_time = "(`$shipping.service_delivery_time|default:$shipping.delivery_time`)"}
                        {/if}

                        {if $shipping.rate}
                            {capture assign="rate"}{include file="common/price.tpl" value=$shipping.rate}{/capture}
                            {if $shipping.inc_tax}
                                {$rate = "`$rate` ("}
                                {if $shipping.taxed_price && $shipping.taxed_price != $shipping.rate}
                                    {capture assign="tax"}{include file="common/price.tpl" value=$shipping.taxed_price class="ty-nowrap"}{/capture}
                                    {$rate = "`$rate``$tax` "}
                                {/if}
                                {$inc_tax_lang = __('inc_tax')}
                                {$rate = "`$rate``$inc_tax_lang`)"}
                            {/if}
                        {elseif fn_is_lang_var_exists("free")}
                            {$rate = __("free")}
                        {else}
                            {$rate = ""}
                        {/if}
                    {/hook}

                    <div class="litecheckout__shipping-method litecheckout__field litecheckout__field--xsmall">
                        <input
                            type="radio"
                            class="litecheckout__shipping-method__radio hidden"
                            id="sh_{$group_key}_{$shipping.shipping_id}"
                            name="shipping_ids[{$group_key}]"
                            value="{$shipping.shipping_id}"
                            onclick="fn_calculate_total_shipping_cost(); $.ceLiteCheckout('toggleAddress', {if $shipping.is_address_required == "Y"}true{else}false{/if});"
                            data-ca-lite-checkout-element="shipping-method"
                            data-ca-lite-checkout-is-address-required="{if $shipping.is_address_required == "Y"}true{else}false{/if}"
                            {if $cart.chosen_shipping.$group_key == $shipping.shipping_id}checked{/if}
                        />

                        <label
                            for="sh_{$group_key}_{$shipping.shipping_id}"
                            class="litecheckout__shipping-method__wrapper js-litecheckout-activate"
                            data-ca-activate="sd_{$group_key}_{$shipping.shipping_id}"
                        >
                            {if $shipping.image}
                                <div class="litecheckout__shipping-method__logo">
                                    {include file="common/image.tpl" obj_id=$shipping_id images=$shipping.image class="shipping-method__logo-image litecheckout__shipping-method__logo-image"}
                                </div>
                            {/if}
                            <p class="litecheckout__shipping-method__title">{$shipping.shipping}{if $rate} — {$rate nofilter}{/if}</p>
                            <p class="litecheckout__shipping-method__delivery-time">{$delivery_time}</p>
                        </label>
                    </div>
                {/foreach}
            {else}
                <p class="litecheckout__shipping-method__text">
                    {if $group.all_free_shipping}
                        {__("free_shipping")}
                    {elseif $group.all_edp_free_shipping || $group.shipping_no_required }
                        {__("no_shipping_required")}
                    {else}
                        <span class="ty-error-text">
                            {__("text_no_shipping_methods")}
                        </span>
                    {/if}
                </p>
            {/if}
        </div>
        {/hook}

        <div class="litecheckout__group">
            {foreach $group.shippings as $shipping}
                {hook name="checkout:shipping_method"}
                {/hook}
            {/foreach}
            <div class="litecheckout__item">
                {foreach $group.shippings as $shipping}
                    {if $cart.chosen_shipping.$group_key == $shipping.shipping_id}
                        <div class="litecheckout__shipping-method__description">
                            {$shipping.description nofilter}
                        </div>
                    {/if}
                {/foreach}
            </div>
        </div>
    {/foreach}
{/hook}
<!--shipping_rates_list--></div>

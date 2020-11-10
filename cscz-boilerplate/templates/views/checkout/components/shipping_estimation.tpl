
{if $location == "sidebox"}
    {assign var="prefix" value="sidebox_"}
{/if}
{if $location == "popup"}
    {assign var="buttons_class" value="hidden"}
{else}
    {assign var="buttons_class" value="buttons-container"}
{/if}
{if $additional_id}
    {assign var="class_suffix" value="-`$additional_id`"}
    {assign var="id_suffix" value="_`$additional_id`"}
{/if}

{if !$cart}
    {$cart = $smarty.session.cart}
{/if}

{if $location != "sidebox" && $location != "popup"}

<div id="est_box{$id_suffix}">
    <div class="ty-estimation-box">
    <h3 class="ty-subheader">{__("calculate_shipping_cost")}</h3>
{/if}
        {assign var="shipping_estimation_block_id" value="shipping_estimation{if $location == "sidebox"}_sidebox{/if}`$id_suffix`"}

        <div id="{$shipping_estimation_block_id}">

            {$countries = fn_get_simple_countries(true)}
            {$states = fn_get_all_states(true)}
            {if !$smarty.capture.states_built}
                {include file="views/profiles/components/profiles_scripts.tpl" states=$states}
                {capture name="states_built"}Y{/capture}
            {/if}

            <form class="cm-ajax" name="{$prefix}estimation_form{$id_suffix}" action="{""|fn_url}" method="post">
                {if $location == "sidebox"}<input type="hidden" name="location" value="sidebox" />{/if}
                {if $additional_id}<input type="hidden" name="additional_id" value="{$additional_id}" />{/if}
                <input type="hidden" name="result_ids" value="{$shipping_estimation_block_id},shipping_estimation_buttons,shipping_estimation_rates{$id_suffix}" />

                {hook name="checkout:shipping_estimation_fields"}
                {$_state = $cart.user_data.s_state}
                {$_country = $cart.user_data.s_country}

                {if !isset($cart.user_data.s_country)}
                    {$_country = $settings.Checkout.default_country}
                {/if}

                {if !isset($cart.user_data.s_state) && $_country == $settings.Checkout.default_country}
                    {$_state = $settings.Checkout.default_state}
                {/if}

                <div class="ty-control-group">
                    <label class="ty-control-group__label cm-required" for="{$prefix}elm_country{$id_suffix}">{__("country")}</label>
                    <select id="{$prefix}elm_country{$id_suffix}" class="cm-country cm-location-estimation{$class_suffix} ty-input-text-medium" name="customer_location[country]">
                        <option value="">- {__("select_country")} -</option>
                        {foreach $countries as $code => $country}
                            <option value="{$code}" {if $_country == $code}selected="selected"{/if}>{$country}</option>
                        {/foreach}
                    </select>
                </div>

                <div class="ty-control-group">
                    <label class="ty-control-group__label" for="{$prefix}elm_state{$id_suffix}">{__("state")}</label>
                    <select class="cm-state cm-location-estimation{$class_suffix} {if !$states[$_country]}hidden{/if} ty-input-text-medium" id="{$prefix}elm_state{$id_suffix}" name="customer_location[state]">
                        <option value="">- {__("select_state")} -</option>
                        {foreach $states[$_country] as $state}
                            <option value="{$state.code}" {if $state.code == $_state}selected="selected"{/if}>{$state.state}</option>
                        {/foreach}
                    </select>
                    <input type="text" class="cm-state cm-location-estimation{$class_suffix} ty-input-text-medium {if $states[$cart.user_data.s_country]}hidden{/if}" id="{$prefix}elm_state{$id_suffix}_d" name="customer_location[state]" size="20" maxlength="64" value="{$_state}" {if $states[$cart.user_data.s_country]}disabled="disabled"{/if} />
                </div>

                <div class="ty-control-group">
                    <label class="ty-control-group__label" for="{$prefix}elm_city{$id_suffix}">{__("city")}</label>
                    <input type="text" class="ty-input-text-medium" id="{$prefix}elm_city{$id_suffix}" name="customer_location[city]" size="32" value="{$cart.user_data.s_city}" />
                </div>

                <div class="ty-control-group">
                    <label class="ty-control-group__label" for="{$prefix}elm_zipcode{$id_suffix}">{__("zip_postal_code")}</label>
                    <input type="text" class="ty-input-text-medium" id="{$prefix}elm_zipcode{$id_suffix}" name="customer_location[zipcode]" size="20" value="{$cart.user_data.s_zipcode}" />
                </div>
                {/hook}

                <div class="{$buttons_class}">
                    {include file="buttons/button.tpl" but_text=__("get_rates") but_name="dispatch[checkout.shipping_estimation.get_rates]" but_role="text" but_id="but_get_rates_{$location}"}
                </div>

            </form>

            {if $runtime.mode == "shipping_estimation" || $smarty.request.show_shippings == "Y"}
                {if !$cart.shipping_failed && !$cart.company_shipping_failed}
                    {if $location == "popup"}
                        <div class="ty-estimation__title">{__("select_shipping_method")}</div>
                    {/if}

                    <div id="shipping_estimation_rates{$id_suffix}">
                    <form class="cm-ajax" name="{$prefix}select_shipping_form{$id_suffix}" action="{""|fn_url}" method="post">
                    <input type="hidden" name="redirect_mode" value="cart" />
                    <input type="hidden" name="result_ids" value="checkout_totals" />
                    <input type="hidden" name="suffix" value="{$id_suffix}" />

                    {hook name="checkout:shipping_estimation"}

                    {foreach from=$product_groups key=group_key item=group name="s"}
                        {* Group name *}
                        {if !"ULTIMATE"|fn_allowed_for || $product_groups|count > 1}
                            <p>
                                <strong>{$group.name|default:__("none")}</strong>
                            </p>
                        {/if}
                        {if !"ULTIMATE"|fn_allowed_for || $product_groups|count > 1}
                            <ul>
                            {foreach from=$group.products item="product"}
                                <li>
                                    {if $product.product}
                                        {$product.product nofilter}
                                    {else}
                                        {$product.product_id|fn_get_product_name}
                                    {/if}
                                </li>
                            {/foreach}
                            </ul>
                        {/if}

                        {if $group.shippings && !$group.all_edp_free_shipping && !$group.shipping_no_required}
                            {foreach from=$group.shippings item="shipping" name="estimate_group_shipping"}
                                {if !$show_only_first_shipping || $smarty.foreach.estimate_group_shipping.first}

                                    {if $cart.chosen_shipping.$group_key == $shipping.shipping_id}
                                        {assign var="checked" value="checked=\"checked\""}
                                    {else}
                                        {assign var="checked" value=""}
                                    {/if}

                                    {if $shipping.delivery_time || $shipping.service_delivery_time}
                                        {assign var="delivery_time" value="(`$shipping.service_delivery_time|default:$shipping.delivery_time`)"}
                                    {else}
                                        {assign var="delivery_time" value=""}
                                    {/if}

                                    {hook name="checkout:shipping_estimation_method"}
                                        {hook name="checkout:shipping_rate"}
                                            {if $shipping.rate}
                                                {capture assign="rate"}{include file="common/price.tpl" value=$shipping.rate}{/capture}
                                                {if $shipping.inc_tax}
                                                    {assign var="rate" value="`$rate` ("}
                                                    {if $shipping.taxed_price && $shipping.taxed_price != $shipping.rate}
                                                        {capture assign="tax"}{include file="common/price.tpl" value=$shipping.taxed_price class="ty-nowrap"}{/capture}
                                                        {assign var="rate" value="`$rate``$tax` "}
                                                    {/if}
                                                    {assign var="inc_tax_lang" value=__('inc_tax')}
                                                    {assign var="rate" value="`$rate``$inc_tax_lang`)"}
                                                {/if}
                                            {elseif fn_is_lang_var_exists("free_shipping")}
                                                {assign var="rate" value=__("free_shipping") }
                                            {else}
                                                {assign var="rate" value="" }
                                            {/if}
                                        {/hook}
                                    <p>
                                        <input
                                            type="radio"
                                            class="ty-valign"
                                            id="sh_{$group_key}_{$shipping.shipping_id}{$id_suffix}"
                                            name="shipping_ids[{$group_key}]"
                                            value="{$shipping.shipping_id}"
                                            onclick="fn_calculate_total_shipping('{$shipping_estimation_block_id}');"
                                            {$checked} />
                                            <label for="sh_{$group_key}_{$shipping.shipping_id}{$id_suffix}"
                                                class="ty-valign" id="shipping_label_{$shipping_estimation_block_id}_{$group_key}_{$shipping.shipping_id}{$id_suffix}">
                                                {$shipping.shipping} {$delivery_time}
                                                {if $rate} {$rate nofilter}{/if}
                                            <!--shipping_label_{$shipping_estimation_block_id}_{$group_key}_{$shipping.shipping_id}{$id_suffix}--></label>
                                    </p>
                                    {/hook}
                                {/if}
                            {/foreach}

                        {else}
                            {if $group.all_edp_free_shipping || $group.shipping_no_required}
                                <p>{__("no_shipping_required")}</p>
                            {elseif $group.all_free_shipping || $group.free_shipping}
                                <p>{__("free_shipping")}</p>
                            {else}
                                <p>{__("text_no_shipping_methods")}</p>
                            {/if}
                        {/if}

                    {/foreach}

                    <div id="shipping_estimation_total{$id_suffix}">
                    <p><strong>{__("total")}:</strong>&nbsp;{include file="common/price.tpl" value=$cart.display_shipping_cost class="ty-price"}</p>
                    <!--shipping_estimation_total{$id_suffix}--></div>

                    {/hook}

                    <div class="{$buttons_class}">
                        {include file="buttons/button.tpl" but_text=__("select") but_role="text" but_name="dispatch[checkout.update_shipping]" but_id="but_select_shipping" but_meta="cm-dialog-closer"}
                    </div>

                    </form>
                    <!--shipping_estimation_rates{$id_suffix}--></div>
                {else}
                    <p class="ty-error-text">
                        {__("text_no_shipping_methods")}
                    </p>
                {/if}

            {/if}
        <!--{$shipping_estimation_block_id}--></div>

{if $location != "sidebox" && $location != "popup"}
    </div>
</div>
{/if}

{if $location == "popup"}
<div class="ty-estimation-buttons buttons-container" id="shipping_estimation_buttons">
    {if $runtime.mode == "shipping_estimation" || $smarty.request.show_shippings == "Y"}
        {include file="buttons/button.tpl" but_text=__("recalculate_rates") but_external_click_id="but_get_rates_{$location}" but_role="text" but_meta="ty-btn__secondary cm-external-click ty-float-right ty-estimation-buttons__rate"}

        {include file="buttons/button.tpl" but_text=__("select_shipping_method") but_external_click_id="but_select_shipping" but_meta="ty-btn__secondary cm-external-click cm-dialog-closer"}
    {else}
        {include file="buttons/button.tpl" but_text=__("get_rates") but_external_click_id="but_get_rates_{$location}" but_meta="ty-btn__secondary cm-external-click"}
    {/if}
<!--shipping_estimation_buttons--></div>
{/if}

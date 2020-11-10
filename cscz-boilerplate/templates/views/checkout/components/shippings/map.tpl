<div class="clearfix ty-checkout-select-store__map-full-div" style="width: 100%">
    {if $store_count > 1}
        <h3>{__("available")}: {$store_count}
        <div data-ca-group-key="{$group_key}" 
             class="ty-checkout-select-store__item-view"
        >
            {include file="buttons/button.tpl"
                but_role="text"
                but_meta="cm-map-view-locations ty-btn__tertiary"
                but_text=__("lite_checkout.shippings.show_all_on_map")
            }
        </div>
        </h3>
    {/if}
    <div class="ty-checkout-select-store__map-full" id="{$map_container}"></div>

    {foreach $shipping.data.stores as $store}
        {if $old_store_id == $store.store_location_id || $store_count == 1}
            <div class="ty-one-store__select-store">
                <p class="ty-one-store__name">
                    {$store.name}
                    {if $store.pickup_rate}({include file="common/price.tpl" value=$store.pickup_rate}){/if}
                </p>
                <div class="ty-one-store__description">
                    {strip}
                    {$store.city}
                    {if $store.pickup_address}, {$store.pickup_address}{/if}<br/>
                    {if $store.pickup_phone}{__("phone")}: {$store.pickup_phone}<br/>{/if}
                    {if $store.pickup_time}{__("store_locator.work_time")}: {$store.pickup_time}<br/>{/if}
                    {if $store.description}
                        <a id="sw_store_description_{$store.store_location_id}"
                           class="cm-combination ty-cart-content__detailed-link detailed-link"
                        >{__("description")}</a>
                        <div id="store_description_{$store.store_location_id}"
                             class="hidden"
                        >{$store.description nofilter}</div>
                        <br/>
                    {/if}
                    {/strip}
                </div>
            </div>
        {/if}
        <input type="radio"
               class="ty-one-store__radio-{$group_key}  hidden"
               name="select_store[{$group_key}][{$shipping.shipping_id}]"
               value="{$store.store_location_id}"
               {if $old_store_id == $store.store_location_id || $store_count == 1}checked="checked"{/if}
               id="store_{$group_key}_{$shipping.shipping_id}_{$store.store_location_id}"
               data-ca-pickup-select-store="true"
               data-ca-shipping-id="{$shipping.shipping_id}"
               data-ca-group-key="{$group_key}"
               data-ca-location-id="{$store.store_location_id}"
        />
    {/foreach}
</div>

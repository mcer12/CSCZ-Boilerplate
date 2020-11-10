<div class="ty-checkout-select-store__map-full-div pickup pickup--list">
  
    {* List wrapper *}
    <div class="ty-checkout-select-store pickup__offices-wrapper">

        {* List *}
        <div class="litecheckout__fields-row litecheckout__fields-row--wrapped pickup__offices">
            {foreach from=$shipping.data.stores item=store}
            <label for="store_{$group_key}_{$shipping.shipping_id}_{$store.store_location_id}" 
                   class="ty-one-store js-pickup-search-block"
            >
                <input type="radio" 
                       class="ty-one-store__radio-{$group_key} cm-sl-pickup-select-store"
                       name="select_store[{$group_key}][{$shipping.shipping_id}]"
                       value="{$store.store_location_id}"
                       {if ($old_store_id == $store.store_location_id) || ($store_count == 1)}
                       checked="checked"
                       {/if}
                       id="store_{$group_key}_{$shipping.shipping_id}_{$store.store_location_id}"
                       data-ca-pickup-select-store="true"
                       data-ca-shipping-id="{$shipping.shipping_id}"
                       data-ca-group-key="{$group_key}"
                       data-ca-location-id="{$store.store_location_id}"
                />

                <div class="ty-one-store__label">
                    <p class="ty-one-store__name">
                        <span class="ty-one-store__name-text">{$store.name}</span>
                        {if $store.pickup_rate}
                        <span class="ty-one-store__name-rate">
                            ({include file="common/price.tpl" value=$store.pickup_rate})
                        </span>
                        {/if}
                    </p>

                    <div class="ty-one-store__description">
                        {if $store.pickup_address}
                            <span class="ty-one-office__address">{$store.pickup_address}</span>
                            <br />
                        {/if}
                        {if $store.pickup_time}
                            <span class="ty-one-office__worktime">{$store.pickup_time}</span>
                            <br />
                        {/if}
                    </div>
                </div>
            </label>
            {/foreach}
        </div>
        {* End of List *}

    </div>
    {* End of List wrapper *}

</div>
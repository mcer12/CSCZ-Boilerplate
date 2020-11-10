{if $product.variation_features_variants}
    {script src="js/addons/product_variations/picker_features.js"}
    <div class="cm-picker-cart-product-variation-features ty-product-options">
        {foreach $product.variation_features_variants as $feature}
            <div class="ty-control-group ty-product-options__item clearfix">
                <label class="ty-control-group__label ty-product-options__item-label">{$feature.description}:</label>
                <bdi>
                    {if $feature.prefix}
                        <span>{$feature.prefix}</span>
                    {/if}
                    <select class="cm-ajax" data-ca-target-id="checkout*,cart*">
                        {foreach $feature.variants as $variant}
                            <option data-ca-variant-id="{$variant.variant_id}"
                                data-ca-product-id="{$variant.product.product_id}"
                                data-ca-change-url="{"checkout.change_variation?cart_item_id={$key}&product_id={$variant.product.product_id}"|fn_url}"
                                {if $feature.variant_id == $variant.variant_id}selected="selected"{/if}
                            >
                                {$variant.variant}
                            </option>
                        {/foreach}
                    </select>
                    {if $feature.suffix}
                        <span>{$feature.suffix}</span>
                    {/if}
                </bdi>
            </div>
        {/foreach}
    </div>
{/if}

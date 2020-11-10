{if $product.variation_name}
    <input type="hidden" id="product_{$obj_prefix}{$product.product_id}_alt" value="{$product.variation_name}" />
{/if}
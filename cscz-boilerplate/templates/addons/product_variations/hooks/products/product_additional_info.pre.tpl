{if $product.variation_features}
    {include file="addons/product_variations/components/variation_features.tpl"
        variation_features=$product.variation_features
        features_secondary=true
    }
{/if}

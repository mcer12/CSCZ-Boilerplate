{if $oi.variation_features}
    {include file="addons/product_variations/components/variation_features.tpl"
        variation_features=$oi.variation_features
        features_secondary=true
        features_mini=true
    }
{/if}

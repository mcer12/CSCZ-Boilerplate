{if $variation_features}{strip}
    {$variant_names = []}

    {foreach $variation_features as $feature}
        {if $feature.purpose === "\Tygh\Addons\ProductVariations\Product\FeaturePurposes::CREATE_VARIATION_OF_CATALOG_ITEM"|constant}
            {$variant_names[] = $feature.variant}
        {/if}
    {/foreach}

    {if $variant_names}
        {$features_secondary = $features_secondary|default:false}
        {$features_brackets = $features_brackets|default:false}
        {$features_separator = $features_separator|default:" • "}
        {$features_split = ($features_split === true) ? "—" : $features_split}
        {$features_inline = $features_inline|default:false}
        {$features_mini = $features_mini|default:false}
        {$features_tags = $features_tags|default:true}
        {$features_clearfix = $features_clearfix|default:false}

        {if $features_tags}<div class="ty-product-variations__variation-features
            {if $features_secondary} ty-product-variations__variation-features--secondary{/if}
            {if $features_inline} ty-product-variations__variation-features--inline{/if}
            {if $features_mini} ty-product-variations__variation-features--mini{/if}
            {if $features_clearfix} ty-product-variations__variation-features--clearfix{/if}
        ">{/if}

        {if $features_brackets}({/if}
        {implode($features_separator, $variant_names)}
        {if $features_brackets}){/if}
        {if $features_split}
            &nbsp;{$features_split}
        {/if}
        {if $features_tags}</div>{/if}
    {/if}
{/strip}{/if}
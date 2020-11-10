{if $show_features && $product.variation_features_variants}
    {capture name="variation_features_variants"}
    {foreach $product.variation_features_variants as $variation_feature}
        {if $variation_feature.display_on_catalog === "Y"}
            <div class="ty-grid-list__item-features-item">
                <span class="ty-grid-list__item-features-description">
                    {$variation_feature.description}:
                </span>
                {foreach $variation_feature.variants as $variant name=variants}
                    <span class="ty-grid-list__item-features-variant">
                        {$variant.variant}{if !$smarty.foreach.variants.last},{/if}
                    </span>
                {/foreach}
            </div>
        {/if}
    {/foreach}
    {/capture}
    {if $smarty.capture.variation_features_variants|trim}
        <div class="ty-grid-list__item-features">
            {$smarty.capture.variation_features_variants nofilter}
        </div>
    {/if}
{/if}

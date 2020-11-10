{if $product.variation_features_variants && $product.detailed_params.info_type === "D"}
    {script src="js/addons/product_variations/picker_features.js"}
    <div id="features_{$obj_prefix}{$obj_id}_AOC">
        {$container = "product_detail_page"}
        {$product_url = "products.view"}

        {if $quick_view}
            {$container = "product_main_info_form_{$obj_prefix}"}
            {$product_url = $config.current_url|fn_query_remove:"product_id"}
        {/if}

        {if $product.detailed_params.is_preview}
            {$product_url = $product_url|fn_link_attach:"action=preview"}
        {/if}

        <div class="cm-picker-product-variation-features ty-product-options">
            {$feature_style_dropdown = "\Tygh\Enum\ProductFeatureStyles::DROP_DOWN"|constant}
            {$feature_style_images = "\Tygh\Enum\ProductFeatureStyles::DROP_DOWN_IMAGES"|constant}
            {$feature_style_labels = "\Tygh\Enum\ProductFeatureStyles::DROP_DOWN_LABELS"|constant}
            {$purpose_create_variations = "\Tygh\Addons\ProductVariations\Product\FeaturePurposes::CREATE_VARIATION_OF_CATALOG_ITEM"|constant}

            {foreach $product.variation_features_variants as $feature}

                {$is_feature_default_style = !in_array($feature.feature_style, [$feature_style_images, $feature_style_labels, $feature_style_dropdown])}
                <div class="ty-control-group ty-product-options__item clearfix">
                    <label class="ty-control-group__label ty-product-options__item-label">{$feature.description}:</label>
                    <bdi>
                        {if $feature.feature_style === $feature_style_images}
                            <div class="ty-clear-both">
                                {foreach $feature.variants as $variant}
                                    {if $feature.variant_id != $variant.variant_id}
                                        {continue}
                                    {/if}
                                    <div class="ty-product-option-container">
                                        <div class="ty-product-option-child">{$feature.prefix}</div>
                                        <div class="ty-product-option-child">{$variant.variant}</div>
                                        <div class="ty-product-option-child">{$feature.suffix}</div>
                                    </div>
                                {/foreach}
                            </div>
                        {elseif $feature.feature_style === $feature_style_dropdown || $is_feature_default_style}
                            <div class="ty-product-option-container">
                            {if $feature.prefix}
                                <div class="ty-product-option-child">{$feature.prefix}</div>
                            {/if}
                                <div class="ty-product-option-child">
                                    <select class="{if $feature.purpose === $purpose_create_variations || $quick_view}cm-ajax{/if} {if !$quick_view}cm-history{/if} cm-ajax-force" data-ca-target-id="{$container}">
                                        {foreach $feature.variants as $variant}
                                            <option data-ca-variant-id="{$variant.variant_id}"
                                                    data-ca-product-url="{$product_url|fn_link_attach:"product_id={$variant.product.product_id}"|fn_url}"
                                                    {if $feature.variant_id == $variant.variant_id}selected="selected"{/if}
                                            >
                                                {$variant.variant}
                                            </option>
                                        {/foreach}
                                    </select>
                                </div>
                            {if $feature.suffix}
                                <div class="ty-product-option-child">{$feature.suffix}</div>
                            {/if}
                            </div>
                        {/if}
                    </bdi>

                    {if $feature.feature_style === $feature_style_images}
                        {capture name="variant_images"}
                            {foreach $feature.variants as $variant}
                                <a href="{$product_url|fn_link_attach:"product_id={$variant.product.product_id}"|fn_url}"
                                   class="ty-product-options__image--wrapper {if $variant.variant_id == $feature.variant_id}ty-product-options__image--wrapper--active{/if} {if $feature.purpose === $purpose_create_variations || $quick_view}cm-ajax cm-ajax-cache{/if}"
                                   {if $feature.purpose === $purpose_create_variations || $quick_view}data-ca-target-id="{$container}"{/if}
                                >
                                    {include file="common/image.tpl"
                                        obj_id="image_feature_variant_{$feature.feature_id}_{$variant.variant_id}_{$obj_prefix}{$obj_id}"
                                        class="ty-product-options__image"
                                        images=$variant.product.main_pair
                                        image_width="80"
                                        image_height="80"
                                        image_additional_attrs = [
                                            "width" => 80,
                                            "height" => 80
                                        ]
                                    }
                                </a>
                            {/foreach}
                        {/capture}

                        {if $smarty.capture.variant_images|trim}
                            <div class="ty-clear-both">
                                {$smarty.capture.variant_images nofilter}
                            </div>
                        {/if}
                    {elseif $feature.feature_style === $feature_style_labels}
                        <div class="ty-clear-both">
                            {foreach $feature.variants as $variant}
                                <input type="radio"
                                       name="feature_{$feature.feature_id}"
                                       value="{$variant.variant_id}"
                                       {if $feature.variant_id == $variant.variant_id}
                                           checked
                                       {/if}
                                       id="feature_{$feature.feature_id}_variant_{$variant.variant_id}_{$obj_prefix}{$obj_id}"
                                       data-ca-variant-id="{$variant.variant_id}"
                                       data-ca-product-url="{$product_url|fn_link_attach:"product_id={$variant.product.product_id}"|fn_url}"
                                       class="hidden ty-product-options__radio {if $feature.purpose === $purpose_create_variations || $quick_view}cm-ajax{/if} {if !$quick_view}cm-history{/if} cm-ajax-force" data-ca-target-id="{$container}"
                                />
                                <label for="feature_{$feature.feature_id}_variant_{$variant.variant_id}_{$obj_prefix}{$obj_id}"
                                       class="ty-product-options__radio--label"
                                >
                                    <span class="ty-product-option-checkbox">{$feature.prefix}</span>{$variant.variant}<span class="ty-product-option-checkbox">{$feature.suffix}</span>
                                </label>
                            {/foreach}
                        </div>
                    {/if}
                </div>
            {/foreach}
        </div>
    </div>
{/if}

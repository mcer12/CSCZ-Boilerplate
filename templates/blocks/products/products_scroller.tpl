{** block-description:tmpl_scroller **}

{if $block.properties.enable_quick_view == "Y"}
    {$quick_nav_ids = $items|fn_fields_from_multi_level:"product_id":"product_id"}
{/if}

{if $block.properties.hide_add_to_cart_button == "Y"}
        {assign var="_show_add_to_cart" value=false}
    {else}
        {assign var="_show_add_to_cart" value=true}
    {/if}
    {if $block.properties.show_price == "Y"}
        {assign var="_hide_price" value=false}
    {else}
        {assign var="_hide_price" value=true}
{/if}

{assign var="obj_prefix" value="`$block.block_id`000"}

<div id="scroll_list_{$block.block_id}" class="swiper-container product-slider">
    <div class="swiper-wrapper">
        {foreach from=$items item="product" name="for_products"}
                <div class="swiper-slide">
                    {hook name="products:product_scroller_list"}
                    {assign var="obj_id" value="scr_`$block.block_id`000`$product.product_id`"}
                    {include file="blocks/product_list_item_templates/products_item_default.tpl" product=$product obj_id=$obj_id image_width=$block.properties.thumbnail_width image_height=$block.properties.thumbnail_width swiper_lazy=true lazy_load=true img_class="swiper-lazy" show_add_to_cart=true}
                    {/hook}
                </div>
        {/foreach}
    </div>
    {if $block.properties.scroll_per_page == "Y"}
        <div class="swiper-pagination"></div>
    {/if}

    {if $block.properties.outside_navigation == "Y"}
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>
    {/if}
</div>

{include file="common/scroller_init.tpl"}

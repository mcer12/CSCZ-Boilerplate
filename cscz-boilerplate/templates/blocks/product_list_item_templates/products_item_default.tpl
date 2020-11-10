{** block-description:product_item_default **}

{assign var="obj_id" value=$product.product_id}
{assign var="obj_id_prefix" value="`$obj_prefix``$product.product_id`"}
{include file="common/product_data.tpl" product=$product}

<div class="products-item">
    <div class="products-item__image">
        <a href="{"products.view?product_id=`$product.product_id`"|fn_url}">
            {include file="common/image.tpl" images=$product.main_pair image_width=$block.properties.thumbnail_width image_height=$block.properties.thumbnail_width no_ids=true lazy_load=$lazy_load class=$img_class}
        </a>
        {*if $block.properties.enable_quick_view == "Y"}
            {include file="views/products/components/quick_view_link.tpl" quick_nav_ids=$quick_nav_ids}
        {/if*}
    </div>
    <div class="product-item__name">
        <span>{$product.product|zfn_replace_index nofilter}</span>
    </div>
    {*
    <div class="product-item__name">
        {$product.short_description nofilter}
    </div>
    *}
        {if $show_add_to_cart}
            {assign var="add_to_cart" value="add_to_cart_`$obj_id`"}
            {$smarty.capture.$add_to_cart nofilter}
        {/if}

</div>

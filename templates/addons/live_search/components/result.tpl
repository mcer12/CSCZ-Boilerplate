<div id="live_reload_box{if $smarty.capture.search_input_id}_{$smarty.capture.search_input_id|trim}{elseif $search_input_id}_{$search_input_id}{/if}">
<input type="hidden" class="search_input{if $smarty.capture.search_input_id}_{$smarty.capture.search_input_id|trim}{elseif $search_input_id}_{$search_input_id}{/if}" name="search_id" value="{if $smarty.capture.search_input_id}{$smarty.capture.search_input_id|trim}{elseif $search_input_id}{$search_input_id}{/if}" />
    {if $search.live_search}
        <div class="live-search-box cm-popup-box">
            {if $suggestions}
                <ul class="live-suggestion">
                    {foreach from=$suggestions item=suggestion}
                        <li class="live-suggestion-li">
                            <a onclick="fill_live_input(this, '{$suggestion.title}');">{$suggestion.title}
                                {if $suggestion.count}<span class="cp-live-search-suggestion-count">{__('products_found')}:&nbsp;{$suggestion.count}</span>{/if}
                            </a>
                        </li>
                    {/foreach}
                </ul>
            {/if}
            {if $live_result || $categories}
                <ul>
                    {foreach from=$live_result item="product" name="products"}
                        <li class="live-item-li">
                            {if ($addons.live_search.show_add_to_cart == 'Y' && $settings.General.allow_anonymous_shopping == 'allow_shopping') || ($addons.live_search.show_add_to_cart == 'Y' && $auth.user_id != 0)}
                                <div class="cp-live-search-add-to-cart">
                                    {$current_url = $smarty.session.continue_url|urlencode}
                                    {if empty($current_url)}
                                        {$current_url = ""|fn_url}
                                    {/if}
                                    {$quick_view_url = "products.quick_view?product_id=`$product.product_id`&prev_url=`$current_url`&result_ids='cart_status*'"}
                                    {if $quick_nav_ids}
                                        {$quick_nav_ids = ","|implode:$quick_nav_ids}
                                        {$quick_view_url = $quick_view_url|fn_link_attach:"n_items=`$quick_nav_ids`"}
                                    {/if}
    
                                    {if $product.min_qty}
                                        {$amount = $product.min_qty}
                                    {else}
                                        {$amount = 1}
                                    {/if}
                                    {if !empty($product.has_options)}
                                        <a class="cm-dialog-opener cm-dialog-auto-size ty-btn__primary ty-btn__big ty-btn__add-to-cart ty-btn" data-ca-view-id="{$product.product_id}" data-ca-target-id="product_quick_view" href="{$quick_view_url|fn_url}" data-ca-dialog-title="{__("quick_product_viewer")}" rel="nofollow" title="{__('select_options')}"><i class="icon-cogs"></i></a>
                                    {else}
                                        <a class="ty-btn__primary ty-btn__big ty-btn__add-to-cart ty-btn" onclick="$.ceAjax('request', fn_url('checkout.add?product_data[{$product.product_id}][product_id]={$product.product_id}&product_data[{$product.product_id}][amount]={$amount}&redirect_url={$current_url}'), { result_ids: 'cart_status*', full_render: true, method: 'post'});" rel="nofollow" title="{__('add_to_cart')}"><i class="icon-cart-plus"></i></a>
                                    {/if}
                                </div>
                            {/if}
                            <a href="{"products.view&product_id=`$product.product_id`"|fn_url}">
                                <div class="live-item-container">

                                    {if $addons.live_search.show_thumbnails == 'Y'}
                                        <div class="live-image-container">
                                            {include file="common/image.tpl" images=$product.main_pair image_width=$addons.live_search.thumbnails_width|default:50 image_height=$addons.live_search.thumbnails_height|default:50}
                                        </div>
                                    {/if}
                                    <div class="live-info-container">
                                        <span class="live-product-name product-title ">{$product.product nofilter}</span>
                                        {if $addons.live_search.show_product_price == 'Y' && $settings.General.allow_anonymous_shopping != 'hide_price_and_add_to_cart'}
                                            <span class="live-product-price ty-price-num">{include file="common/price.tpl" value=$product.price}</span>
                                        {elseif $addons.live_search.show_product_price == 'Y' && $auth.user_id != 0}
                                            <span class="live-product-price ty-price-num">{include file="common/price.tpl" value=$product.price}</span>
                                        {/if}
                                        {if $addons.live_search.show_product_code == 'Y'}
                                            <span class="live-product-code">{$product.product_code nofilter}</span>
                                        {/if}
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </a>
                            <div class="clearfix"></div>
                        </li>
                    {/foreach}
                    {if $categories}
                        <li class="live-item-li categories-header">
                            {__('categories')}
                        </li>
                        {foreach from=$categories item=category}
                            <li class="live-item-li">
                                <a href="{"categories.view&category_id=`$category.category_id`"|fn_url}">
                                    {$category.category}
                                </a>
                            </li>
                        {/foreach}
                    {/if}
                </ul>
                <div class="live-bottom-buttons clearfix">
                    <div class="live-left-bottom-buttom">
                        {if $search.page > 1}
                            <a data-href="{"products.live_search&q=`$search.q`&page=`$search.page - 1`"|fn_url}" onclick="switch_page($(this), {if $smarty.capture.search_input_id}{$smarty.capture.search_input_id|trim}{elseif $search_input_id}{$search_input_id}{else}0{/if}); return false;">{__("previous")}</a>
                        {/if}
                    </div>
                    <div class="live-middle-bottom-buttom">
                        {if $search.items_per_page < $search.total_items}
                            <a href="{"products.search&q=`$search.q`&subcats=Y&status=A&pshort=`{$addons.live_search.search_in_short_description}`&pfull=`{$addons.live_search.search_in_full_description}`&pname=Y&pkeywords=`{$addons.live_search.search_in_keywords}`&search_performed=Y"|fn_url}">{__("products_found")}: {$search.total_items}</a>
                        {else}
                            {__("products_found")}: {$search.total_items}
                        {/if}
                    </div>
                    <div class="live-right-bottom-buttom">
                        {if $search.items_per_page * $search.page < $search.total_items}
                            <a data-href="{"products.live_search&q=`$search.q`&page=`$search.page + 1`"|fn_url}" onclick="switch_page($(this), {if $smarty.capture.search_input_id}{$smarty.capture.search_input_id|trim}{elseif $search_input_id}{$search_input_id}{else}0{/if}); return false;">{__("next")}</a>
                        {/if}
                    </div>
                </div>
            {else}
                <div class="ty-no-items">{__("no_items")}</div>
            {/if}
        </div>
    {/if}
<!--live_reload_box{if $smarty.capture.search_input_id}_{$smarty.capture.search_input_id|trim}{elseif $search_input_id}_{$search_input_id}{/if}--></div>

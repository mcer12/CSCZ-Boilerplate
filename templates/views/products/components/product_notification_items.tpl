{hook name="products:notification_items"}
    {if $added_products}
        {foreach from=$added_products item=product key="key"}
            {hook name="products:notification_product"}
                <div class="product-added__item">
                    <div class="row">
                        <div class="col-auto product-added__image">
                            {include file="common/image.tpl" image_width="100" image_height="100" images=$product.main_pair no_ids=true}
                        </div>
                        <div class="col product-added__content">
                            <a href="{"products.view?product_id=`$product.product_id`"|fn_url}" class="product-added__title"><span class="none">{$product.amount}</span>x&nbsp;{$product.product_id|fn_get_product_name nofilter}</a>

                            {if $product.product_option_data}
                                {foreach from=$product.product_option_data item=po}
                                    {if $po.value}
                                        {assign var="has_option" value=true}
                                        {break}
                                    {/if}
                                {/foreach}

                                {if $has_option}
                                    {if !$no_block}
                                        <div class="product-options-info">
                                    {/if}
                                    {strip}
                                        {foreach from=$product.product_option_data item=po name=po_opt}
                                            {if ($po.option_type == "S" || $po.option_type == "R") && !$po.value}
                                                {continue}
                                            {/if}

                                            {if $po.variants}
                                                {assign var="var" value=$po.variants[$po.value]}
                                            {else}
                                                {assign var="var" value=$po}
                                            {/if}

                                            {capture name="options_content"}
                                                {if !$product.extra.custom_files[$po.option_id]}
                                                    {$var.variant_name|default:$var.value}
                                                {/if}

                                                {if $product.extra.custom_files[$po.option_id]}
                                                    {foreach from=$product.extra.custom_files[$po.option_id] item="file" name="po_files"}
                                                        {assign var="filename" value=$file.name|escape:url}
                                                        <a class="cm-no-ajax" href="{"orders.get_custom_file?order_id=`$order_info.order_id`&file=`$file.file`&filename=`$filename`"|fn_url}" title="{$file.name}">{$file.name|truncate:"40"}</a>
                                                        {if !$smarty.foreach.po_files.last}, {/if}
                                                    {/foreach}
                                                {/if}

                                                {if $settings.General.display_options_modifiers == "Y"}
                                                    {if $var.modifier|floatval}
                                                        &nbsp;({include file="common/modifier.tpl" mod_type=$var.modifier_type mod_value=$var.modifier display_sign=true})
                                                    {/if}
                                                {/if}
                                            {/capture}

                                            {if $smarty.capture.options_content|trim and $smarty.capture.options_content|trim != '&nbsp;'}
                                                <div class="product-option">
                                                    <span class="product-options-name">{$po.option_name}:&nbsp;</span>
                                                    <span class="product-options-content">
                                                        {$smarty.capture.options_content nofilter}{if $inline_option};{/if}&nbsp;
                                                    </span>
                                                </div>
                                            {/if}
                                            {if $fields_prefix}<input type="hidden" name="{$fields_prefix}[{$po.option_id}]" value="{$po.value}" />{/if}
                                        {/foreach}
                                    {/strip}
                                    {if !$no_block}
                                        </div>
                                    {/if}
                                {/if}
                            {/if}

                            {if !($settings.General.allow_anonymous_shopping == "hide_price_and_add_to_cart" && !$auth.user_id)}
                                <div class="product-added__price">
                                    {if !$hide_amount}
                                        {__("price_for")}&nbsp;{include file="common/price.tpl" value=$product.display_price span_id="price_`$key`" class="none"}
                                    {/if}
                                </div>
                            {/if}
                        </div>
                    </div>
                </div>
            {/hook}
        {/foreach}
    {else}
        {$empty_text}
    {/if}
{/hook}

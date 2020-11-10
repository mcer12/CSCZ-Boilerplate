{assign var="img_size" value=640}
{assign var="th_size" value=135}

{if $product.main_pair.icon || $product.main_pair.detailed}
    {assign var="image_pair_var" value=$product.main_pair}
{elseif $product.option_image_pairs}
    {assign var="image_pair_var" value=$product.option_image_pairs|reset}
{/if}

{if $image_pair_var.image_id}
    {assign var="image_id" value=$image_pair_var.image_id}
{else}
    {assign var="image_id" value=$image_pair_var.detailed_id}
{/if}

{if !$preview_id}
    {assign var="preview_id" value=$product.product_id|uniqid}
{/if}

<div class="thumbnail product-images cm-preview-wrapper">
<div class="product-images__item">
    {include file="common/image.tpl" obj_id="`$preview_id`_`$image_id`" images=$image_pair_var link_class="cm-image-previewer" lazy_load=true image_width=$img_size image_height=$img_size image_id="preview[product_images_`$preview_id`]"}
</div>
{foreach from=$product.image_pairs item="image_pair"}
    {if $image_pair}
        {if $image_pair.image_id}
            {assign var="img_id" value=$image_pair.image_id}
        {else}
            {assign var="img_id" value=$image_pair.detailed_id}
        {/if}
        <div class="product-images__item not-visible">
            {include file="common/image.tpl" images=$image_pair link_class="cm-image-previewer" obj_id="`$preview_id`_`$img_id`" lazy_load=true image_width=$img_size image_height=$img_size image_id="preview[product_images_`$preview_id`]"}
        </div>
    {/if}
{/foreach}
</div>

{if $product.image_pairs}
        <div class="product-thumbnails" id="images_preview_{$preview_id}">
            <div class="row">
                {strip}
                    {if $image_pair_var}
                        <div class="col-6 col-md-3">
                            <a data-ca-gallery-large-id="det_img_link_{$preview_id}_{$image_id}" class="product-thumbnails__item">
                                {include file="common/image.tpl" images=$image_pair_var image_width=$th_size image_height=$th_size lazy_load=true show_detailed_link=false obj_id="`$preview_id`_`$image_id`_mini"}
                            </a>
                        </div>
                    {/if}

                    {if $product.image_pairs}
                        {foreach from=$product.image_pairs item="image_pair"}
                            {if $image_pair}
                                {if $image_pair.image_id == 0}
                                    {assign var="img_id" value=$image_pair.detailed_id}
                                {else}
                                    {assign var="img_id" value=$image_pair.image_id}
                                {/if}
                                <div class="col-6 col-md-3">
                                    <a data-ca-gallery-large-id="det_img_link_{$preview_id}_{$img_id}" class="product-thumbnails__item">
                                        {include file="common/image.tpl" images=$image_pair image_width=$th_size image_height=$th_size lazy_load=true show_detailed_link=false obj_id="`$preview_id`_`$img_id`_mini"}
                                    </a>
                                </div>
                            {/if}
                        {/foreach}
                    {/if}
                {/strip}
            </div>
        </div>
{/if}

<script>
    $(function(){
        $('.product-thumbnails__item').click(function(){
            var id = $(this).parent().index();
           $('.product-images__item').addClass('not-visible').eq(id).removeClass('not-visible');
           console.log('click');
        });
    });
</script>

{script src="js/tygh/previewers/`$settings.Appearance.default_image_previewer`.previewer.js"}
{script src="design/themes/`$runtime.layout.theme_name`/js/product_image_gallery.js"}

{hook name="products:product_images"}{/hook}
{** block-description:carousel **}

{if $items}
    <div class="swiper-container slider" id="slider_{$block.snapping_id}">
        <!-- Additional required wrapper -->
        <div class="swiper-wrapper">
            {foreach from=$items item="banner" key="key"}
                <div class="swiper-slide slider__item">
                    {if $banner.type == "G" && $banner.main_pair.image_id}
                        {if $banner.url != ""}<a class="slider__link" href="{$banner.url|fn_url}" {if $banner.target == "B"}target="_blank"{/if}>{/if}
                        {include file="common/image.tpl" images=$banner.main_pair class="slider__image"}
                        {if $banner.url != ""}</a>{/if}
                    {else}
                        <div class="wysiwyg-content">
                            {$banner.description nofilter}
                        </div>
                    {/if}
                </div>
            {/foreach}
        </div>
        <!-- If we need pagination -->
        <div class="swiper-pagination"></div>

        <!-- If we need navigation buttons -->
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>

        {*
        <!-- If we need scrollbar -->
        <div class="swiper-scrollbar"></div>
        *}
    </div>


<script type="text/javascript">
(function(_, $) {
    $.ceEvent('on', 'ce.commoninit', function(context) {
        var mySwiper = new Swiper ('#slider_{$block.snapping_id}', {
            // Optional parameters
            //direction: 'vertical',
            spaceBetween: 30,
            loop: true,
            autoplay: {if $block.properties.delay && $block.properties.delay > 0}{ delay: {$block.properties.delay * 1000} } {else}false{/if},

            // If we need pagination
            pagination: {
                el: '#slider_{$block.snapping_id} .swiper-pagination',
                clickable: true
            },
            navigation: {
                nextEl: '#slider_{$block.snapping_id} .swiper-button-next',
                prevEl: '#slider_{$block.snapping_id} .swiper-button-prev',
            },
            {*
            scrollbar: {
                el: '#banner_slider_{$block.snapping_id} .swiper-scrollbar',
            },
            *}
        });
    });
}(Tygh, Tygh.$));
</script>
{/if}
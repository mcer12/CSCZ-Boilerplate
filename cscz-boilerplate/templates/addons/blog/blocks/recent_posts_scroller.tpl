{** block-description:blog.recent_posts_scroller **}

{if $items}

    {assign var="obj_prefix" value="`$block.block_id`000"}

    <div class="blog-slider">
        <div id="scroll_list_{$block.block_id}" class="swiper-container">
            <div class="swiper-wrapper">
                {foreach from=$items item="page"}
                    <div class="swiper-slide">
                        <a class="blog-slider__item" href="{"pages.view?page_id=`$page.page_id`"|fn_url}">
                            <div class="blog-slider__image">
                                {include file="common/image.tpl" image_height="500" obj_id=$page.page_id images=$page.main_pair}
                            </div>
                            <div class="blog-slider__content">
                                <time class="blog-date">{$page.timestamp|date_format:"`$settings.Appearance.date_format`"}</time>
                                <div class="blog-slider__title"><span>{$page.page}</span></div>
                            </div>
                        </a>
                    </div>
                {/foreach}
            </div>
        </div>

        {if $block.properties.outside_navigation == "Y"}
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
        {/if}

    </div>


    {include file="common/scroller_init_with_quantity.tpl"}

{/if}
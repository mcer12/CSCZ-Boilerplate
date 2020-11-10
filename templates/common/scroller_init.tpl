<script type="text/javascript">
(function(_, $) {
    $.ceEvent('on', 'ce.commoninit', function(context) {
        var elm = context.find('#scroll_list_{$block.block_id}');

        var item = {$block.properties.item_quantity|default:5},
            // default setting of carousel
            itemsDesktop = 4,
            itemsDesktopSmall = 3;
            itemsTablet = 2;

        if (item > 3) {
            itemsDesktop = item;
            itemsDesktopSmall = item - 1;
            itemsTablet = item - 2;
        } else if (item == 1) {
            itemsDesktop = itemsDesktopSmall = itemsTablet = 1;
        } else {
            itemsDesktop = item;
            itemsDesktopSmall = itemsTablet = item - 1;
        }

        var desktop = [1199, itemsDesktop],
            desktopSmall = [979, itemsDesktopSmall],
            tablet = [768, itemsTablet],
            mobile = [479, 1];

        {*if $block.properties.outside_navigation == "Y"}
        function outsideNav () {
            if(this.options.items >= this.itemsAmount){
                $("#owl_outside_nav_{$block.block_id}").hide();
            } else {
                $("#owl_outside_nav_{$block.block_id}").show();
            }
        }
        {/if*}

        if (elm.length) {

            var mySwiper = new Swiper ('#scroll_list_{$block.block_id}', {
                // Optional parameters
                //direction: 'vertical',
                slidesPerView: 4,
                spaceBetween: 20,
                speed: {$block.properties.speed|default:400},
                lazy: {
                    loadOnTransitionStart: true
                },
                //loop: true,
                //loopedSlides: 4,
                autoplay: {if $block.properties.not_scroll_automatically != "Y" && $block.properties.pause_delay && $block.properties.pause_delay > 0}{ delay: {$block.properties.pause_delay * 1000} } {else}false{/if},

                breakpoints: {
                    // when window width is >= 320px
                    320: {
                        slidesPerView: 2,
                    },
                    768: {
                        slidesPerView: itemsTablet,
                    },
                    992: {
                        slidesPerView: itemsDesktopSmall,
                    },
                    1200: {
                        slidesPerView: itemsDesktop,
                    }
                },
                // If we need pagination
                {if $block.properties.scroll_per_page == "Y"}
                pagination: {
                    el: '#scroll_list_{$block.block_id} .swiper-pagination',
                    clickable: true
                },
                {/if}
                {if $block.properties.outside_navigation == "Y"}
                navigation: {
                    nextEl: '#scroll_list_{$block.block_id} .swiper-button-next',
                    prevEl: '#scroll_list_{$block.block_id} .swiper-button-prev',
                },
                {/if}
                {*
                scrollbar: {
                    el: '#scroll_list_{$block.block_id} .swiper-scrollbar',
                },
                *}
            });

        }

    });
}(Tygh, Tygh.$));
</script>

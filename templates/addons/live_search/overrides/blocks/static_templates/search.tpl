{** block-description:tmpl_search **}

{capture name="live_search_wrapper_classes"}
    {strip}
    class="{if $block.properties.display == 'rounded_corners'}cp-live-search-rounded-corners {elseif $block.properties.display == 'underline_field'} cp-live-search-underline {/if} cp-live-search-{$block.properties.effect}{* {if $block.demo_typing != 'none'} cp-live-search-demo-typing {/if} *}
    "
{*     {if $block.demo_typing != 'none'}
        {if $block.demo_typing == 'search_words'}
             data-typing-content="search_words" 
        {else}
             data-typing-content="{$block.properties.demo_suggestions}" 
        {/if}
         id="cp_live_search_typing_{$block.grid_id}_{$block.block_id}"
    {/if} *}
    {/strip}
{/capture}

{if $block.properties.show_in_dropdown == 'Y'}
    <div class="ty-dropdown-box cp-live-search-dropdown">
        <div id="sw_live_search_dropdown_{$block.grid_id}_{$block.block_id}" class="ty-dropdown-box__title cm-combination">
            <a class="cp-live-search-dropdown-button"><i class="ty-icon-search"></i></a>
        </div>
        <div id="live_search_dropdown_{$block.grid_id}_{$block.block_id}" class="cm-popup-box ty-dropdown-box__content hidden">
{/if}

        <div {$smarty.capture.live_search_wrapper_classes nofilter}>
            {include file="common/search.tpl"}
        </div>

{if $block.properties.show_in_dropdown == 'Y'}
        </div>
    </div>
{/if}


{if $block.properties.effect == 'overlay' && !$smarty.capture.live_search_in_popup_exists|trim}
    <div class="cp-live-search-popup" id="live_search_in_popup">
        {include file="common/search.tpl"}
    </div>

    {capture name="live_search_in_popup_exists"}Y{/capture}
{/if}

{if $runtime.customization_mode.block_manager && $location_data.is_frontend_editing_allowed}
    {include file="backend:views/block_manager/frontend_render/wrappers/checkout_block_with_heading.tpl"}
{else}
    {if $content|trim}
        <div class="litecheckout__container">
            <div class="litecheckout__group">
                <div class="litecheckout__item">
                    <h2 class="litecheckout__step-title">{$block.name}</h2>
                </div>
            </div>
            {$content nofilter}
        </div>
    {/if}
{/if}

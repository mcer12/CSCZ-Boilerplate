{strip}

{if $capture_image}
    {capture name="image"}
{/if}

{if !$obj_id}
    {math equation="rand()" assign="obj_id"}
{/if}

{$image_data=$images|fn_image_to_display:$image_width:$image_height}
{$generate_image=$image_data.generate_image && !$external}

{if $show_detailed_link}
    <a id="det_img_link_{$obj_id}" {if $image_data.detailed_image_path && $image_id}data-ca-image-id="{$image_id}"{/if} class="{$link_class} {if $image_data.detailed_image_path}cm-previewer {/if}" data-ca-image-width="{$images.detailed.image_x}" data-ca-image-height="{$images.detailed.image_y}" {if $image_data.detailed_image_path}href="{$image_data.detailed_image_path}" title="{$images.detailed.alt}"{/if}>
{/if}

{if $image_data.image_path}
    <img class="{$valign} {$class}{if $lazy_load} lazy{/if}{if $generate_image} spinner{/if}"  {if $obj_id && !$no_ids}id="det_img_{$obj_id}"{/if} {if $generate_image}data-ca-image-path="{$image_data.image_path}"{/if} {if $lazy_load}src="{$images_dir}/icons/placeholder.png"{/if} {if $lazy_load}data-{/if}src="{if $generate_image}{$images_dir}/icons/spacer.gif{else}{$image_data.image_path}{/if}" alt="{$image_data.alt}" title="{$image_data.alt}" {if $image_onclick}onclick="{$image_onclick}"{/if} />
{else}
    <div class="no-image">
        <img src="{$images_dir}/icons/no_image.png" title="{__("no_image")}" alt="{__("no_image")}" />
    </div>
{/if}

{if $show_detailed_link}
    {if $images.detailed_id}
        <span class="previewer-icon hidden-xs"></span>
    {/if}
</a>
{/if}

{if $capture_image}
    {/capture}
    {capture name="icon_image_path"}
        {$image_data.image_path}
    {/capture}
    {capture name="detailed_image_path"}
        {$image_data.detailed_image_path}
    {/capture}
{/if}

{/strip}

{if $layout_data.layout_width != "fixed"}
    {if $parent_grid.width > 0}
        {$fluid_width = fn_get_grid_fluid_width($layout_data.width, $parent_grid.width, $grid.width)}
    {else}
        {$fluid_width = $grid.width}
    {/if}
{/if}

{if $grid.status == "A" && $content}
    {if $grid.alpha}
        {if empty($parent_grid)}
            <div class="{if ( $layout_data.layout_width != '' && $layout_data.layout_width != "fixed") || ($grid.user_class && $grid.user_class|strpos:"full-width" !== false)}{$grid.user_class|strip}{else}container{/if}">
        {elseif ($parent_grid.user_class && $parent_grid.user_class|strpos:"full-width" !== false)}
            <div class="{if ( $layout_data.layout_width != '' && $layout_data.layout_width != "fixed") || ($grid.user_class && $grid.user_class|strpos:"full-width" !== false)}{$grid.user_class|strip}{else}container{/if}">
            <div class="row">
        {else}
            <div class="row">
        {/if}

    {/if}
    {$width = $fluid_width|default:$grid.width}

    {if empty($parent_grid) && ($grid.user_class && $grid.user_class|strpos:"full-width" !== false)}

    {elseif empty($parent_grid) && $width == 12}
        <div class="{$grid.user_class}">
    {else}
        <section class="col-lg-{$width}{if $grid.offset} col-lg-offset-{$grid.offset}{/if}{if $grid.user_class && $grid.user_class|strpos:"full-width" !== false}{else} {$grid.user_class}{/if}" >
    {/if}

    {if $grid.wrapper}
        {include file=$grid.wrapper content=$content}
    {else}
        {$content nofilter}
    {/if}

    {if empty($parent_grid) && ($grid.user_class && $grid.user_class|strpos:"full-width" !== false)}

    {elseif empty($parent_grid) && $width == 12}
        </div>
    {else}
        </section>
    {/if}

{*if $grid.user_class && $grid.user_class|strpos:"fluid" !== false}
    <div class="{$grid.user_class}">
{else}
    <section class="col-lg-{$width}{if $grid.offset} col-lg-offset-{$grid.offset}{/if}{if $grid.user_class && $grid.user_class|strpos:"fluid" !== false}{else} {$grid.user_class}{/if}" >
{/if}

    {$content nofilter}

{if $grid.user_class && $grid.user_class|strpos:"fluid" !== false}
    </div>
{else}
    </section>
{/if*}

    {if $grid.omega}
        {if empty($parent_grid)}
            </div>
        {elseif ($parent_grid.user_class && $parent_grid.user_class|strpos:"full-width" !== false)}
            </div>
            </div>
        {else}
            </div>
        {/if}
    {/if}
{/if}
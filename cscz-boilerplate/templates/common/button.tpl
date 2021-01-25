{if $as == 'link' || $href}
    <a {$extra} class="btn {if $meta}{$meta}{else}btn-default{/if} {if $icon}btn-link{/if} {if $name}cm-submit {/if}{if $but_scroll}cm-scroll {/if}"{if $id} id="{$id}"{/if}{if $name} data-ca-dispatch="{$name}"{/if}{if $href} href="{$href|fn_url}"{/if}{if $onclick} onclick="{$onclick nofilter} return false;"{/if}{if $target} target="{$target}"{/if}{if $rel} rel="{$rel}"{/if}{if $external_click_id} data-ca-external-click-id="{$external_click_id}"{/if}{if $target_form} data-ca-target-form="{$target_form}"{/if}{if $but_scroll}data-ca-scroll="{$but_scroll}"{/if}{if $target_id} data-ca-target-id="{$target_id}"{/if}>{if $icon}<i class="glyphicon {$icon}"></i>{/if} {$text}</a>
{else}
    <button {if $id}id="{$id}"{/if} class="btn {if $meta}{$meta}{else}btn-default{/if}" type="submit" name="{$name}" {if $onclick}onclick="{$onclick nofilter}"{/if}>{$text}</button>
{/if}
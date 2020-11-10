<div class="colorpicker {if $cp_meta} {$cp_meta}{/if}" {$cp_attrs|default:[]|render_tag_attrs nofilter}>
    <input
        type="text"
        name="{$cp_name}"
        id="{$cp_id}"
        value="{$cp_value}"
        {if $show_picker}data-ca-spectrum-show-initial="true"{else}data-ca-view="palette"{/if}
        class="cm-colorpicker"
    >
</div>
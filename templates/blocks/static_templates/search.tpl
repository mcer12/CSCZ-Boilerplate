{** block-description:tmpl_search **}
<form action="{""|fn_url}" name="search_form" method="get">
    <input type="hidden" name="subcats" value="Y" />
    <input type="hidden" name="pcode_from_q" value="Y" />
    <input type="hidden" name="pshort" value="Y" />
    <input type="hidden" name="pfull" value="Y" />
    <input type="hidden" name="pname" value="Y" />
    <input type="hidden" name="pkeywords" value="Y" />
    <input type="hidden" name="search_performed" value="Y" />

    {hook name="search:additional_fields"}{/hook}
    {strip}
        {if $settings.General.search_objects}
            {assign var="search_title" value=__("search")}
        {else}
            {assign var="search_title" value=__("search_products")}
        {/if}
        <div class="input-group">
            <input type="text" class="form-control cm-hint" placeholder="{$search.q}" name="q" value="{$search.q}" id="search_input{$smarty.capture.search_input_id}" title="{$search_title}" />
            <div class="input-group-append">
                {include file="common/button.tpl" name="search.results" text=__("search") meta="btn btn-outline-secondary"}
            </div>

        </div>
    {/strip}
    {capture name="search_input_id"}{$block.snapping_id}{/capture}
</form>
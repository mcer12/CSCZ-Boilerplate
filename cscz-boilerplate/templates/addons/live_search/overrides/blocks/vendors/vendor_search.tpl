{** block-description:block_vendor_search **}

<div class="ty-search-block">
    <form action="{""|fn_url}" name="search_form" method="get">
        <input type="hidden" name="subcats" value="Y" />
        <input type="hidden" name="status" value="A" />
        <input type="hidden" name="pshort" value="Y" />
        <input type="hidden" name="pfull" value="Y" />
        <input type="hidden" name="pname" value="Y" />
        <input type="hidden" name="pkeywords" value="Y" />
        <input type="hidden" name="search_performed" value="Y" />
        <input type="hidden" name="company_id" value="{$company_id}" />
        <input type="hidden" name="category_id" value="{$category_data.category_id}" />
        <input type="hidden" name="dispatch" value="products.search">

        {hook name="vendor_search:additional_fields"}{/hook}

        {strip}
            <input type="text" name="q" value="{$search.q}" id="search_input{$smarty.capture.vendor_search_input_id}" data-company="{if $smarty.request.company_id}{$smarty.request.company_id}{/if}"  title="{__("block_vendor_search")}" class="ty-search-block__input cm-hint" />
            
            {include file="buttons/magnifier.tpl" but_name="companies.products" alt=__("search")}
            
        {/strip}
        
        {capture name="vendor_search_input_id"}{$block.snapping_id}{/capture}
        
    </form>
</div>

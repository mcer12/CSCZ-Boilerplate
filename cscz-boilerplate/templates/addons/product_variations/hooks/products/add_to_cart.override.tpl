{$show_select_variations_button=$show_select_variations_button|default:true}

{if !$details_page && $product.has_child_variations && $show_select_variations_button}
    {hook name="products:add_to_cart"}
        {include file="buttons/button.tpl" but_id="button_cart_`$obj_prefix``$obj_id`" but_text=__("product_variations.select_variation") but_name="" but_href="{"products.view?product_id=`$product.product_id`"|fn_url}" but_role=$opt_but_role but_meta="ty-btn__primary ty-btn__big"}
    {/hook}
{/if}

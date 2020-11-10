{** block-description:product_inquiry **}

<div id="content_product_inquiry{$product.product_id}">
    <form name="product_inquiry_form" action="{""|fn_url}" method="post" class="form">
        <input type="hidden" name="selected_section" value="product_inquiry" />
        <input type="hidden" name="redirect_url" value="{$config.current_url}" />
        <input type="hidden" name="inquiry_data[product]" value="{$product.product|escape:html}" />
        <input type="hidden" name="inquiry_data[product_code]" value="{$product.product_code|unescape}" />
        <input type="hidden" name="inquiry_data[product_url]" value="{"products.view?product_id=`$product.product_id`"|fn_url:'C':'http':'&'}" />


        <div class="form-group">
            <label for="send_yourname{$product.product_id}" class="form-label">{__("your_name")}:</label>
            <input id="send_yourname{$product.product_id}" size="50" class="form-control" type="text" maxlength="50" name="inquiry_data[from_name]" value="{if $inquiry_data.from_name}{$inquiry_data.from_name}{elseif $auth.user_id}{$user_info.firstname} {$user_info.lastname}{/if}" />
        </div>

        <div class="form-group">
            <label for="send_youremail{$product.product_id}" class="form-label cm-email cm-required">{__("your_email")}:</label>
            <input id="send_youremail{$product.product_id}" class="form-control" size="50" type="text" name="inquiry_data[from_email]" value="{if $inquiry_data.from_email}{$inquiry_data.from_email}{elseif $auth.user_id}{$user_info.email}{/if}" />
        </div>

        <div class="form-group">
            <label for="send_notes{$product.product_id}" class="cm-required form-label">{__("your_message")}:</label>
            <textarea id="send_notes{$product.product_id}"  class="form-control" rows="5" cols="72" maxlength="300" name="inquiry_data[notes]">{if $inquiry_data.notes}{$inquiry_data.notes}{/if}</textarea>
        </div>

        {if $addons.1clue_product_inquiry.use_image_verification == "Y"}
            {include file="common/image_verification.tpl" option="form_builder"}
        {/if}

        <div class="buttons-container text-center">
            {include file="buttons/button.tpl" but_text=__("send") but_meta="btn btn-primary" but_name="dispatch[product_inquiry.send]"}
        </div>

    </form>
</div>

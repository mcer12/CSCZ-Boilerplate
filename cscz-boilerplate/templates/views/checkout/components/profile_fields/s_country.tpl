{hook name="checkout:location_country"}
<div class="form-group litecheckout__field litecheckout__field--auto">
    <label class="litecheckout__label cm-required" for="litecheckout_country">{__("country")}: </label>
    <select data-ca-lite-checkout-field="user_data.s_country"
            class="form-control cm-country cm-location-shipping litecheckout__input litecheckout__input--selectable litecheckout__input--selectable--select"
            data-ca-lite-checkout-element="country"
            required
            id="litecheckout_country"
    >
        <option disabled>{__("select_country")}</option>
        {foreach $countries as $code => $country}
            <option value="{$code}"
                {if $user_data.s_country == $code}selected="selected"{/if}
            >{$country}</option>
        {/foreach}
    </select>

</div>
{/hook}
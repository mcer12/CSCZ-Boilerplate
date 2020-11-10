{$city = $user_data.s_city}
{$state_descr = $user_data.s_state_descr}
{$state = $user_data.s_state}
{$zipcode = $user_data.s_zipcode}
{$country = $user_data.s_country}

{hook name="checkout:location_city"}
{$city_state = ""}
{if $city}
    {$city_state = $city}
{/if}
{if $state_descr && $state_descr != "\Tygh\Location\Manager::EMPTY_STATE_CODE"|constant}
    {$city_state = "{$city_state} ({$state_descr})"}
{elseif $state && $state != "\Tygh\Location\Manager::EMPTY_STATE_CODE"|constant}
    {$city_state = "{$city_state} ({$state})"}
{/if}

<div class="litecheckout__field litecheckout__field--fill cm-field-container"
       data-ca-error-message-target-method="append">
    <input type="hidden"
           data-ca-lite-checkout-field="user_data.s_city"
           id="litecheckout_city"
           data-ca-lite-checkout-element="city"
           value="{$city}"
    />

    <input type="hidden"
           data-ca-lite-checkout-field="user_data.s_state"
           id="litecheckout_state"
           data-ca-lite-checkout-element="state"
           value="{$state}"
    />

    <input type="hidden"
           data-ca-lite-checkout-field="user_data.s_zipcode"
           id="litecheckout_zipcode"
           data-ca-lite-checkout-element="zipcode"
           value="{$zipcode}"
    />

    <input class="litecheckout__input litecheckout__input--selectable litecheckout__input--selectable--like-link cm-no-failed-msg cm-select-text"
           id="litecheckout_city_state"
           data-ca-select-id="litecheckout_city_state"
           type="search"
           value="{$city_state}"
           required
           data-ca-lite-checkout-element="city-autocomplete"
           data-ca-lite-checkout-last-value="{$city_state}"
           data-ca-lite-checkout-autocomplete-list=""
           data-ca-lite-checkout-autocomplete-url="{$city_autocomplete.url}"
           data-ca-lite-checkout-autocomplete-city-param="{$city_autocomplete.city_param}"
           data-ca-lite-checkout-autocomplete-country-param="{$city_autocomplete.country_param}"
           data-ca-lite-checkout-autocomplete-items-per-page-param="{$city_autocomplete.items_per_page_param}"
           data-ca-lite-checkout-autocomplete-items-per-page="{$city_autocomplete.items_per_page}"
           data-ca-lite-checkout-autocomplete-request-method="{$city_autocomplete.method|default:"get"}"
           data-ca-lite-checkout-autocomplete-hidden="{if $city_autocomplete.hidden|default:true}true{else}false{/if}"
           data-ca-lite-checkout-autocomplete-caching="{if $city_autocomplete.caching|default:true}true{else}false{/if}"
           placeholder="{__("lite_checkout.select_your_city")}"
           role="presentation"
           autocomplete="nope"
    />
    <label class="litecheckout__label cm-required"
           for="litecheckout_city_state"
    >{__("lite_checkout.city_and_state")}:</label>
</div>
{/hook}
{if !$show_profiles_on_checkout}
    {$show_city = false}
    {$show_state = false}
    {$show_country = false}
    {$exclude_fields = []}

    {foreach $profile_fields[$section] as $key => $profile_field}
        {if $profile_field.field_name == "s_city"}
            {$show_city = true}
            {if $city_autocomplete}
                {$profile_fields[$section][$key].template = "views/checkout/components/profile_fields/s_city_autocomplete.tpl"}
            {else}
                {$profile_fields[$section][$key].template = "views/checkout/components/profile_fields/s_city.tpl"}
            {/if}
        {elseif $profile_field.field_name == "s_state"}
            {$show_state = true}
            {$profile_fields[$section][$key].template = "views/checkout/components/profile_fields/s_state.tpl"}
        {elseif $profile_field.field_name == "s_country"}
            {$show_country = true}
            {$profile_fields[$section][$key].template = "views/checkout/components/profile_fields/s_country.tpl"}
        {/if}
    {/foreach}

    {if $show_city && $city_autocomplete}
        {$exclude_fields[] = "s_state"}
    {/if}

    <div class="litecheckout__container">
        <div class="litecheckout__group" id="litecheckout_step_location">
            <div class="litecheckout__group">
                <div class="litecheckout__item">
                    <h2 class="litecheckout__step-title">{$block_title|default:__("lite_checkout.deliver_to")}</h2>
                </div>

                {if $show_city|default:true || $show_state|default:true}
                    {include file="views/profiles/components/profiles_scripts.tpl"}
                {/if}

                {include
                    file="views/checkout/components/profile_fields.tpl"
                    profile_fields=$profile_fields
                    section="ProfileFieldSections::SHIPPING_ADDRESS"|enum
                    exclude=$exclude_fields
                }
            </div>

            <div id="litecheckout_autocomplete_dropdown" class="litecheckout__autocomplete-dropdown"></div>
        <!--litecheckout_step_location--></div>
    </div>
{/if}

{include file="views/profiles/components/profiles_scripts.tpl"}

<label for="user_profiles_list"
       class="cm-required cm-multiple-radios hidden"
       data-ca-validator-error-message="{__("checkout_select_profile_before_order")}"></label>

<div id="user_profiles_list"
    class="litecheckout__group"
    data-ca-error-message-target-node="#user_profiles_list_error_message_target">
    {foreach $user_profiles as $profile}
        <div class="ty-tiles litecheckout__field litecheckout__field--xsmall">
            <input type="radio"
                   name="profile_id"
                   id="user_profile_{$profile.profile_id}"
                   class="ty-tiles__radio hidden js-lite-checkout-user-profile-radio {if !$profile.is_selectable}js-lite-checkout-edit-profile-popup-opener{else}js-lite-checkout-profile-selector{/if}"
                   data-ca-profile-id="{$profile.profile_id}"
                   value="{$profile.profile_id}"
                   {if $profile.profile_id == $cart.profile_id && $profile.is_selectable}checked{/if}
            />

            <label id="user_profiles_{$profile.profile_id}"
                   class="ty-tiles__wrapper"
                   for="user_profile_{$profile.profile_id}"
            >
                <p class="ty-tiles__title">{$profile.s_address} {$profile.s_address_2}</p>

                {if $profile.s_city || $profile.s_state_descr || $profile.s_zipcode}
                    <p class="ty-tiles__text">{if
	                    $profile.s_city}{$profile.s_city}, {/if}{if
	                    $profile.s_state_descr}{$profile.s_state_descr}, {/if}{if
	                    $profile.s_zipcode}{$profile.s_zipcode}{/if}</p>
                {/if}
                {if $profile.s_country_descr}
                    <p class="ty-tiles__text">{$profile.s_country_descr}</p>
                {/if}
                <div class="ty-tiles__actions">
                    <a
                        class="cm-dialog-opener cm-dialog-auto-size cm-dialog-destroy-on-close ty-tiles__link"
                        href="{"checkout.update_profile?profile_id=`$profile.profile_id`"|fn_url}"
                        data-ca-target-id="edit_user_profile_{$profile.profile_id}"
                        data-ca-dialog-title="{__("editing_profile_name", ['[name]' => $profile.profile_name])}"
                    >{__("edit")}</a>

                    {if !$profile.is_selectable}
                        <a
                            class="cm-dialog-opener cm-dialog-auto-size cm-dialog-destroy-on-close hidden js-edit-profile-{$profile.profile_id}"
                            href="{"checkout.update_profile?profile_id=`$profile.profile_id`&switch_after_update=1"|fn_url}"
                            data-ca-target-id="edit_user_profile_{$profile.profile_id}"
                            data-ca-dialog-title="{__("editing_profile_name", ['[name]' => $profile.profile_name])}"
                        >{__("edit")}</a>
                    {/if}
                </div>
            </label>
        </div>
    {/foreach}
</div>
<div class="litecheckout__group"><div id="user_profiles_list_error_message_target" class="litecheckout__item"></div></div>

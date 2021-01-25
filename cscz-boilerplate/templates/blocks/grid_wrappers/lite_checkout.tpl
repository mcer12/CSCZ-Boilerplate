{script src="js/tygh/checkout.js"} {* legacy checkout functionality *}
{script src="js/tygh/checkout/lite_checkout.js"} {* lite checkout functionality *}
{script src="js/tygh/checkout/pickup_selector.js"}
{script src="js/tygh/checkout/pickup_search.js"}

{* login popup *}
{*if !$auth.user_id}
    <div id="litecheckout_login_block" class="hidden" title="{__("sign_in")}">
        <div class="ty-login-popup">
            {include file="views/auth/login_form.tpl"
                style="popup"
                id="litecheckout_login_block_inner"
            }
        </div>
    </div>
{/if*}

<div class="litecheckout litecheckout__form" id="litecheckout_form">
{*
    <h1 class="litecheckout__page-title">{__("checkout")}</h1>
*}
    <div data-ca-lite-checkout-element="form">
        <form name="litecheckout_payments_form"
              id="litecheckout_payments_form"
              action="{""|fn_url}"
              method="post"
              data-ca-lite-checkout-element="checkout-form"
              data-ca-lite-checkout-ready-for-checkout="true"
              class="litecheckout__payment-methods"
        >
            <input
                    type="hidden"
                    value="1"
                    name="ship_to_another"
                    data-ca-lite-checkout-field="ship_to_another"
                    data-ca-lite-checkout-auto-save-on-change="true"
            >
            <div
                    class="litecheckout__group litecheckout__grid"
                    {if $runtime.customization_mode.block_manager && $location_data.is_frontend_editing_allowed}
                        data-ca-block-manager-grid-id="{$grid.grid_id}"
                    {/if}
            >
                {$content nofilter}
            </div>

            {capture name="image_verification"}{include file="common/image_verification.tpl" option="checkout"}{/capture}

            {if $smarty.capture.image_verification}
                <div class="litecheckout__group">
                    {$smarty.capture.image_verification nofilter}
                </div>
            {/if}

            <div class="litecheckout__group litecheckout__submit-order" id="litecheckout_final_section">
                {include file="views/checkout/components/final_section.tpl"
                is_payment_step=true
                suffix=$payment.payment_id
                }
                <!--litecheckout_final_section--></div>
            <!--litecheckout_payments_form--></form>
    </div>
    <!--litecheckout_form--></div>

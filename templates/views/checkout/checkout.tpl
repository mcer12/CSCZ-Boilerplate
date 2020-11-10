{script src="js/tygh/checkout.js"} {* legacy checkout functionality *}
{script src="js/tygh/checkout/lite_checkout.js"} {* lite checkout functionality *}
{script src="js/tygh/checkout/pickup_selector.js"}
{script src="js/tygh/checkout/pickup_search.js"}

{$contact_info_section_position = $profile_field_sections["ProfileFieldSections::CONTACT_INFORMATION"|enum]["position"]}
{$shipping_section_position = $profile_field_sections["ProfileFieldSections::SHIPPING_ADDRESS"|enum]["position"]}
{$show_customer_fields_first = $contact_info_section_position < $shipping_section_position}

{* login popup *}
{if !$auth.user_id}
    <div id="litecheckout_login_block" class="hidden" title="{__("sign_in")}">
        <div class="ty-login-popup">
            {include file="views/auth/login_form.tpl"
                     style="popup"
                     id="litecheckout_login_block_inner"
            }
        </div>
    </div>
{/if}

<div class="litecheckout litecheckout__form" id="litecheckout_form">
    <h1 class="litecheckout__page-title">{__('checkout')}</h1>
    <div data-ca-lite-checkout-element="form">
        <form name="litecheckout_payments_form"
              id="litecheckout_payments_form"
              action="{"checkout.place_order"|fn_url}"
              method="post"
              data-ca-lite-checkout-element="checkout-form"
              data-ca-lite-checkout-ready-for-checkout="false"
              class="litecheckout__group litecheckout__payment-methods"
        >

            {include file="views/checkout/components/steps/customer.tpl"
                show_title=$show_customer_fields_first
                show_information=$show_customer_fields_first
                show_address=false
                show_notes=false
            }

            {include file="views/checkout/components/steps/shipping.tpl"}

            {include file="views/checkout/components/steps/customer.tpl"
                show_title=!$show_customer_fields_first
                show_information=!$show_customer_fields_first
                show_address=true
                show_notes=true
            }

            {include file="views/checkout/components/steps/payment.tpl"}
            <div class="litecheckout__group litecheckout__submit-order" id="litecheckout_final_section">
                {include file="views/checkout/components/final_section.tpl"
                is_payment_step=true
                suffix=$payment.payment_id
                }
            </div>
        <!--litecheckout_payments_form--></form>
    </div>
<!--litecheckout_form--></div>

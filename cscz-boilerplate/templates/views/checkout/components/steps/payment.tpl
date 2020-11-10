<div class="litecheckout__step litecheckout__container" id="litecheckout_step_payment">
    <div class="litecheckout__section">
        {if $show_title}
            <div class="litecheckout__group">
                <div class="litecheckout__item">
                    <h2 class="litecheckout__step-title">{__('block_payment_methods')}</h2>
                </div>
            </div>
        {/if}
        {include file="views/checkout/components/payments/payment_methods.tpl"
            payment_id=$cart.payment_id
            payment_methods=$payment_methods
            order_id=$order_id
            auth=$auth
            iframe_mode=$iframe_mode|default:false
        }
    </div>
<!--litecheckout_step_payment--></div>

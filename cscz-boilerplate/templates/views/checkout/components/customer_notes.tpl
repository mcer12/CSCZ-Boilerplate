<div class="cm-processing-personal-data" data-ca-processing-personal-data-without-click="true">
    <div class="litecheckout__group">
        <div class="form-group litecheckout__field">
            <label class="litecheckout__label" for="litecheckout_comment_to_shipping">
                {__("lite_checkout.delivery_note")}
            </label>
            <textarea data-ca-lite-checkout-field="customer_notes"
                          class="form-control litecheckout__input litecheckout__input--textarea"
                          id="litecheckout_comment_to_shipping"
                          autocomplete="disabled"
                          placeholder=" "
                          data-ca-lite-checkout-element="customer_notes"
                          data-ca-lite-checkout-auto-save="true"
                          aria-label="{__("lite_checkout.delivery_note")}"
                          title="{__("lite_checkout.delivery_note")}">{$cart.notes|trim}</textarea>
        </div>
    </div>
</div>

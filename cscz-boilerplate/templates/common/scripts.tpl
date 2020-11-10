{if !$config.tweaks.dev_js}
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
{/if}

{scripts}
{if $config.tweaks.dev_js}
    {script src="js/lib/jquery/jquery-3.3.1.min.js"}
    {script src="js/lib/jquery/jquery-migrate-3.0.1.min.js"}
{/if}

    {script src="js/lib/jqueryui/jquery-ui.custom.min.js" no-defer=true}
    {script src="design/themes/`$runtime.layout.theme_name`/js/lazyload.min.js" no-defer=true}

    {*
       When working with this code, please note that we will be modifying or removing it in the
       future versions of the developer theme.
    *}
    {script src="js/lib/modernizr/modernizr.custom.js"}
    {script src="js/tygh/core.js"}
    {script src="js/tygh/ajax.js"}
    {script src="js/tygh/history.js"}
    {script src="js/lib/autonumeric/autoNumeric.js"}
    {script src="js/lib/appear/jquery.appear-1.1.1.js"}

{if !$runtime.customization_mode.live_editor}
    {script src="js/lib/tools/tooltip.min.js"}
{/if}

{script src="js/tygh/editors/`$settings.Appearance.default_wysiwyg_editor`.editor.js"}

{script src="js/tygh/responsive.js"}

{if $runtime.customization_mode.live_editor}
    {script src="js/lib/autosize/jquery.autosize.js"}
    {script src="js/tygh/live_editor_mode.js"}
{/if}

{script src="design/themes/`$runtime.layout.theme_name`/js/bootstrap.bundle.min.js"}
{script src="design/themes/`$runtime.layout.theme_name`/js/swiper.min.js"}
{script src="design/themes/`$runtime.layout.theme_name`/js/scripts.js"}

    <script type="text/javascript">
        /* Lazyload */
        var lazyLoadInstance = new LazyLoad({
            elements_selector: ".lazy:not(.swiper-lazy)",
            load_delay: 0
        });
        (function(_, $) {

            _.tr({
                cannot_buy: '{__("cannot_buy")|escape:"javascript"}',
                no_products_selected: '{__("no_products_selected")|escape:"javascript"}',
                error_no_items_selected: '{__("error_no_items_selected")|escape:"javascript"}',
                delete_confirmation: '{__("delete_confirmation")|escape:"javascript"}',
                text_out_of_stock: '{__("text_out_of_stock")|escape:"javascript"}',
                items: '{__("items")|escape:"javascript"}',
                text_required_group_product: '{__("text_required_group_product")|escape:"javascript"}',
                save: '{__("save")|escape:"javascript"}',
                close: '{__("close")|escape:"javascript"}',
                notice: '{__("notice")|escape:"javascript"}',
                warning: '{__("warning")|escape:"javascript"}',
                error: '{__("error")|escape:"javascript"}',
                empty: '{__("empty")|escape:"javascript"}',
                text_are_you_sure_to_proceed: '{__("text_are_you_sure_to_proceed")|escape:"javascript"}',
                text_invalid_url: '{__("text_invalid_url")|escape:"javascript"}',
                error_validator_email: '{__("error_validator_email")|escape:"javascript"}',
                error_validator_phone: '{__("error_validator_phone")|escape:"javascript"}',
                error_validator_phone_mask: '{__("error_validator_phone_mask")|escape:"javascript"}',
                error_validator_integer: '{__("error_validator_integer")|escape:"javascript"}',
                error_validator_multiple: '{__("error_validator_multiple")|escape:"javascript"}',
                error_validator_password: '{__("error_validator_password")|escape:"javascript"}',
                error_validator_required: '{__("error_validator_required")|escape:"javascript"}',
                error_validator_zipcode: '{__("error_validator_zipcode")|escape:"javascript"}',
                error_validator_message: '{__("error_validator_message")|escape:"javascript"}',
                text_page_loading: '{__("text_page_loading")|escape:"javascript"}',
                error_ajax: '{__("error_ajax")|escape:"javascript"}',
                text_changes_not_saved: '{__("text_changes_not_saved")|escape:"javascript"}',
                text_data_changed: '{__("text_data_changed")|escape:"javascript"}',
                placing_order: '{__("placing_order")|escape:"javascript"}',
                file_browser: '{__("file_browser")|escape:"javascript"}',
                browse: '{__("browse")|escape:"javascript"}',
                more: '{__("more")|escape:"javascript"}',
                text_no_products_found: '{__("text_no_products_found")|escape:"javascript"}',
                cookie_is_disabled: '{__("cookie_is_disabled")|escape:"javascript"}',
                insert_image: '{__("insert_image")|escape:"javascript"}',
                image_url: '{__("image_url")|escape:"javascript"}',
                loading: '{__("loading")|escape:"javascript"}'
            });

            $.extend(_, {
                index_script: '{$config.customer_index|escape:javascript nofilter}',
                changes_warning: /*'{$settings.Appearance.changes_warning|escape:javascript nofilter}'*/'N',
                currencies: {
                    'primary': {
                        'decimals_separator': '{$currencies.$primary_currency.decimals_separator|escape:javascript nofilter}',
                        'thousands_separator': '{$currencies.$primary_currency.thousands_separator|escape:javascript nofilter}',
                        'decimals': '{$currencies.$primary_currency.decimals|escape:javascript nofilter}'
                    },
                    'secondary': {
                        'decimals_separator': '{$currencies.$secondary_currency.decimals_separator|escape:javascript nofilter}',
                        'thousands_separator': '{$currencies.$secondary_currency.thousands_separator|escape:javascript nofilter}',
                        'decimals': '{$currencies.$secondary_currency.decimals|escape:javascript nofilter}',
                        'coefficient': '{$currencies.$secondary_currency.coefficient}'
                    }
                },
                default_editor: '{$settings.Appearance.default_wysiwyg_editor}',
                default_previewer: '{$settings.Appearance.default_image_previewer}',
                current_path: '{$config.current_path|escape:javascript nofilter}',
                current_location: '{$config.current_location|escape:javascript nofilter}',
                images_dir: '{$images_dir}',
                notice_displaying_time: {if $settings.Appearance.notice_displaying_time}{$settings.Appearance.notice_displaying_time}{else}0{/if},
                cart_language: '{$smarty.const.CART_LANGUAGE}',
                language_direction: '{$language_direction}',
                default_language: '{$smarty.const.DEFAULT_LANGUAGE}',
                cart_prices_w_taxes: {if ($settings.Appearance.cart_prices_w_taxes == 'Y')}true{else}false{/if},
                regexp: [],
                current_url: '{$config.current_url|fn_url|escape:javascript nofilter}',
                current_host: '{$config.current_host|escape:javascript nofilter}',
                init_context: '{$smarty.request.init_context|escape:javascript nofilter}',
                phone_validation_mode: '{$settings.Appearance.phone_validation_mode}'
            });

            {if $live_editor_objects}
            $.extend(_, {
                live_editor_mode: true,
                live_editor_objects: {$live_editor_objects|json_encode nofilter}
            });
            {/if}

            {if !$smarty.request.init_context}

            $(document).ready(function(){
                $.runCart('C');
            });

            {/if}

            {if $config.tweaks.anti_csrf}
            // CSRF form protection key
            _.security_hash = '{""|fn_generate_security_hash}';
            {/if}

            lazyLoadInstance.update();

            $.ceEvent('on', 'ce.ajaxdone', function(e){ // refresh lazy images after ajax request
                lazyLoadInstance.update();
            });

        }(Tygh, Tygh.$));


    </script>


    {*
    {script src="js/lib/maskedinput/jquery.maskedinput.min.js"}

    {script src="js/lib/inputmask/jquery.inputmask.min.js"}
    {script src="js/lib/jquery-bind-first/jquery.bind-first-0.2.3.js"}
    {script src="js/lib/inputmask-multi/jquery.inputmask-multi.js"}

    {script src="js/tygh/phone_mask.js"}
    *}

{hook name="index:scripts"}
{/hook}

{/scripts}

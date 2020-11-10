{if $profile_fields[$section]}
    {$disable_all_fields = $disable_all_fields|default:false}
    {$fields = []}
    {$name_fields = []}
    {*$name_field_names = ["firstname", "lastname", "s_firstname", "s_lastname", "b_firstname", "b_lastname"]*}

    {foreach $profile_fields[$section] as $field_id => $field}
        {if $exclude && in_array($field.field_name, $exclude) || $include && !in_array($field.field_name, $include)}
            {continue}
        {/if}

        {*if in_array($field.field_name, $name_field_names)}
            {$name_fields[$field_id] = $field}
        {else}
            {$fields[$field_id] = $field}
        {/if*}
        {$fields[$field_id] = $field}

    {/foreach}

    {$prefix = ""}
    {if $section == "ProfileFieldSections::SHIPPING_ADDRESS"|enum}
        {$prefix = "s_"}
    {elseif $section == "ProfileFieldSections::BILLING_ADDRESS"|enum}
        {$prefix = "b_"}
    {/if}

    {$fullname_exists = $name_fields|count == 2}
    {if $fullname_exists}
        {$fullname_field = reset($name_fields)}
        {$name_field_id = key($name_fields)}
        {$fullname_field_lastname_first = in_array($fullname_field.field_name, ["lastname", "s_lastname", "b_lastname"])}
        {$fullname_field["field_name"] = "`$prefix`fullname"}
        {if $fullname_field_lastname_first}
            {$fullname_field_value = "{$user_data["`$prefix`lastname"]} {$user_data["`$prefix`firstname"]}"|trim}
            {$fullname_field.description = __("{$prefix}last_name_and_first_name")}
            {$fullname_field.attributes = ["data-ca-fullname-format" => "lastname_first"]}
        {else}
            {$fullname_field_value = "{$user_data["`$prefix`firstname"]} {$user_data["`$prefix`lastname"]}"|trim}
            {$fullname_field.description = __("{$prefix}first_name_and_last_name")}
            {$fullname_field.attributes = ["data-ca-fullname-format" => "firstname_first"]}
        {/if}
        {$fields[$name_field_id] = $fullname_field}
    {else}
        {$fields = $fields + $name_fields}
    {/if}

    {$fields = $fields|sort_by:"#position"}

    {foreach $fields as $field_id => $field}
        {$type = "text"}
        {$input_meta = ""}
        {$label_meta = ""}

        {$field_type_class_postfix = "litecheckout__field--"}

        {if $field.field_type == "ProfileFieldTypes::PHONE"|enum}
            {$type = "tel"}
            {$label_meta = " cm-mask-phone-label"}
            {$input_meta = " cm-mask-phone"}
            {$field_type_class_postfix = "{$field_type_class_postfix}input"}
        {elseif $field.field_type == "ProfileFieldTypes::EMAIL"|enum}
            {$type = "text"}
            {$label_meta = " cm-email"}
            {$field_type_class_postfix = "{$field_type_class_postfix}input"}
        {elseif $field.field_type == "ProfileFieldTypes::STATE"|enum}
            {$field_type_class_postfix = "{$field_type_class_postfix}state"}
        {elseif $field.field_type == "ProfileFieldTypes::COUNTRY"|enum}
            {$field_type_class_postfix = "{$field_type_class_postfix}country"}
        {elseif $field.field_type == "ProfileFieldTypes::CHECKBOX"|enum}
            {$field_type_class_postfix = "{$field_type_class_postfix}checkbox"}
        {elseif $field.field_type == "ProfileFieldTypes::DATE"|enum}
            {$field_type_class_postfix = "{$field_type_class_postfix}date"}
        {elseif $field.field_type == "ProfileFieldTypes::INPUT"|enum}
            {$field_type_class_postfix = "{$field_type_class_postfix}input"}
        {elseif $field.field_type == "ProfileFieldTypes::PASSWORD"|enum}
            {$field_type_class_postfix = "{$field_type_class_postfix}password"}
        {elseif $field.field_type == "ProfileFieldTypes::RADIO"|enum}
            {$field_type_class_postfix = "{$field_type_class_postfix}radio"}
        {elseif $field.field_type == "ProfileFieldTypes::SELECT_BOX"|enum}
            {$field_type_class_postfix = "{$field_type_class_postfix}selectbox"}
        {elseif $field.field_type == "ProfileFieldTypes::TEXT_AREA"|enum}
            {$field_type_class_postfix = "{$field_type_class_postfix}textarea"}
        {elseif $field.field_type == "ProfileFieldTypes::POSTAL_CODE"|enum}
            {$field_type_class_postfix = "{$field_type_class_postfix}input"}
        {elseif $field.field_type == "ProfileFieldTypes::ADDRESS_TYPE"|enum}
            {$field_type_class_postfix = "{$field_type_class_postfix}radio"}
        {/if}

        {* fallback *}
        {if $field_type_class_postfix === "litecheckout__field--"}
            {$field_type_class_postfix = "{$field_type_class_postfix}custom"}
        {/if}

        {if $field.checkout_required == "Y" || $field.checkout_required == "1"}
            {$label_meta = "`$label_meta` cm-required"}
        {/if}

        {if $field.is_default == "YesNo::YES"|enum}
            {$field_name = "user_data[`$field.field_name`]"}
            {$field_value = $user_data[$field.field_name]}
            {$field_name_helper = "user_data.`$field.field_name`"}
        {else}
            {$field_name = "user_data[fields][`$field.field_id`]"}
            {$field_value = $user_data["fields"][$field.field_id]}
            {$field_name_helper = "user_data.fields.`$field.field_id`"}
        {/if}

        {if $field.field_name == "`$prefix`fullname"}
            {$field_value = $fullname_field_value}
        {/if}

        {$wrapper_class = $field.wrapper_class}
        {if !$wrapper_class}
            {$wrapper_class = "litecheckout__field--small"}
            {if $field.field_type == "ProfileFieldTypes::TEXT_AREA"|enum}
                {$wrapper_class = "litecheckout__field--full"}
            {/if}
        {/if}

        {if $field.is_disabled || $disable_all_fields}
            {$field.is_disabled = true}
            {$input_meta = "{$input_meta} disabled"}
            {$field.attributes["disabled"] = "disabled"}
        {/if}

        {$field_id = "litecheckout_`$field.field_name`"}

        {if $field.template}
            {include file=$field.template}
        {else}
            {include file="views/checkout/components/profile_fields/field.tpl"}
        {/if}
    {/foreach}
{/if}

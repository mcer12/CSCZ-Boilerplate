{if $auth.user_id}
    {include file="addons/gdpr/componentes/agreement_checkbox.tpl" type="profiles_update" agreement_required=true}
{else}
    {include file="addons/gdpr/componentes/agreement_checkbox.tpl" type="user_registration" agreement_required=true}
{/if}

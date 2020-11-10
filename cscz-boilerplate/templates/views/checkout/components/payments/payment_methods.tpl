{if $cart}
    {include file="views/checkout/components/payments/checkout.tpl"}
{else}
    {include file="views/checkout/components/payments/repay.tpl"}
{/if}

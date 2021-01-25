<div class="litecheckout__container">
    {if !$suffix}
        {$suffix = ""|uniqid}
    {/if}

    <div class="litecheckout__item">
        <div class="litecheckout__terms">
            {include file="views/checkout/components/terms_and_conditions.tpl" suffix=$suffix}
        </div>


    </div>
</div>

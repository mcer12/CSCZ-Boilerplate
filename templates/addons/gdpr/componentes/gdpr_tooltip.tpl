<div id="gdpr_tooltip_{$target_elem_id}"
    class="tooltip cm-gdpr-tooltip arrow-down ty-gdpr-tooltip ty-gdpr-tooltip--light center"
    data-ce-gdpr-target-elem="{$target_elem_id}">
    <span class="tooltip-arrow"></span>
    <button type="button" class="cm-gdpr-tooltip--close close ty-gdpr-tooltip--close">×</button>
    <div class="ty-gdpr-tooltip-content">
        {hook name="gdpr:tooltip_content"}
        {$app["addons.gdpr.service"]->getFullAgreement($type) nofilter}
        {/hook}
    </div>
</div>
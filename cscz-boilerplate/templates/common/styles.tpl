{* To use fontawesome, uncomment this line and remove {style src="./tygh/icons.less"} *}
{* <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"> *}

{styles use_scheme=true reflect_less=$reflect_less}
{hook name="index:styles"}

{* old jQueryUI is still used by CS-Cart core files and can't be easilly replaced without rewriting core javascripts... *}
{style src="core/jqueryui.less"}
{* CSCZ theme uses Swiper instead of owl carousel *}
{style src="core/swiper.less"}

{style src="bootstrap.dist.less"}
{*style src="../lib/bootstrap/3.3.6/css/bootstrap.min.css"*}
{*style src="icons.less"*}
{style src="styles.dist.less"}
{*style src="components/cart_responsive.less"*}
    
{/hook}

{* Translation mode *}
{if $runtime.customization_mode.live_editor || $runtime.customization_mode.design}
    {style src="../../responsive/css/tygh/design_mode.css"}
{/if}

    TEST
{* Theme editor mode *}
{if $runtime.customization_mode.theme_editor || $smarty.session.customize_theme}
    {style src="../../responsive/css/tygh/theme_editor.css"}
{/if}

{* Block manager mode *}
{if $runtime.customization_mode.block_manager}
    {style src="../../responsive/css/tygh/components/block_manager.less"}
{/if}

{/styles}

<div class="ty-geo-maps__geolocation__location-selector" data-ca-geo-map-location-element="location_selector">
    {hook name="geo_maps:customer_location_selector"}
    <div class="ty-geo-maps__geolocation__map"
         data-ca-geo-map-location-element="map"
    >{* the map will be rendered here *}</div>

    <div class="ty-geo-maps__geolocation__map__load-error hidden"
         data-ca-geo-map-location-element="map_load_error_message">
        {__("geo_maps.location_detection_disabled")}
    </div>

    <div class="buttons-container">
        {include file="buttons/button.tpl"
            but_role="text"
            but_meta="ty-btn__primary cm-dialog-closer ty-btn ty-float-right ty-geo-maps__geolocation__set-location pending"
            but_text=__("ok")
        }
    </div>
    {/hook}
</div>

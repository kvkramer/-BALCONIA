import mapboxgl from 'mapbox-gl';

const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    // style: 'mapbox://styles/mapbox/streets-v10'
    style: 'mapbox://styles/meallie/ckas1vyrs2udf1insf8dxehqi'
  });
};

// var geojson = [
//   {
//     type: 'Feature',
//     geometry: {
//       type: 'Point',
//     },
//     properties: {
//       'marker-color': '#3bb2d0',
//       'marker-size': 'large',
//       'marker-symbol': 'rocket'
//     }
//   },
//   ];

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

    // document.getElementById('locate-position').addEventListener('click', () => {
    //   map.locate({setView: true, maxZoom: 15});
    // });


const geolocate = new mapboxgl.GeolocateControl({
  positionOptions: {
    enableHighAccuracy: true
  },
    trackUserLocation: true,
    fitBoundsOptions: {maxZoom:12}
});



const initMapbox = () => {
  if (document.getElementById('map')) {
    const mapElement = document.getElementById('map');
    const map = buildMap(mapElement);
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
    map.addControl(geolocate);
  }
};

export { initMapbox };

$(document).ready(function() {
  var boat_address = $('#boat_address').get(0);

  if (boat_address) {
    var autocomplete = new google.maps.places.Autocomplete(boat_address, { types: ['geocode'] });
    google.maps.event.addListener(autocomplete, 'place_changed');
    google.maps.event.addDomListener(boat_address, 'keydown', function(e) {
      if (e.keyCode == 13) {
        e.preventDefault(); // Do not submit the form on Enter.
      }
    });
  }
});



$(document).ready(function() {
  var search = $('#search').get(0);

  if (search) {
    var autocomplete = new google.maps.places.Autocomplete(search, { types: ['geocode'] });
    google.maps.event.addListener(autocomplete, 'place_changed');
    google.maps.event.addDomListener(search, 'keydown', function(e) {
      if (e.keyCode == 13) {
        e.preventDefault(); // Do not submit the form on Enter.
      }
    });
  }
});






function getAddressComponents(place) {
  // If you want lat/lng, you can look at:
  // - place.geometry.location.lat()
  // - place.geometry.location.lng()

  var street_number = null;
  var route = null;
  var zip_code = null;
  var city = null;
  var country_code = null;
  for (var i in place.address_components) {
    var component = place.address_components[i];
    for (var j in component.types) {
      var type = component.types[j];
      if (type == 'street_number') {
        street_number = component.long_name;
      } else if (type == 'route') {
        route = component.long_name;
      } else if (type == 'postal_code') {
        zip_code = component.long_name;
      } else if (type == 'locality') {
        city = component.long_name;
      } else if (type == 'country') {
        country_code = component.short_name;
      }
    }
  }

  return {
    address: street_number + ' ' + route + ' ' + zip_code + ' ' + city + ' ' + country_code
  };
}

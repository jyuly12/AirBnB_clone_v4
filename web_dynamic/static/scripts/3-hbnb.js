document.addEventListener('DOMContentLoaded', (event) => {
  // check api status
  // $.get('http://127.0.0.1:5001/api/v1/status/', function (data, status) {
  $.get('http://0.0.0.0:5001/api/v1/status/', function (data, status) {
    if (status === 'success') {
      $('div#api_status').addClass('available');
    } else { $('div#api_status').removeClass('available'); }
  });

  // show amenities list dynamicaly
  const dict = {};
  $('input[type=checkbox]').on('click', function () {
    const amenityId = $(this).attr('data-id');
    const amenityName = $(this).attr('data-name');

    if (dict[amenityName]) {
      delete dict[amenityName];
    } else { // delete the id of the amenity
      dict[amenityName] = amenityId;
    }
    let text = '';
    for (let i = 0; Object.entries(dict)[i]; i++) {
      if (i > 0) { text += ', '; }
      text += Object.entries(dict)[i][0];
    }
    $('.amenities h4').text(text);
  });

  $.ajax({
    // url: 'http://127.0.0.1:5001/api/v1/places_search/',
    url: 'http://0.0.0.0:5001/api/v1/places_search/',
    headers: { 'Content-Type': 'application/json' },
    method: 'POST',
    data: JSON.stringify({}),
    success: function (data) {
      console.log(data);
      for (let i = 0; Object.entries(data)[i]; i++) {
        const name = data[i].name;
        const price = data[i].price_by_night;
        const max = data[i].max_guest;
        const rooms = data[i].number_rooms;
        const bathrooms = data[i].number_bathrooms;
        const description = data[i].description;
        const text = '<article> <div class="title_box"><h2>' +
                    name +
                    '</h2><div class="price_by_night">$' +
                    price +
                    '</div></div><div class="information"><div class="max_guest"> ' +
                    max + ' Guest{% if ' + max + ' != 1 %}s{% endif %}</div><div class="number_rooms"> ' +
                    rooms + ' Bedroom{% if ' + rooms + ' != 1 %}s{% endif %}</div><div class="number_bathrooms">' +
                    bathrooms + ' Bathroom{% if ' + bathrooms + ` != 1 %}s{% endif %}</div></div><div class="description">
                    ` + description + '</div></article>';
        $('.places').append(text);
      }
    }
  });
});

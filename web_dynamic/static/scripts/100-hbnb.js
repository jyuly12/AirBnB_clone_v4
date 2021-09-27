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
  $('.amenities input[type=checkbox]').on('click', function () {
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
    // show states and places list dynamically
    const dict_2 = {};
  $('.locations input[type=checkbox]').on('click', function () {
      console.log('entra')
      const amenityId = $(this).attr('data-id');
    const amenityName = $(this).attr('data-name');

    if (dict_2[amenityName]) {
      delete dict_2[amenityName];
    } else { // delete the id of the amenity
      dict_2[amenityName] = amenityId;
    }
    let text = '';
    for (let i = 0; Object.entries(dict_2)[i]; i++) {
      if (i > 0) { text += ', '; }
      text += Object.entries(dict_2)[i][0];
    }
    $('.locations h4').text(text);
  });

  $.ajax({
    // url: 'http://127.0.0.1:5001/api/v1/places_search/',
    url: 'http://0.0.0.0:5001/api/v1/places_search/',
    headers: { 'Content-Type': 'application/json' },
    method: 'POST',
    data: JSON.stringify({}),
    success: function (data) {
      for (let i = 0; Object.entries(data)[i]; i++) {
        let text = '<article> <div class="title_box"><h2>' + data[i].name + '</h2><div class="price_by_night">$' + data[i].price_by_night +
                    '</div></div><div class="information"><div class="max_guest">' + data[i].max_guest + ' Guest';
        if (data[i].max_guest !== 1) { text += 's'; }
        text += '</div><div class="number_rooms">' + data[i].number_rooms + ' Bedroom';
        if (data[i].number_rooms !== 1) { text += 's'; }
        text += '</div><div class="number_bathrooms">' + data[i].number_bathrooms + ' Bathroom';
        if (data[i].number_bathrooms !== 1) { text += 's'; }
        text += '</div></div><div class="description">' + data[i].description + '</div></article>';
        $('.places').append(text);
      }
    }
  });
});
